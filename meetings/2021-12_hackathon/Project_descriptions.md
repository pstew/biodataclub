# Hackathon Projects 2021

## Shiny dashboard for wearable Garmin data (Team Lead: Bob Gore) 

Over 200 million wearable sensing devices (e.g., fitbit, Garmin, and Apple Watch) are in use worldwide, and these represent the future of outpatient medical monitoring. With remote monitoring, a cancer treatment team could reach out to a patient who is showing subtle warning signs. This could save lives or prevent complications from becoming severe.

But there is no easy way for a physician to send a patient home with a device and then view the stream of data. Furthermore, the data visualizations provided by these devices are not optimized for medical monitoring. This project will address a critical mHealth gap by developing a customized solution that could be field tested among patients and physicians here at Moffitt Cancer Center.

This hackathon project will begin with a harmonized dataset involving Garmin data from 15 patients who have been followed post-surgically. The dataset also includes information about which patients had post-surgical complications, and the timing of those complications. 

The hackathon team will start with the harmonized data and develop a dashboard that would allow a physician to choose which type of data to view (activity level, physiologic stress, heart rate, steps, or sleep) and superimpose information about known complications (information that is part of the harmonized dataset). Physicians may want to be able to view the data at different time scales and over different intervals (by setting a start and stop day, for example, or by looking closely at certain hours of a particular day). Physicians may want to choose which data streams to show (e.g., activity, sleep, heart rate) and whether to include trendlines using the patient's own baseline or confidence intervals (i.e., process control charts). They may also wish to view only summary data, such as the number of hours of sleep the patient has per night, the number of steps per day, or the percent of the time a patient's heart rate is out of certain bounds. 

Using these considerations and parameters, the team will develop a flexible dashboard to allow physicians to choose how to configure their own data views, given the harmonized data set that the team will begin with. Although Garmin data streams will be used for the visualization, it is expected that future development will include the ability to draw on data from other devices (Apple Watch, Fitbit). 

Skills needed include only the ability to imagine data visualizations, basic coding skills in any computer language (e.g. R, SAS, Python), and familiarity with at least one dashboard visualization tool (e.g. Rstudio, plot.ly).
  

## Alexa App to capture Edmonton Symptom Assessment System (ESAS) (Team Lead: Rodrigo Carvajal) 

During the hackathon we will explore how to create an Alexa SKILL that allows the capture of Patient-Reported Outcomes and save the data in a database in AWS. The description of the questionnaire to be used as examples, Edmonton Symptom Assessment System (ESAS), is available [here](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5337174/).  Recommended readings and videos
* [Steps to build a custom (Alexa) skill](https://developer.amazon.com/en-US/docs/alexa/custom-skills/steps-to-build-a-custom-skill.html)
* [How to build an Alexa skill (Video)](https://www.youtube.com/watch?v=xo8Y-rHne80)

No previous programming experience is required, just the desire to learn about Alexa skills.

## Shedding light on the dark metabolome (Team Lead: Paul Stewart) 

The vast majority of metabolites in untargeted metabolomics experiments cannot be uniquely identified, and identification of these metabolites remains a major bottleneck since it requires time consuming experiments. We propose an R package (and Shiny application) to help with the identification of unknown metabolites. We hypothesize we can borrow information from identified metabolites (e.g., how they cluster, their retention time) to aid in the identification of similar, unknown metabolites. The package will use existing approaches like principal component analysis and UMAP to visualize experimental metabolomics data and look for clustering patterns of known and unknown metabolites. A secondary goal will be to mine data from the Human Metabolome Database (https://hmdb.ca/) to intersect with the experimental results if we have enough participants.

**Programming background:** Beginner or above in R. Experience with multivariate analyses or omics data analysis will be a plus but is not required. 

## Developing a genome viewer for the Cancer Cell Line Encyclopedia (Team Lead: Tim Shaw) 

https://proteinpaint.stjude.org/ In this project, we would like to develop a Shiny app that integrates protein paint function by highlighting alternative splicing events, junctions, SNV, Indel mutations. The tool contains an API for setting up custom instances. And the successful completion of this project will provide a publishable resource for the community to identify variants or splicing events that are sensitive to specific drug treatment (PRISM) or genetic screens (DepMap).  

## Creating Standard Software Container Infrastructure (Team Lead: Steven Eschrich) 

Software containers (e.g., docker or singularity) have become an essential tool in providing reproducible and portable scientific applications. Containers encapsulate linux software installations in an overlay filesystem that can be used to execute custom software. For instance, we have built containers to run R, Rstudio, python and other specific application environments. Several additions can significantly improve the reliability and effort required for building out additional containers within a Docker framework.

1) Standard build process: currently MCC scientific computing uses the EZbuild system to compile and install cluster software packages. Incorporating EZbuild recipes into the container-building process would reduce duplication of effort and leverage MCC IT expertise.

2) Standard build hierarchy: many research applications require a complex software stack (e.g., python, latex) using a specific OS (e.g., ubuntu, centos). The standard approach for building containers in these cases involves developing a base image (e.g., an OS) followed by additional containers extending functionality. Defining the hierarchy of containers (e.g., OS, programming languages, application environments) will allow us to quickly add new containers, leveraging previously built containers.

3) MCC-specific container customization: several MCC-specific modifications are required to run containers, including SSL-inspection and portability to singularity. Containers should be tested against singularity to ensure correct operation. 4) Implementation of specific genomics/proteomics containers: develop containers (and container versioning) for specific software tool such as gatk, genome annotation, STAR, etc. 

