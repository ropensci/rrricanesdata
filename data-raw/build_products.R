#' This is a very basic version. Before execution, it should be rewritten to
#' get all products at once, but by year or every two years, then the list of
#' dataframes returned.

library(devtools)
library(dplyr)
library(rrricanes)

#' get storms
df <- get_storms(years = 1998:2017, basins = c("AL", "EP"))
l <- df$Link

#' download products
discus <- get_discus(l)
fstadv <- get_fstadv(l)
adv <- tidy_fstadv(fstadv)
wr <- tidy_wr(fstadv)
fcst <- tidy_fcst(fstadv)
fcst_wr <- tidy_fcst_wr(fstadv)
posest <- get_posest(l)
prblty <- get_prblty(l)
public <- get_public(l)
update <- get_update(l)
wndprb <- get_wndprb(l)

#' build summary of storms off `fstadv`
storms <- fstadv %>%
  group_by(Key) %>%
  summarise(Name = last(Name),
            Wind = max(Wind),
            StartDate = first(Date),
            EndDate = last(Date))

#' save data
use_data(discus, fstadv, adv, wr, fcst, fcst_wr, posest, prblty, public, update,
         wndprb, storms, overwrite = TRUE)
