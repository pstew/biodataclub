

library(shiny)
library(ggplot2)
library(shinyjqui)
library(ggrepel)
library(data.table)
library(DT)
library(dplyr)
library(svglite)


input_deg_file <- "BCLA_BCAN_HCRN_NodePos_DEG_NeoAdjYesNo.txt"

# Global Plot Variables
upRed <- "lightcoral"
dnBlue <- "cadetblue3"
mdGray <- "gray70"

#increase file upload size
options(shiny.maxRequestSize=5000*1024^2)

# UI ---------------------------------------------------------------------------
# Define UI
ui <- fluidPage(
  titlePanel("Volcano Plot Viewer"),
  sidebarLayout(
    sidebarPanel(
      p(),
      fileInput("deg_file","Upload Data"),
      h3("Volcano Plot Parameters"),
      fluidRow(
        column(4,
               selectizeInput("Feature_column","Feature Column", choices = NULL, selected = 1),
               numericInput("top_hits", "Number of Top Hits:", value = 5, min = 1, step = 1)
        ),
        column(4,
               selectizeInput("LogFC_column","LogFC Column", choices = NULL, selected = 1),
               numericInput("logfc_cutoff", "Log FC Cutoff:", value = 0, min = 0, step = 0.5)
        ),
        column(4,
               selectizeInput("Pval_column","P-value Column", choices = NULL, selected = 1),
               numericInput("pval_cutoff", "P-value Cutoff:", value = 0.05, min = 0, step = 0.01)
        )
      ),
      h3("Select Features to Highlight"),
      div(DT::dataTableOutput("select_feature_df"), style = "font-size:12px"),
      uiOutput("hover_info")
    ),
    mainPanel(
      jqui_resizable(plotOutput("volcano",height = "800px", width = "90%",
                                # plot sends coordinate to the server if mouse is paused over plot
                                hover = hoverOpts("plot_hover", # ID
                                                  delay = 10,   # millisecond delay
                                                  delayType = "debounce"))), # debounce suspends events while cursor is moving
      downloadButton("volcano_dnld","SVG")
    )
  )
)

# Check if user input file in script
if (exists("input_deg_file")) {
  if (!isTruthy(input_deg_file)) {
    input_deg_file <- NULL
  }
} else {
  input_deg_file <- NULL
}

