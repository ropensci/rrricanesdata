#' @title update
#' @description Update rrricanesdata datasets with all products issued up to
#'   the end of the previous month.
#' @author Tim Trice

# ---- libraries ----
library(dplyr)
library(lubridate)
library(purrr)
library(readr)
library(rrricanes)
library(rrricanesdata)
library(stringr)
library(tidyr)

# ---- Current Year Data ----
this_years_storms <- get_storms(years = lubridate::year(Sys.Date()))
products <- get_storm_data(this_years_storms$Link)

# ---- rrricanesdata ----
#' Load current datasets
ds_names <- data(package = "rrricanesdata")$results[,3]

# Load existing datasets into list
ds_existing <- map(ds_names, ~get(.))
names(ds_existing) <- ds_names

# ---- last-update ----
#' When was the last cyclone updated?
last_update <- max(ds_existing$public$Date, ds_existing$update$Date)

#' Loop through ds; drop anything <= last_update and before 1st of current month.
ds <- map(.x = products, .f = ~filter(., Date > last_update))

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
storms <-
  fstadv %>%
  group_by(Key) %>%
  summarise(
    Name = last(Name),
    Wind = max(Wind, na.rm = TRUE),
    StartDate = first(Date),
    EndDate = last(Date)
  ) %>%
  arrange(StartDate)

# I'm apparently not good enough to be more efficient with this piece.
usethis::use_data(adv, overwrite = TRUE)
usethis::use_data(discus, overwrite = TRUE)
usethis::use_data(fcst, overwrite = TRUE)
usethis::use_data(fcst_wr, overwrite = TRUE)
usethis::use_data(fstadv, overwrite = TRUE)
usethis::use_data(public, overwrite = TRUE)
usethis::use_data(storms, overwrite = TRUE)
usethis::use_data(update, overwrite = TRUE)
usethis::use_data(wndprb, overwrite = TRUE)
usethis::use_data(wr, overwrite = TRUE)
