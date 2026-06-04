# Compile data and exclude selections below sp thresholds

# Working Directories and Pkgs
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON1")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON2")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON3")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON4")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON5")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON6")
setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs")

# install.packages('tidyft')
library(tidyft)
library(dplyr)



# Data processing: Hall hayfields: 
  # 1. Manually add date column to all CSVs
  # 2. Import CSVs as data frames together by Recorder Number
    # https://www.statology.org/r-merge-csv-files/
     
# Example: ELDON1
eldon1 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON1") %>% 
  lapply(read_csv) %>% 
  bind_rows

  # 3. Add Recorder# as column to each data frame

eldon1$Recorder <- "ELDON1"

    # SAVE DATA FRAME AS BACKUP CSV

write.csv(eldon1, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon1_Calls_2025.csv", row.names = FALSE)

# ELDON2
eldon2 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON2") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon2$Recorder <- "ELDON2"
write.csv(eldon2, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon2_Calls_2025.csv", row.names = FALSE)

# ELDON3
eldon3 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON3") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon3$Recorder <- "ELDON3"
write.csv(eldon3, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon3_Calls_2025.csv", row.names = FALSE)

# ELDON4
eldon4 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON4") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon4$Recorder <- "ELDON4"
write.csv(eldon4, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon4_Calls_2025.csv", row.names = FALSE)

# ELDON5
eldon5 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON5") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon5$Recorder <- "ELDON5"
write.csv(eldon5, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon5_Calls_2025.csv", row.names = FALSE)

# ELDON6
eldon6 <- list.files(path="C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/ELDON6") %>% 
  lapply(read_csv) %>% 
  bind_rows
eldon6$Recorder <- "ELDON6"
write.csv(eldon6, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon6_Calls_2025.csv", row.names = FALSE)

# 4. Add recorder data frames to master dataframe
eldon1 <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon1_Calls_2025.csv")
eldon2 <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon2_Calls_2025.csv")
eldon3 <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon3_Calls_2025.csv")
eldon4 <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon4_Calls_2025.csv")
eldon5 <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon5_Calls_2025.csv")
eldon6 <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Eldon6_Calls_2025.csv")

hall <- rbind(eldon1, eldon2, eldon3, eldon4, eldon5, eldon6)

# 1-4. Data processing: Crossroads: 
  # Loop to add dates, recorder and compile data 
  # Source - https://stackoverflow.com/a/61061994

  # Retrieve file names and read csvs
filenames <- list.files(path = "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/E7-10") # Creates a character vector of all file names in working directory
df <- data.frame(matrix(ncol = 8, nrow = 0)) # enter number of columns you will have in the final dataset
colnames(df) <- c("Start (s)", "End (s)", "Scientific name", "Common name", "Confidence", "File", "Date", "Recorder") # create column names

# Loop to pull dates and recorder names from file name and compile
for (i in filenames) {
  pid<-read_csv(file.path(
    "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/All_Birdnet_CSVs/E7-10",
    i
  ))
  #dat<-pid 
  Date <- sub("^[^_]+_(\\d{8})_\\d{6}\\.BirdNET\\.results\\.csv$", "\\1", basename(i))
  pid$Date <- Date
  
  Recorder <- sub("_\\d{8}_\\d{6}\\.BirdNET\\.results\\.csv$", "", basename(i))
  pid$Recorder <- Recorder
  df <- rbind(df, pid)
}

# Rename above df and save as csv
xrds <- df
write.csv(xrds, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Crossroads_data_2025.csv")

# 5. Subset master datasets to include only data above each spp's threshold

# Confidence Thresholds by Probability (p=0.9) for focal spp:
  # Blue Grosbeak (blugrb1) = 0.617
  # Common Yellowthroat (comyel) = 0.177
  # Eastern Meadowlark (easme) = 0.249
  # Field Sparrow (fiespa) = 0.714
  # Upland Sandpiper (uplsan) = 0.5
  # Horned Lark (horlar) = 0.858
  # Song Sparrow (sonspa) = 0.524

# Hall Hayfields:
  # 5.1 Subset by spp:
hall.blugrb1 <- subset(hall, hall$`Common.name` == "Blue Grosbeak")
hall.comyel <- subset(hall, hall$`Common.name` == "Common Yellowthroat")
hall.easme <- subset(hall, hall$`Common.name` == "Eastern Meadowlark")
hall.fiespa <- subset(hall, hall$`Common.name` == "Field Sparrow")
hall.uplsan <- subset(hall, hall$`Common.name` == "Upland Sandpiper")
hall.horlar <- subset(hall, hall$`Common.name` == "Horned Lark")
hall.sonspa <- subset(hall, hall$`Common.name` == "Song Sparrow")

  # 5.2 Subset by spp confidence threshold
hall.blugrb1.ct <- subset(hall.blugrb1, hall.blugrb1$Confidence >= 0.617)
hall.comyel.ct <- subset(hall.comyel, hall.comyel$Confidence >= 0.177)
hall.easme.ct <- subset(hall.easme, hall.easme$Confidence >= 0.249)
hall.fiespa.ct <- subset(hall.fiespa, hall.fiespa$Confidence >= 0.714)
hall.uplsan.ct <- subset(hall.uplsan, hall.uplsan$Confidence >= 0.5)
hall.horlar.ct <- subset(hall.horlar, hall.horlar$Confidence >= 0.858)
  # Produces n = 0 ; need to disclaim or lower threshold

  # Compile Hall
hall.final <- rbind(hall.blugrb1.ct, hall.comyel.ct, hall.easme.ct, hall.fiespa.ct, hall.uplsan.ct, hall.horlar.ct)
  # Save backup CSV
write.csv(hall.final, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Hall_ct_2025.csv")

# Crossroads: 
  # 5.1 Subset by spp:
xrds.blugrb1 <- subset(xrds, xrds$`Common name` == "Blue Grosbeak")
xrds.comyel <- subset(xrds, xrds$`Common name` == "Common Yellowthroat")
xrds.easme <- subset(xrds, xrds$`Common name` == "Eastern Meadowlark")
xrds.fiespa <- subset(xrds, xrds$`Common name` == "Field Sparrow")
xrds.uplsan <- subset(xrds, xrds$`Common name` == "Upland Sandpiper")
xrds.horlar <- subset(xrds, xrds$`Common name` == "Horned Lark")
xrds.sonspa <- subset(xrds, xrds$`Common name` == "Song Sparrow")

  # 5.2 Subset by spp confidence threshold
xrds.blugrb1.ct <- subset(xrds.blugrb1, xrds.blugrb1$Confidence >= 0.617)
xrds.comyel.ct <- subset(xrds.comyel, xrds.comyel$Confidence >= 0.177)
xrds.easme.ct <- subset(xrds.easme, xrds.easme$Confidence >= 0.249)
xrds.fiespa.ct <- subset(xrds.fiespa, xrds.fiespa$Confidence >= 0.714)
xrds.uplsan.ct <- subset(xrds.uplsan, xrds.uplsan$Confidence >= 0.5)
xrds.horlar.ct <- subset(xrds.horlar, xrds.horlar$Confidence >= 0.858)
  # Produces n = 0 ; need to disclaim or lower threshold

# Compile Xrds
xrds.final <- rbind(xrds.blugrb1.ct, xrds.comyel.ct, xrds.easme.ct, xrds.fiespa.ct, xrds.uplsan.ct, xrds.horlar.ct)

# Save backup CSV
write.csv(xrds.final, "C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Crossroads_ct_2025.csv")

# To do later #
  # 6. Add treatments
