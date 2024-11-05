# Hackathon Projects 2024

## Interactive Anatomography Widget

### Project Lead: [Robert Norberg](Robert.Norberg@moffitt.org)

**Background**: 
Anatomography is a way of displaying different data types over an anatomical
model of an organism. There exist static versions of such tools in the R package
“gganatogram” and python package “pyanatomogram”; however, they lack interactive
components. In this project, we will build an interactive human body anatomogram
widget for either Shiny (R) or Dash (python). The widget will be an output for
displaying line color/fill/hovertext for different body parts, as well as an
input, sending hover and click events on body parts to the server side of the
application.
 
**Project Significance**: 
The goal of the project is to produce a package that can be submitted to CRAN or
PyPI for others to use. An interactive human body anatomogram widget could be
useful to researchers and teachers focused on human health.
 
**Technical Specifications or Programming background**: 
This team is seeking members with proficiency in R, python, or front end
javascript. Experience with scalable vector graphics (SVG) objects would be
wonderful to have, but is not required. Very basic proficiency using git/GitHub
is a plus, but not a requirement.

***

## Provider Recognition Program

### Project Lead: [Deniece Williams](Deniece.Williams@moffitt.org)

**Background**: 
Send a unique report per recipient with positive patient comments that name the
recipient. First, pull positive comments with the provider's name attached and
upload them to the portal. If the patient name/MRN matches the named employee
who accessed their files, then this comment is matched to the provider's name
and email address. Comments with matching provider contact info are loaded into
a separate portal for review before being sent to employees' emails.
 
**Project Significance**: 
Focus on positive comments to spread kindness, appreciation, and recognition to
providers.  Fight staff burnout.   Encourage.
 
**Technical Specifications or Programming background**: 
Quarto/R Markdown, EHR, PowerBI

***

## Patient Data Vectors – An Efficient Cancer Research Framework

### Project Lead: [Aakash Tripathi](Aakash.Tripathi@Moffitt.org)

**Background**: 
This project introduces a novel approach to cancer research by converting
patient data into compact vector representations. It utilizes advanced machine
learning techniques, such as Graph Neural Networks and Transformers, to process
and analyze multimodal patient data more efficiently.
 
**Project Significance**: 
This approach transforms heterogeneous patient data into compact vector
representations, enabling efficient processing and analysis using advanced
machine learning techniques such as Graph Neural Networks and Transformers. By
reducing computational and storage requirements, the method facilitates the
integration of diverse data types, including genomic information, medical
imaging, and clinical records. The resulting framework aims to enhance
predictive accuracy for cancer outcomes while making sophisticated analysis more
accessible to various research institutions.
 
**Technical Specifications or Programming background**: 
Participants would benefit from knowledge of machine learning, particularly in
areas such as neural networks and vector representations. Programming skills in
Python, especially with libraries like PyTorch, would be valuable. Experience
with data processing and analysis in healthcare contexts would also be
advantageous. However, participants without programming knowledge can still
contribute in areas such as data interpretation, project management, or
domain-specific cancer research expertise.

***

## Local LLM for Cancer Registry - Chatbot for Moffitt Researchers, Clinicians, and Registrars

### Project Lead: [Asim Waqas](Asim.Waqas@moffitt.org)

**Background**: 
The manual extraction of data from pathology reports for cancer registries is
often time-consuming and prone to inconsistencies, as it relies on human
interpretation of clinical notes. With the growing volume of patient records and
the complexity of data, there is a need for automated solutions that can
accurately extract key variables from unstructured texts in electronic health
records (EHRs). This project aims to address these challenges by developing a
locally hosted chatbot, powered by a large language model, to streamline and
automate the data extraction process for cancer registries.
 
**Project Significance**: 
This project significantly enhances the efficiency of cancer registry updates by
automating the extraction of critical data from pathology reports, reducing
reliance on manual labor. By leveraging a large language model to provide
accurate predictions and explanations, the tool ensures consistency and
precision in data handling, which is essential for advancing research and
clinical decision-making. Its ability to rapidly process information helps
accelerate cancer research and improve patient care outcomes.
 
**Technical Specifications or Programming background**: 
Participants would benefit from knowing Python, as it is commonly used for
natural language processing (NLP) and large language model (LLM) integration.
Familiarity with frameworks such as PyTorch for model development and
fine-tuning, as well as libraries like Hugging Face for LLM implementation,
would be valuable. Additionally, experience with working in environments such as
Docker for local hosting, and knowledge of APIs for integrating the chatbot with
electronic health records (EHRs), could be useful for contributing to the
technical aspects of the project.

***

## Automated Workflow for Single Cell Spatial Data

### Project Lead: [Alex Soupir](Alex.Soupir@moffitt.org)

**Background**: 
For many years, imaging has been used to assess tissue composition of
microenvironments at an abundance level. However, as time has progressed it has
become known that spatial contexture of tissue microenvironments plays an
important role. Whether it be in understanding cell-cell interactions, single
cell-type clustering, or colocalization of multiple cell types, the spatial
environment provides a richer grasp on tissue dynamics.
 
**Project Significance**: 
Generation of spatial data is increasingly common, and many of the derived
metrics are able to be streamlined. Using existing R packages, this project
seeks to create am automated workflow to compute spatial summary measures in a
flexible, scalable way. In doing so, we hope to increase throughput and access
to all researchers to explore spatial data associated with proteomics and
transcriptomics who otherwise would require large time commitments to learn.
 
**Technical Specifications or Programming background**: 
Many spatial metrics, especially those of ecologic origin, have implementation
in the R packages "spatstat" and "spatialTIME" so some knowledge of R would be
beneficial. Ability to convert R scripts to command line calls (such as using
the package "optparser") would be great. Those with great organization to help
design folder structure that is intuitive for output metrics. Individuals who
are handy at creating user interfaces could help in converting the command line
code to an interactive environment.

***

## Shiny App for efficiently screening and matching patients for research studies.

### Project Lead: [Nathan Van Bibber](Nathan.VanBibber@moffitt.org)

**Background**: 
The Coghill Lab and Islam Lab (Cancer Epidemiology Program) prospectively screen
HIV+ patients for research study eligibility using weekly clinic appointment
data from the Capstone Department Appointment Resource (DAR) and Cerner. A
comparison group of HIV-uninfected research participants must also be identified
for these studies, matched to the enrolled HIV+ patients on age, diagnosis, and
other clinical data. Given the high volume of patient appointments each week
(~38,000 appointments/week), the study teams need to identify efficient methods
to screen HIV-uninfected patients with select demographic and diagnosis
characteristics using the existing DAR reports.
 
**Project Significance**: 
Our Shiny app will enable research teams to efficiently import and dynamically
filter patient appointment data to identify eligible patients for their research
studies. It will allow anybody to easily upload data then quickly and easily
find potential matches without needing to be proficient in R (or any other
programming language) and eliminate the need for analysis software to be
installed on each team member’s machine; thus, reducing technical overhead all
allowing researchers more time to conduct their study.
 
**Technical Specifications or Programming background**: 
Experience wrangling data in R and building Shiny apps is preferable. Someone
with experience using Capstone Department Appointment Resource (DAR) and Cerner
would be wonderful to have. Also, some experience using git/GitHub for version
control would be nice but not required.

***
