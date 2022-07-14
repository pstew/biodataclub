# Wearable Fitness and Health Tracking Devices and PRO Data Collection

## Presenters: [Rhoda Gai-Cherry](mailto:Rhoda.Gai-Cherry@moffitt.org)

Location: **VIRTUAL MEETING** 

Day and Time: Friday, July 15th 2022 @ 2pm

Meeting Link: https://moffitt.zoom.us/j/94122062972

### Details

(From the presenter)

I’d like to cover the following topics:

* Brief introduction to wearable fitness and health tracking devices and the PRO (Patient Reported Outcome) data that can be monitored by those devices
* Data structure among different wearable devices (FitBit, Garmin, Apple HealthKit data from Apple Watch)
* How the data is collected from the wearable devices to the cloud (FitBit cloud, Garmin Connect cloud)
* How Moffitt application obtain the patient data:
  * Patient authorization via the service cloud for our application to gain access to the patient’s data
  * Our application obtain patient data from the service cloud (FitBit API, Garmin API).

I will keep it at the high level, focusing more on the overall data structure, architecture and work flow of our applications (instead of implementation details). 
 

###  Prerequisites

Some background knowledge about wearable fitness devices and server to server communication will be helpful, but I will explain how our app communicates with FitBit API and Garmin API to get the data.