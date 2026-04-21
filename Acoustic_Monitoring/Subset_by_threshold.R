# Set wd
setwd("C:/DesktopFolder/Eldon")

# Rose's Notes
  # 1. copy/paste all CSVs into WD
  # 2. https://stackoverflow.com/questions/11433432/how-to-import-multiple-csv-files-at-once

# import all selection tables:
blugrb1 <- read.table("C:/DesktopFolder/Eldon/Blue_Grosbeak_Final.txt",
                      sep = "\t", header = TRUE)