# Set wd
setwd("C:/Users/rwetz/Desktop/R_WorkingDirectory/Acoustic_Monitoring/Acoustic_Monitoring")

## BLUE GROSBEAK ##
# import a specified selection table:
blugrb1 <- read.table("C:/DesktopFolder/Eldon/Blue_Grosbeak_Final.txt",
                    sep = "\t", header = TRUE)

# extract the numeric score from the file name:
blugrb1$Score <- as.numeric(substr(blugrb1$Begin.File, 1, 5))

# fit the logistic regression model:
model.blugrb1 <- glm(Valid ~ Score, family = "binomial", data = blugrb1)

# plot the individual points (x = Score, y = Valid):
plot(Valid~Score, data=blugrb1, xlim=c(0,1), pch=16,
     col=rgb(0,0,0,.3))

# add the modeled regression relationship (a curve):
curve(predict(model.blugrb1, data.frame(Score = x), type = "response"),
      add = TRUE, col = "red", lwd = 2)

# compute score threshold for probability p of correct prediction:
p <- 0.9 # your desired p (probability of true positive)
score_threshold.blugrb1 <- (log(p/(1-p))-model.blugrb1$coefficients[1]) /
  model.blugrb1$coefficients[2]

# TESTING 1 2 3
pos.blugrb1 <- subset(blugrb1, Score >= 0.617)

## COMMON YELLOWTHROAT ##

comyel <- read.table("C:/DesktopFolder/Eldon/Common_Yellowthroat_Final.txt",
                      sep = "\t", header = TRUE)

comyel$Score <- as.numeric(substr(comyel$Begin.File, 1, 5))

model.comyel <- glm(Valid ~ Score, family = "binomial", data = comyel)

plot(Valid~Score, data=comyel, xlim=c(0,1), pch=16,
     col=rgb(0,0,0,.3))

curve(predict(model.comyel, data.frame(Score = x), type = "response"),
      add = TRUE, col = "red", lwd = 2)

p <- 0.9 # your desired p (probability of true positive)
score_threshold.comyel <- (log(p/(1-p))-model.comyel$coefficients[1]) /
  model.comyel$coefficients[2]

### EASTERN MEADOWLARK ###
easme <- read.table("C:/DesktopFolder/Eldon/Eastern_Meadowlark_Final.txt",
                     sep = "\t", header = TRUE)

easme$Score <- as.numeric(substr(easme$Begin.File, 1, 5))

model.easme <- glm(Valid ~ Score, family = "binomial", data = easme)

plot(Valid~Score, data=easme, xlim=c(0,1), pch=16,
     col=rgb(0,0,0,.3))

curve(predict(model.easme, data.frame(Score = x), type = "response"),
      add = TRUE, col = "red", lwd = 2)

p <- 0.9 # your desired p (probability of true positive)
score_threshold.easme <- (log(p/(1-p))-model.easme$coefficients[1]) /
  model.easme$coefficients[2]

### FIELD SPARROW ###
fiespa <- read.table("C:/DesktopFolder/Eldon/Field_Sparrow_Final.txt",
                    sep = "\t", header = TRUE)

fiespa$Score <- as.numeric(substr(fiespa$Begin.File, 1, 5))

model.fiespa <- glm(Valid ~ Score, family = "binomial", data = fiespa)

plot(Valid~Score, data=fiespa, xlim=c(0,1), pch=16,
     col=rgb(0,0,0,.3))

curve(predict(model.fiespa, data.frame(Score = x), type = "response"),
      add = TRUE, col = "red", lwd = 2)

p <- 0.9 # your desired p (probability of true positive)
score_threshold.fiespa <- (log(p/(1-p))-model.fiespa$coefficients[1]) /
  model.fiespa$coefficients[2]

### UPLAND SANDPIPER ###
uplsan <- read.table("C:/DesktopFolder/Eldon/Upland_Sandpiper_Final.txt",
                     sep = "\t", header = TRUE)

uplsan$Score <- as.numeric(substr(uplsan$Begin.File, 1, 5))

model.uplsan <- glm(Valid ~ Score, family = "binomial", data = uplsan)

plot(Valid~Score, data=uplsan, xlim=c(0,1), pch=16,
     col=rgb(0,0,0,.3))

curve(predict(model.uplsan, data.frame(Score = x), type = "response"),
      add = TRUE, col = "red", lwd = 2)

p <- 0.9 # your desired p (probability of true positive)
score_threshold.uplsan <- (log(p/(1-p))-model.uplsan$coefficients[1]) /
  model.uplsan$coefficients[2]

### Horned Lark ###
# import a specified selection table:
horlar <- read.table("C:/Users/rwetz/Desktop/R_WorkingDirectory/Acoustic_Monitoring/Acoustic_Monitoring/Horned_Lark_Final.txt",
                      sep = "\t", header = TRUE)
# ROSE FIGURE OUT HOW TO REMOVE DOUBLES!!

# extract the numeric score from the file name:
horlar$Score <- as.numeric(substr(horlar$Begin.File, 1, 5))

# fit the logistic regression model:
model.horlar <- glm(Valid ~ Score, family = "binomial", data = horlar)

# plot the individual points (x = Score, y = Valid):
plot(Valid~Score, data=horlar, xlim=c(0,1), pch=16,
     col=rgb(0,0,0,.3))

# add the modeled regression relationship (a curve):
curve(predict(model.horlar, data.frame(Score = x), type = "response"),
      add = TRUE, col = "red", lwd = 2)

# compute score threshold for probability p of correct prediction:
p <- 0.9 # your desired p (probability of true positive)
score_threshold.horlar <- (log(p/(1-p))-model.horlar$coefficients[1]) /
  model.horlar$coefficients[2]

### Song Sparrow ###
# import a specified selection table:
sonspa <- read.table("C:/Users/rwetz/Desktop/R_WorkingDirectory/Acoustic_Monitoring/Acoustic_Monitoring/Song_Sparrow_Final.txt",
                     sep = "\t", header = TRUE)

# extract the numeric score from the file name:
sonspa$Score <- as.numeric(substr(sonspa$Begin.File, 1, 5))

# fit the logistic regression model:
model.sonspa <- glm(Valid ~ Score, family = "binomial", data = sonspa)

# plot the individual points (x = Score, y = Valid):
plot(Valid~Score, data=sonspa, xlim=c(0,1), pch=16,
     col=rgb(0,0,0,.3))

# add the modeled regression relationship (a curve):
curve(predict(model.sonspa, data.frame(Score = x), type = "response"),
      add = TRUE, col = "red", lwd = 2)

# compute score threshold for probability p of correct prediction:
p <- 0.9 # your desired p (probability of true positive)
score_threshold.sonspa <- (log(p/(1-p))-model.sonspa$coefficients[1]) /
  model.sonspa$coefficients[2]
