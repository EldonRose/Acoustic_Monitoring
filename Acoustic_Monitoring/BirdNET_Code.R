# Code to run BirdNET model
  # References:
  # https://birdnet-team.github.io/birdnetR/articles/birdnetR.html

library(birdnetR)

# Initialize the TensorFlow Lite model - DO NOT RUN
# model <- birdnet_model_tflite("v2.4")

# Initialize Protobuf Model - DO RUN
model <- birdnet_model_protobuf("v2.4")

# Path to an example audio file (replace with your own file path)
audio_path_rw <- "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/TEST2.wav"
audio_path_cs <- "Christian replace this with your path to audio file"

predictions <- predict_species_from_audio_file(model, audio_path, min_confidence = 0.3, keep_empty = FALSE)
  # ROSE: need to add sp list once finished