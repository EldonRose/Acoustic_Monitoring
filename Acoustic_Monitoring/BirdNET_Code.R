# Code to run BirdNET model
  # References:
  # https://birdnet-team.github.io/birdnetR/articles/birdnetR.html

library(birdnetR)

# Initialize the TensorFlow Lite model
model <- birdnet_model_tflite("v2.4")

# Path to an example audio file (replace with your own file path)
audio_path <- "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/TEST2.wav"
predictions <- predict_species_from_audio_file(model, audio_path, min_confidence = 0.3, keep_empty = FALSE)
