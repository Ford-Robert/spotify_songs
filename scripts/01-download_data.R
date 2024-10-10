#### Preamble ####
# Purpose: Downloads and saves the data from Spotify
# Author: Robert Ford
# Date: Oct 2024
# Contact: robert.ford@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(spotifyr)


#### Download data ####
fredagain <- get_artist_audio_features("fred again..")
the_strokes <- get_artist_audio_features("the strokes")
arctic_monkeys <- get_artist_audio_features("arctic monkeys")


#### Save data ####

rbind(fredagain, the_strokes, arctic_monkeys) |> 
  select(artist_name, album_release_date, valence) |> 
  mutate(album_release_date = ymd(album_release_date)) |> 
  ggplot(aes( x = album_release_date, y = valence, color = artist_name)) + 
  geom_point(alpha = 0.3) + 
  geom_smooth() + 
  theme_minimal() + 
  facet_wrap(facets = vars(artist_name), dir = "v") + 
  labs( 
    x = "Album release date", y = "Valence", 
    color = "Artist") + scale_color_brewer(palette = "Set1") + theme(legend.position = "bottom")



#### Save data ####
# [...UPDATE THIS...]
write_csv(fredagain, "data/fred_data.csv")
write_csv(the_strokes, "data/strokes_data.csv")
write_csv(arctic_monkeys, "data/monkeys_data.csv")

         
