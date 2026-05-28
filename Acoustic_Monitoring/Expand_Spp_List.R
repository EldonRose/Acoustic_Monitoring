# Resources:
  # https://birdnet-team.github.io/birdnetR/articles/birdnetR.html#predict-species-occurence-with-the-meta-model
  # https://birdnet-team.github.io/birdnetR/reference/predict_species_at_location_and_time.html

# Notes:
  # Confidence set at 0.02 because no species of interest <0.02

# Packages:
install.packages("birdnetR")
install.packages("Rtools")

library(birdnetR)
library(dplyr)

# Initialize BirdNET Meta model (species occurence predictor)
meta_model <- birdnet_model_meta("v2.4")

# Predict species no weeks
list <- predict_species_at_location_and_time(
  meta,
  38.596400,
  -78.186269,
  week = NULL,
  min_confidence = 0.02
)

# Predict species within project weeks
list2 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 15, min_confidence = 0.02)
list3 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 16, min_confidence = 0.02)
list4 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 17, min_confidence = 0.02)
list5 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 18, min_confidence = 0.02)
list6 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 19, min_confidence = 0.02)
list7 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 20, min_confidence = 0.02)
list8 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 21, min_confidence = 0.02)
list9 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 22, min_confidence = 0.02)
list10 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 23, min_confidence = 0.02)
list11 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 24, min_confidence = 0.02)
list12 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 25, min_confidence = 0.02)
list13 <- predict_species_at_location_and_time(meta, 38.596400, -78.186269, week = 26, min_confidence = 0.02)

weeks <- bind_rows(list2, list3, list4, list5, list6, list7, list8, list9, list10, list11, list12, list13)
names <- as.data.frame(weeks$label)
all.sp <- as.data.frame(unique(names))

# To do:
  # Refine all.sp list to exclude irrelevant birds (e.g. forest, shorebirds)


