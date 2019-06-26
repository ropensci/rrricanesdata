echo "What R Packages are installed?"

Rscript -e 'remotes::install_github("ropensci/rrricanesdata@develop");'
Rscript -e 'installed.packages()'

url=ftp://ftp.nhc.noaa.gov/atcf/pub/al012019.public.001
curl ${url} -I -o headers -s
wget --debug --verbose ${url}

Rscript -e 'readLines(curl::curl("ftp://ftp.nhc.noaa.gov/atcf/pub/"));'

# exit 1

echo "Cloning rrricanesdata"

# This step seems required as to this point the cli is not in a branch (?)
git clone https://github.com/ropensci/rrricanesdata.git
cd rrricanesdata

# Checkout branch develop
git checkout travis

# Update datasets
#Rscript -e "install.packages('remotes');"
#Rscript -e "remotes::install_github('ropensci/rrricanes@develop');"
Rscript --verbose data-raw/update_datasets.R

# Settings
GH_REPO="@github.com/$TRAVIS_REPO_SLUG.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git config --global user.name "Travis CI"
git config --global user.email "tim.trice@gmail.com"

# Once datasets are updated, need to commit
git add .
git commit -m 'Rebuild datasets'
git push $FULL_REPO
