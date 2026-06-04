# 2025 Acoustic Monitoring Graphing

# Note: 
  # 137 = BALE GRAZED 2025 (cut 7/1/25)
  # 138 = GRAZED 2025 


setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring")
xrds <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Crossroads_ct_2025.csv")
hall <- read.csv("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring/Hall_ct_2025.csv")

#install.packages("ggplot2")
library(ggplot2)
#install.packages("scales")
library(scales)

# Visualizations: 
  # Calls by spp pie charts/bar charts ??
  # Call number time series with treatments

# Stats compare calls between Hall N/S? After 2026?
  # Recode recorders as stockpiled (bale grazed) vs grazed  
hall$Treatment <- ifelse(
  hall$Recorder %in% c("ELDON4", "ELDON5", "ELDON6"),
  "Stockpiled",
  ifelse(
    hall$Recorder %in% c("ELDON1", "ELDON2", "ELDON3"),
    "Grazed",
    NA
  )
)

xrds$Treatment <- ifelse(
  xrds$Recorder %in% c("ELDON7", "ELDON10"),
  "Mowed",
  ifelse(
    xrds$Recorder %in% c("ELDON8", "ELDON9"),
    "Not mowed",
    NA
  )
)

# Time series:
  # Re-format Dates
    hall$date <- as.character(hall$Date)
    hall$Date <- as.Date(hall$date, format = "%Y%m%d")
    xrds$date <- as.character(xrds$Date)
    xrds$Date <- as.Date(xrds$date, format = "%Y%m%d")

# Line Frequency plot for all sp (needs transformations):
ggplot(hall, aes(Date, colour = Common.name)) + geom_freqpoly(binwidth = 7)

# Subset by sp. 
blugrb1.hall <- subset(hall, hall$Common.name == "Blue Grosbeak")
comyel.hall <- subset(hall, hall$Common.name == "Common Yellowthroat")
easme.hall <- subset(hall, hall$Common.name == "Eastern Meadowlark")
fiespa.hall <- subset(hall, hall$Common.name == "Field Sparrow")
uplsan.hall <- subset(hall, hall$Common.name == "Upland Sandpiper")

blugrb1.xrds <- subset(xrds, xrds$Common.name == "Blue Grosbeak")
comyel.xrds <- subset(xrds, xrds$Common.name == "Common Yellowthroat")
easme.xrds <- subset(xrds, xrds$Common.name == "Eastern Meadowlark")
fiespa.xrds <- subset(xrds, xrds$Common.name == "Field Sparrow")
uplsan.xrds <- subset(xrds, xrds$Common.name == "Upland Sandpiper")

# Histogram (Example: blue grosbeak)
blugrb1.hall$Call.id <- 1:nrow(blugrb1.hall)
ggplot(blugrb1.hall, aes(Date)) + geom_histogram(binwidth = 7, color = 1, fill = "lightblue") + 
  scale_x_date(date_labels = "%b-%d",
               date_breaks = "1 week"
  ) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Blue grosbeak")

# Frequency plots by sp:
  # Hist with freq test
blgr.hall.fp <- ggplot(blugrb1.hall, aes(Date, colour = Treatment)) + geom_histogram(binwidth = 7, color = 0, fill = "lightblue") + geom_freqpoly(binwidth = 7) + 
    scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
    theme(axis.text.x = element_text(angle = 90)) +
    labs(y = "Number of Calls") +
    ggtitle("Blue grosbeak")
ggsave("blue_grosbeak_hall.png", plot = blgr.hall.fp)

blgr.hall.fp <- ggplot(blugrb1.hall, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Blue grosbeak")
ggsave("blugrb1_hall.png", plot = blgr.hall.fp)

blgr.xrds.fp <- ggplot(blugrb1.xrds, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Blue grosbeak")
ggsave("blugrb1_xrds.png", plot = blgr.xrds.fp)

    # Zoomed in
b.h.july <- subset(blugrb1.hall, blugrb1.hall$date >= "20250615")
ggplot(b.h.july, aes(Date)) + geom_freqpoly(binwidth = 1, aes(color = Treatment)) +  
  scale_x_date(date_labels = "%b-%d", date_breaks = "2 days", limits = as.Date(c("2025-06-15", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Blue grosbeak July")

  # Common yellowthroat (Hall)
comyel.hall.fp <- ggplot(comyel.hall, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Common Yellowthroat")
ggsave("comyel_hall.png", plot = comyel.hall.fp)

comyel.xrds.fp <- ggplot(comyel.xrds, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Common Yellowthroat")
ggsave("comyel_xrds.png", plot = comyel.xrds.fp)

  # Eastern Meadowlark
easme.hall.fp <- ggplot(easme.hall, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Eastern meadowlark")
ggsave("easme_hall.png", plot = easme.hall.fp)

easme.xrds.fp <- ggplot(easme.xrds, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Eastern meadowlark")
ggsave("easme_xrds.png", plot = easme.xrds.fp)

  # Field Sparrow
fiespa.hall.fp <- ggplot(fiespa.hall, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Field Sparrow")
ggsave("fiespa_hall.png", plot = fiespa.hall.fp)

fiespa.xrds.fp <- ggplot(fiespa.xrds, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Field Sparrow")
ggsave("fiespa_xrds.png", plot = fiespa.xrds.fp)

  # Upland Sandpiper
uplsan.hall.fp <- ggplot(uplsan.hall, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Upland Sandpiper")
ggsave("uplsan_hall.png", plot = uplsan.hall.fp)

uplsan.xrds.fp <- ggplot(uplsan.xrds, aes(Date, colour = Treatment)) + geom_freqpoly(binwidth = 7) + 
  scale_x_date(date_labels = "%b-%d", date_breaks = "1 week", limits = as.Date(c("2025-04-14", "2025-07-15"))) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(y = "Number of Calls") +
  ggtitle("Upland Sandpiper")
ggsave("uplsan_xrds.png", plot = uplsan.xrds.fp)

