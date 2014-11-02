#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
# Load needed libraries
# --> NOTE: RCurl is dependent on bitops
library(bitops)
library(RCurl)
library(Hmisc)
library(REDCapR)
library(redcapAPI)
#Read Data
# Set secret token specific to your REDCap project
secret_token = '50AA35EDD79B64E9B7C818B0250367E1'

# Set the url to the api (ex. https://YOUR_REDCAP_INSTALLATION/api/)
api_url = 'https://redcap.partners.org/redcap/api/'

# # old code
#
# rcon <- redcapConnection(url=api_url, token=secret_token)
# data <- exportRecords(rcon, factors=FALSE)
#
# #test info
# uri <- "https://bbmc.ouhsc.edu/redcap/api/"
# token <- "9A81268476645C4E5F03428B8AC3AA7B"
# redcap_read(redcap_uri=uri, token=token)$data


api_url = 'https://redcap.partners.org/redcap/api/'

token <- "50AA35EDD79B64E9B7C818B0250367E1" #Adapt this to your user's token.
records_collapsed <- "1,2,3" #This assumes that their dataset contains ID values of 1, 2, and 3.  Adapt this to their dataset.
fields_collapsed <- "record_id,referral_date,referring_provider" #This assumes that their dataset contains variables called 'recordid', 'name_first', and 'name_last'.  Adapt this to their dataset.

raw_text <- RCurl::postForm(
  uri = api_url
  , token = token
  , content = 'record'
  , format = 'csv'
  , type = 'flat'
  , rawOrLabel = 'raw'
  , exportDataAccessGroups = 'true'
  , records = records_collapsed
  , fields = fields_collapsed
  , .opts = RCurl::curlOptions(ssl.verifypeer=FALSE)
)

library(REDCapR) #Load the package into the current R session.
uri <- "https://bbmc.ouhsc.edu/redcap/api/"
token <- "50AA35EDD79B64E9B7C818B0250367E1" #Adapt this to your user's token.

redcap_read(redcap_uri=api_url, token=token)$data