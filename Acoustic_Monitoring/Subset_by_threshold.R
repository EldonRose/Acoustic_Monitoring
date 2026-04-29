# Subset by Prediction Probability

setwd("C:/Users/rwetz/Documents/GitHub/Acoustic_Monitoring/Acoustic_Monitoring")

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
  # 3. Add Recorder# as column to each data frame
  # 4. Add sample ID to each call row in data frame
    # SAVE DATA FRAME AS BACKUP CSV
  # 5. Subset to include only data above each spp's threshold
  # 6. Add subset data frames to master dataframe

# To do later #
  # 7. Add treatments

