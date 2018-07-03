# Update rrricanesdata datasets with all products issued up to the end of the
# previous month.

library(dplyr)
library(lubridate)
library(purrr)
library(rrricanes)
library(rrricanesdata)

# Load dataset of all products for current year
ds <- get_storms() %>%
  pull(Link) %>%
  get_storm_data(products = c("discus", "fstadv", "public", "update", "wndprb"))

# Get names of rrricanesdata datasets
ds_names <- data(package = "rrricanesdata")$results[,3]

# Load existing datasets into list
ds_existing <- map(ds_names, ~get(.))
names(ds_existing) <- ds_names

# When was last update? Use public or update as these may contain intermediate
# data at a later date than fstadv or other products.
last_update <- max(ds_existing$public$Date, ds_existing$update$Date)

# Loop through ds; drop anything <= last_update and before 1st of current month.
ds <- map(ds, ~filter(.,
                      Date > last_update,
                      Date < ymd(sprintf("%s-%s-01",
                                         year(Sys.Date()),
                                         month(Sys.Date())))))

# Bind updated datasets to existing
ds_existing <- map2(ds, ds_existing[names(ds)], bind_rows)

# Bring to Global env
list2env(ds_existing, envir = .GlobalEnv)

# Build tidy fstadv datasets
if (exists("fstadv")) {
  adv <- tidy_adv(fstadv)
  fcst <- tidy_fcst(fstadv)
  fcst_wr <- tidy_fcst_wr(fstadv)
  wr <- tidy_wr(fstadv)
}

# Build storms dataframe
storms <- fstadv %>%
  group_by(Key) %>%
  summarise(Name = last(Name),
            Wind = max(Wind, na.rm = TRUE),
            StartDate = first(Date),
            EndDate = last(Date)) %>%
  arrange(StartDate)

# I'm apparently not good enough to be more efficient with this piece.
devtools::use_data(adv, overwrite = TRUE)
devtools::use_data(discus, overwrite = TRUE)
devtools::use_data(fcst, overwrite = TRUE)
devtools::use_data(fcst_wr, overwrite = TRUE)
devtools::use_data(fstadv, overwrite = TRUE)
devtools::use_data(public, overwrite = TRUE)
devtools::use_data(storms, overwrite = TRUE)
devtools::use_data(update, overwrite = TRUE)
devtools::use_data(wndprb, overwrite = TRUE)
devtools::use_data(wr, overwrite = TRUE)
