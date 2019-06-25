Rscript -e 'install.packages(c("dplyr", "lubridate", "purrr", "readr", "stringr", "tidyr"));'

# This step seems required as to this point the cli is not in a branch (?)
git clone https://github.com/ropensci/rrricanesdata.git
cd rrricanesdata

# Checkout branch develop
git checkout travis

# Update datasets
#Rscript -e "install.packages('remotes');"
#Rscript -e "remotes::install_github('ropensci/rrricanes@develop');"
Rscript data-raw/update_datasets.R --verbose

# Settings
GH_REPO="@github.com/$TRAVIS_REPO_SLUG.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git config --global user.name "Travis CI"
git config --global user.email "tim.trice@gmail.com"

# Once datasets are updated, need to commit
git add .
git commit -m 'Rebuild datasets'
git push $FULL_REPO
