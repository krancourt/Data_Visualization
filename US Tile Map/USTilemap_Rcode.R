library(tidyverse)
library(minimap)
library(maps)
library(fiftystater)
library(mapdata) 

#US Law Data is from the National Partnership for Women and Families
USlaws <- read.csv("Work-and-Family-2015.csv", stringsAsFactors = FALSE)
states <- read.csv("states.csv", stringsAsFactors = FALSE)
USlaws_joined <- left_join(USlaws, states, by = c('State' = 'State'))

#setting the color function
USlaws_joined <- USlaws_joined %>% mutate(color = ifelse(Paid.Family.Leave == "Yes", "#2f6d6d",
                                                         ifelse(Paid.Family.Leave == "In Progress", "#85c9c9",
                                                                "#b5b5b5")))

#creating the tile map
mapUSlaws <- miniusa(USlaws_joined$Abbreviation, state_colors = USlaws_joined$color, state_names = TRUE, 
                     state_name_colors = rep("white", 51))


title(main == "Legal Status of Same Sex Marriage in 2008", line == -1)

#Note - final design was finished using Adobe Illustrator
