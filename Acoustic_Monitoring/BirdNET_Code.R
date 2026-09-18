####### Code to run BirdNET model ######
  
# REFERENCES:
  # https://birdnet-team.github.io/birdnetR/articles/birdnetR.html
# NOTES:
  # ROSE ADD APACHE ARROW?
  # Initialize the TensorFlow Lite model - DO NOT RUN
    # model <- birdnet_model_tflite("v2.4")

# Install Packages (on first run only)
  # install.packages("birdnetR")
  # install.packages("arrow")

# RUN EVERY TIME
  # Load Libraries 
library(birdnetR)
library(arrow)
  
##### ROSE (EXAMPLE) CODE #####
# Path to an example audio file (replace with your own file path)
audio_path_rw <- "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/TEST2.wav"

# Initialize Protobuf Model
model <- birdnet_model_protobuf("v2.4")

# Load sp list: 
sp <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Expanded_Sp_2025.csv")
sp <- sp$X

# Use lists to run groups of files
  # Generate a list of files by week:
wk21.test <- list.files(path="C:/Users/rwetz/Desktop/Week21", full.names = TRUE) 
E1.wk21 <- as.list(wk21.test)
  # Set sublist Name = Value 
names(E1.wk21) = wk21.test

# Apply birdNET model to all files in above list to generate birdNET predictions
  # Saved as object with this syntax: Recorder #.week #.year (2-digit)
E1.wk21.25 <- lapply(E1.wk21, function(x) {predict_species_from_audio_file(model, x, min_confidence = 0.3, filter_species = sp, keep_empty = FALSE)})
  # lapply file-named sublists to df
mapply(
  function(E1.wk21.25, wk21.test) write.csv(E1.wk21.25, wk21.test), 
  E1.wk21.25, 
  wk21.test
)

# ROSE TEST 2
wk21.test <- list.files(path="C:/Users/rwetz/Desktop/Week21", full.names = TRUE) 
E1.wk21 <- as.list(wk21.test)
names(E1.wk21) = wk21.test
E1.wk21.25 <- lapply(E1.wk21, function(x) {predict_species_from_audio_file(model, x, min_confidence = 0.3, filter_species = sp, keep_empty = FALSE)})
mapply(
  function(E1.wk21.25, wk21.test) write.csv(E1.wk21.25, wk21.test), 
  E1.wk21.25, 
  wk21.test
)

##### CHRISTIAN'S WORK #####
# Path(s) to your audio file working directory
audio_path_cs <- "Christian replace this with your path to audio files"

# Initialize Protobuf Model
model <- birdnet_model_protobuf("v2.4")

# Load sp list and save sp only as a df:
sp <- read.csv("C:/ChristianDesktop/Acoustic_Monitoring3/Acoustic_Monitoring/Expanded_Sp_2025.csv")
sp <- sp$X

# Use lists to run groups of files
  # I would STRONGLY recommend that you copy+paste the code each time you run a new week instead of 'writing over' 
    # (updating the same lines each time you run a new week). 
    # That way you can easily pick up where you leave off AND track down issues
  # HOWEVER, you can lose the commented titles once you understand what you are doing (see week 17 below)

# E1 WK16 2025
  # Generate a list of files by week:
E1.wk16.25.p <- list.files(path="E:/2025_AM_Data/Eldon1/Week16", full.names = TRUE) 
E1.wk16.25.l <- as.list(E1.wk16.25.p)
    # Set names of dfs in list to be your file paths 
names(E1.wk16.25.l) = E1.wk16.25.p
  # Apply birdNET model to all files in above list to generate birdNET predictions
E1.wk16.25 <- lapply(E1.wk16.25.l, function(x) {predict_species_from_audio_file(model, x, min_confidence = 0.3, filter_species = sp, keep_empty = FALSE)})
# Create CSVs
mapply(
  function(E1.wk16.25, E1.wk16.25.p) write.csv(E1.wk16.25, E1.wk16.25.p), 
  E1.wk16.25, 
  E1.wk16.25.p
)  

# E1 WK17 2025
E1.wk17.25.p <- list.files(path="E:/2025_AM_Data/Eldon1/Week17", full.names = TRUE) 
E1.wk17.25.l <- as.list(E1.wk17.25.p)
names(E1.wk17.25.l) = E1.wk17.25.p
E1.wk17.25 <- lapply(E1.wk17.25.l, function(x) {predict_species_from_audio_file(model, x, min_confidence = 0.3, filter_species = sp, keep_empty = FALSE)})
mapply(
  function(E1.wk17.25, E1.wk17.25.p) write.csv(E1.wk17.25, E1.wk17.25.p), 
  E1.wk17.25, 
  E1.wk17.25.p
)
