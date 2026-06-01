# Subset by Prediction Probability

setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON1")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON2")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON3")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON4")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON5")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON6")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs")

install.packages('tidyft')
library(tidyft)
library(dplyr)
# Confidence Thresholds by Probability (p=0.9) for focal spp:
  # Blue Grosbeak (blugrb1) = 0.617
  # Common Yellowthroat (comyel) = 0.177
  # Eastern Meadowlark (easme) = 0.249
  # Field Sparrow (fiespa) = 0.714
  # Upland Sandpiper (uplsan) = 0.5
  # Horned Lark (horlar) = 0.858
  # Song Sparrow (sonspa) = 0.524

# TO DO # 
  # 1. MANUALLY add date column to all CSVs
  # 2. Import CSVs as data frames together by RecorderNumber
    # https://www.statology.org/r-merge-csv-files/

eldon1 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON1") %>% 
  lapply(read_csv) %>% 
  bind_rows

  # 3. Add Recorder# as column to each data frame

eldon1$Recorder <- "ELDON1"

  # 4. Add sample ID to each call row in data frame

# eldon1$ID <- 1:nrow(eldon1)

    # SAVE DATA FRAME AS BACKUP CSV

write.csv(eldon1, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon1_Calls_2025.csv", row.names = FALSE)

# ELDON2
eldon2 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON2") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon2$Recorder <- "ELDON2"
#eldon2$ID <- 1:nrow(eldon2)
write.csv(eldon2, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon2_Calls_2025.csv", row.names = FALSE)

# ELDON3
eldon3 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON3") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon3$Recorder <- "ELDON3"
#eldon3$ID <- 1:nrow(eldon3)
write.csv(eldon3, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon3_Calls_2025.csv", row.names = FALSE)

# ELDON4
eldon4 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON4") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon4$Recorder <- "ELDON4"
#eldon4$ID <- 1:nrow(eldon4)
write.csv(eldon4, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon4_Calls_2025.csv", row.names = FALSE)

# ELDON5
eldon5 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON5") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon5$Recorder <- "ELDON5"
#eldon5$ID <- 1:nrow(eldon5)
write.csv(eldon5, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon5_Calls_2025.csv", row.names = FALSE)

# ELDON6
eldon6 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON6") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon6$Recorder <- "ELDON6"
#eldon6$ID <- 1:nrow(eldon6)
write.csv(eldon6, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon6_Calls_2025.csv", row.names = FALSE)

# Attempt loop to add dates 
  # Source - https://stackoverflow.com/a/61061994

  # Retrieve file names and read csvs
filenames <- list.files(path = "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs") # Creates a character vector of all file names in working directory
df <- data.frame(matrix(ncol = 8, nrow = 0)) # enter number of columns you will have in the final dataset
colnames(df) <- c("Start (s)", "End (s)", "Scientific name", "Common name", "Confidence", "File", "Date", "Recorder") # create column names

# Loop to pull dates and recorder names from file name and compile
for (i in filenames) {
  pid<-read_csv(file.path(
    "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs",
    i
  ))
  #dat<-pid 
  Date <- sub("^[^_]+_(\\d{8})_\\d{6}\\.BirdNET\\.results\\.csv$", "\\1", basename(i))
  pid$Date <- Date
  
  Recorder <- sub("_\\d{8}_\\d{6}\\.BirdNET\\.results\\.csv$", "", basename(i))
  pid$Recorder <- Recorder
  df <- rbind(df, pid)
}

# 5. Add subset data frames to master dataframe
read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon5_Calls_2025.csv")

# 6. Subset master to include only data above each spp's threshold
# 6.1 Subset by spp:
e1.blugrb1 <- subset(eldon1, eldon1$`Common name` == "Blue Grosbeak")
# 5.2 Subset by spp confidence threshold
e1.blugrb1.ct <- subset(e1.blugrb1, e1.blugrb1$Confidence >= 0.617)

# To do later #

# 7. Add treatments

# Prototype Code for automating workflow!
  # References:
# https://birdnet-team.github.io/birdnetR/articles/birdnetR.html

library(birdnetR)

  # Initialize the TensorFlow Lite model
model <- birdnet_model_tflite("v2.4")

  # Path to an example audio file (replace with your own file path)
audio_path <- "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/TEST2.wav"
predictions <- predict_species_from_audio_file(model, audio_path, min_confidence = 0.3, keep_empty = FALSE)