# Server -----------------------------------------------------------------------
# Define Server
server <- function(input, output, session) {
  
  # Reactive values ------------------------------------------------------------
  deg_df_file <- reactiveVal(input_deg_file)
  deg_df_raw <- reactiveVal()
  deg_df <- reactiveVal()
  logFC_col <- reactiveVal()
  Pval_col <- reactiveVal()
  
  # Read In Data ---------------------------------------------------------------
  
  # Trouble shooting save
  observe({
    deg_df_file <- deg_df_file()
    deg_df_raw <- deg_df_raw()
    deg_df <- deg_df()
    logFC_col <-logFC_col()
    Pval_col <- Pval_col()
    save(list = ls(), file = "troubleshoot_env.RData", envir = environment())
  })
  
  ## Observe DEG file input in UI
  observeEvent(input$deg_file, {
    deg_df_file(input$deg_file$datapath)
  })
  ## Read in DEG file
  observe({
    req(deg_df_file())
    input_file <- deg_df_file()
    deg <- as.data.frame(fread(input_file,na.strings = c("","NA")))
    deg_df_raw(deg)
  })
  ## Update Select inputs for user to select figure columns
  observe({
    req(deg_df_raw())
    deg <- deg_df_raw()
    deg_cols <- colnames(deg)
    
    logFC_col_selected <- grep("logfc",deg_cols,ignore.case = T,value = T)[1]
    logFC_col_selected <- ifelse(is.na(logFC_col_selected),1,logFC_col_selected)
    Pval_col_selected <- grep("p[[:punct:]]val|pval|p val",deg_cols,ignore.case = T, value = T)[1]
    Pval_col_selected <- ifelse(is.na(Pval_col_selected),1,Pval_col_selected)
    
    updateSelectizeInput(session,"Feature_column", choices = deg_cols, selected = deg_cols[1], server = T)
    updateSelectizeInput(session,"LogFC_column", choices = deg_cols, selected = logFC_col_selected, server = T)
    updateSelectizeInput(session,"Pval_column", choices = deg_cols, selected = Pval_col_selected, server = T)
  })
  
  ## Order DEG table by pvalue column
  observe({
    req(deg_df_raw())
    deg <- deg_df_raw()
    logfc_col <- input$LogFC_column
    pval_col <- input$Pval_column
    if (isTruthy(pval_col)) {
      deg[,pval_col] <- as.numeric(deg[,pval_col])
      deg <- deg[order(as.numeric(deg[,pval_col])),]
    }
    if (isTruthy(logfc_col)) {
      deg[,logfc_col] <- as.numeric(deg[,logfc_col])
    }
    deg_df(deg)
  })
  
  # Table ----------------------------------------------------------------------
  ## Input data table for feature selection
  output$select_feature_df <- DT::renderDataTable({
    req(deg_df())
    deg <- deg_df()
    DT::datatable(deg,
                  options = list(lengthMenu = c(5,10, 20, 100, 1000),
                                 pageLength = 5,
                                 scrollX = T),
                  rownames = F)
  })
  
  # Hover ----------------------------------------------------------------------
  ## UI element for plot hover feature
  output$hover_info <- renderUI({
    req(deg_df(),input$Feature_column,input$LogFC_column,input$Pval_column)
    deg <- deg_df()
    feat_col <- input$Feature_column
    logfc_col <- input$LogFC_column
    pval_col <- input$Pval_column
    
    if (all(c(feat_col,logfc_col,pval_col) %in% colnames(deg))) {
      deg[,logfc_col] <- as.numeric(deg[,logfc_col])
      deg[,pval_col] <- as.numeric(deg[,pval_col])
      deg <- deg %>%
        select(any_of(c(feat_col,logfc_col,pval_col)))
      deg[,paste0("-log10(",pval_col,")")] <- -log10(deg[,pval_col])
      hover <- input$plot_hover
      point <- nearPoints(deg, hover, threshold = 10, maxpoints = 1, addDist = FALSE)
      if (nrow(point) == 0) return(NULL)
      wellPanel(
        p(HTML(paste0("<b> Feature: </b>", point[1], "<br/>",
                      "<b> Fold change: </b>", point[2], "<br/>",
                      "<b> P Value: </b>", point[3], "<br/>",
                      NULL
        ))))
    }
    
  })
  
  # Plots ----------------------------------------------------------------------
  
  volcano_df_react <- reactive({
    req(deg_df(),input$Feature_column,input$LogFC_column,input$Pval_column)
    deg <- deg_df()
    logfc_col <- input$LogFC_column
    pval_col <- input$Pval_column
    logfc_cut <- input$logfc_cutoff
    pval_cut <- input$pval_cutoff
    if (all(c(logfc_col,pval_col) %in% colnames(deg))) {
      deg["threshold"] <- "none"
      deg[which(deg[,logfc_col] > abs(logfc_cut) & deg[,pval_col] < pval_cut), "threshold"] <- "up"
      deg[which(deg[,logfc_col] < -abs(logfc_cut) & deg[,pval_col] < pval_cut), "threshold"] <- "down"
      deg
    }
  })
  
  volcano_anno_react <- reactive({
    req(volcano_df_react())
    deg <- volcano_df_react()
    logfc_col <- input$LogFC_column
    pval_col <- input$Pval_column
    logfc_cut <- input$logfc_cutoff
    pval_cut <- input$pval_cutoff
    top_hits <- input$top_hits
    feat_highlight <- input$select_feature_df_rows_selected
    if (all(c(logfc_col,pval_col) %in% colnames(deg))) {
      data_hits_up <- deg[head(which(deg[,logfc_col] > abs(logfc_cut) & deg[,pval_col] < pval_cut), n = top_hits),]
      data_hits_dn <- deg[head(which(deg[,logfc_col] < -abs(logfc_cut) & deg[,pval_col] < pval_cut), n = top_hits),]
      data_hits <- rbind(data_hits_up,data_hits_dn)
      if (length(feat_highlight) > 0) {
        data_hits_selec <- deg[feat_highlight,]
        data_hits <- unique(rbind(data_hits,data_hits_selec))
      }
      rownames(data_hits) <- data_hits[,1]
      data_hits
    }
  })
  
  ## Reactive for volcano plot
  volcano_react <- reactive({
    req(volcano_df_react())
    req(volcano_anno_react())
    deg <- volcano_df_react()
    data_hits <- volcano_anno_react()
    
    feat_col <- input$Feature_column
    logfc_col <- input$LogFC_column
    pval_col <- input$Pval_column
    logfc_cut <- input$logfc_cutoff
    pval_cut <- input$pval_cutoff
    
    if (all(c(feat_col,logfc_col,pval_col) %in% colnames(deg))) {
      vol_plot <- ggplot(data = deg, aes(x = !!sym(logfc_col), y = -log10(!!sym(pval_col)))) +
        geom_point(size = 2, shape = 16) +
        theme_light(base_size = 16) +
        aes(color = threshold) +
        scale_color_manual(values = c("up" = upRed,"down" = dnBlue, "none" = mdGray)) +
        geom_vline(xintercept = c(-abs(logfc_cut),abs(logfc_cut)), linetype="dashed", color="black") +
        geom_hline(yintercept = -log10(pval_cut), linetype="dashed", color="black") +
        theme(legend.position = "none",
              axis.text = element_text(size=18),
              axis.title = element_text(size=24))
      if (nrow(data_hits) > 0) {
        vol_plot <- vol_plot + geom_text_repel(
          data =  data_hits,
          aes(label = data_hits[,feat_col]),
          size = 4,
          color="black",
          box.padding = unit(0.9, "lines"),
          point.padding = unit(.3+4*0.1, "lines"),
          max.overlaps = 50)
        vol_plot <- vol_plot +
          geom_point(data = data_hits,
                     aes(x = !!sym(logfc_col), y = -log10(!!sym(pval_col))),
                     pch = 21,
                     color = "black",
                     size = 2)
      }
      vol_plot
    }
  })
  
  ## Render the volcano plot
  output$volcano <- renderPlot({
    
    req(volcano_react())
    p <- volcano_react()
    p
    
  })
  
  # Downloads ------------------------------------------------------------------
  ## Save the volcano plot as SVG
  output$volcano_dnld <- downloadHandler(
    filename = function() {
      paste0("VolcanoPlot_",Sys.Date(),".svg")
    },
    content = function(file) {
      p <- volcano_react()
      ggsave(file,p, width = 10, height = 8)
    }
  )
  
  
  
}

# Run the application
shinyApp(ui = ui, server = server)
