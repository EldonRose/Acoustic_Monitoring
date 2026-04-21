# Install git and Github Desktop: 
  # https://git-scm.com/install/
  # https://desktop.github.com/download/

# Cheatsheet to set up github for the first time
  # https://rfortherestofus.com/2021/02/how-to-use-git-github-with-r/
  

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

# Create and use personal access token (PAT) to link RStudio and Github
create_github_token()

gitcreds_set()

# Connect Project to Repo 
  # FIRST TIME ONLY!
# use_github()
