# Code to run BirdNET model
  # References:
  # https://birdnet-team.github.io/birdnetR/articles/birdnetR.html

# Install Packages
install.packages("birdnetR")
install.packages("arrow")

# Libraries
library(birdnetR)
library(arrow)

# ROSE ADD APACHE ARROW?
#predictions <- predict_species_from_audio_file(model, wk21.test, min_confidence = 0.3, keep_empty = FALSE)

# Example for Running one file at a time:
  # Initialize the TensorFlow Lite model - DO NOT RUN
  # model <- birdnet_model_tflite("v2.4") - DO NOT RUN

# Path to an example audio file (replace with your own file path)
# audio_path_rw <- "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/TEST2.wav"
# audio_path_cs <- "Christian replace this with your path to audio file"

# Initialize Protobuf Model - DO RUN
model <- birdnet_model_protobuf("v2.4")

  # Load sp list: 
    # Replace path with your own file path
sp <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Expanded_Sp_2025.csv")
sp <- read.csv("C:/ChristianDesktop/Acoustic_Monitoring3/Acoustic_Monitoring/Expanded_Sp_2025.csv")
sp <- sp$X

# Use lists to run groups of files

# Generate a list of files by week:
wk21.test <- list.files(path="C:/Users/rwetz/Desktop/Week21", full.names = TRUE) 
wk15.test <- list.files(path="E:/2025_AM_Data/Eldon1/Week15", full.names = TRUE) 
E1.wk15 <- as.list(wk15.test)

# Apply birdNET model to all files in above list to generate birdNET predictions
  # Saved as object with this syntax: Recorder #.week #.year (2-digit)
  # Convert to data frame and save as csv 
E1.wk21.25 <- lapply(E1.wk21, function(x) {E1.test <- predict_species_from_audio_file(model, x, min_confidence = 0.3, filter_species = sp, keep_empty = FALSE)})
E1.wk21.25 <- as.data.frame(E1.wk21.25)
write.csv(E1.wk21.25, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/codetest.csv", row.names = FALSE)
  # Replace my path with your own path

E1.wk15.25 <- lapply(E1.wk15, function(x) {E1.test <- predict_species_from_audio_file(model, x, min_confidence = 0.3, filter_species = sp, keep_empty = FALSE)})
E1.wk15.25 <- as.data.frame(E1.wk15.25)
write.csv(E1.wk15.25, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/codetest.csv", row.names = FALSE)


