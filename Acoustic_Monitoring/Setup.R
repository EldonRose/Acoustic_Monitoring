# Install git and Github Desktop: 
  # https://git-scm.com/install/
  # https://desktop.github.com/download/

# Packages
install.packages("usethis")
install.packages("gitcreds")

# Libraries
library(usethis)
library(gitcreds)

# Set WD
setwd("C:/DesktopFolder/Eldon/Acoustic_Monitoring")

# Initialize your local git repo to this project
use_git()
3

# Create and use personal access token (PAT) to link RStudio and Github
create_github_token()

  # Rose's token: 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

gitcreds_set()

# Connect Project to Repo 
  # FIRST TIME ONLY!
# use_github()
2