**Impact:** The result of this effort will be a series of gitlab-versioned Dockerfiles that generate container images stored in a new local Dockerhub instance. The dockerfiles and docker images will be available to the MCC community to use within their research, with particular emphasis on use on the MCC HPC environment. Documentation about container development conventions and versioning will be included in the gitlab project(s).

**Technical Specifications:** Linux, docker/singularity, software installation 

**Programming background:** Shell scripting, familiarity with linux OS commands and installation. 

## Searchable Database for The 4000+ Currently Most Highly-Cited Statistical Papers (Team Lead: Michael Schell) 

From a corpus of over 100,000 published statistical articles, a set of the ~4,400 currently most-highly cited articles have been identified by Dr. Michael Schell. The hackathon project is to create a database of these papers with about 150 variables (currently in an Excel spreadsheet), that is easily searchable and sortable.  About half of the fields are comprised of annual citation counts from 1945 to 2021, for which searching and sorting are not needed. Key searchable and sortable variables are: title, authors, source title and 7 paper classification fields. About 20 additional variables are numeric, for which sorting is essentially in increasing or decreasing order. Multiple layers of sorting are needed 9primary, secondary, etc.)  Electronic copies of papers of most interest to Moffitt researchers can be obtained, and links made to the database to facilitate accessioning of the article directly from the database. 

Of the 7 classification variables (kingdom, phylum, …, species) only four will be completely filled out.  Thus, crowd-sourcing is needed to suggest entries from the missing fields, and possible corrections to those already filled in.  We need a method to collect these suggestions for updating and improving the full classification. 

This database would then be put on the web for users all over the world to use.  (Note: They would know about the existence of the database by a technical paper on its classification structure published in a scientific journal.) 

**Technical specifications:** Knowledge of various databases to select one that will best serve the purpose, and knowledge of web server features to allow the greatest access to concurrent users. 

**Programming background:** Database design knowledge. Web-development experience helpful 

## A deep learning inference graphical user interface platform (Team Leads: Ching Nung Lin, Dung-Tsa Chen, Natarajan Raghunand) 

Deep Learning for analysis of medical images is a hot research area. During model development, it is crucial to perform visual inspection of the performance of trained models. In this regard there is a paucity of easy-to-use visualization tools to verify the quality of models during and after training. We propose to build a GUI platform to permit researchers to input data and view models results without the need for de novo programming. 

We will develop a stand-alone application which can displays the original and processed data. We will use ONNX Runtime + Rust, so the GUI is executed without any software installation required. The platform will be able to do deep learning inference for various models for “instance segmentation”, “NLP”, etc. For example, a user can input brain MRI scans, on which the system will perform automated “skull stripping” using a deep learning model. Another use would be for image synthesis, where a user inputs MRI scans and the system outputs a synthetic CT image.  

## User-Friendly Exploration of the Tumor Microenvironment Using Digital Spatial Transcriptomics Profiling (Team Lead: Oscar Ospina) 

Spatial transcriptomics promises to significantly advance our understanding of the tumor microenvironment (TME), a critical factor modulating prognosis and therapy outcomes. With spatial transcriptomics, researchers can investigate gene expression and at the same time retain the spatial location where said gene expression is occurring. Furthermore, Digital Spatial Profiling (DSP) enables users to supplement spatial gene expression with immunofluorescence from a set of markers of interest. The use of DSP allows interrogation of gene expression from selected regions of interest (ROIs) within a tissue, as well as comparative analysis among ROIs. With the increasing adoption of DSP among the cancer research community, we propose to develop an R Shiny app that allows basic exploration of DSP experiments. The app will provide a user-friendly environment for users to input raw data and visualize expression of selected genes across ROIs and accompanying immunofluorescence intensities. In addition, basic clustering and UMAP visualizations will be possible to categorize ROIs, as well as differential gene expression analysis. Figures created in plotly will allow researchers to get additional information on differentially expressed genes and cluster labels from each ROI. We will leverage GitHub code development to speed up collaborative programming and facilitate reproducibility. The project will be carried out by Oscar Ospina (analytical code team leader) and Alex Soupir (R Shiny code leader). Additional participants with varying degrees of data analysis and coding expertise are welcomed. 

