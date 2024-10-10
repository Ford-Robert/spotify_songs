#### Preamble ####
# Purpose: Downloads and saves the data from Spotify
# Author: Robert Ford
# Date: Oct 2024
# Contact: robert.ford@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(spotifyr)

radiohead <- get_artist_audio_features("radiohead")
the_national <- get_artist_audio_features("the national")




#### Save data ####
# [...UPDATE THIS...]
write_csv(the_raw_data, "data/raw_data.csv")

         
