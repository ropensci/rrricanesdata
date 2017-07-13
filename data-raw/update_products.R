library(devtools)
library(dplyr)
library(rrricanes)

#' Load existing datasets
load_data(pkg = ".")

#' get storms for current year
df <- get_storms(years = 2017)
l <- df$Link

#' Get last date in `fstadv`
last_date <- max(fstadv$Date)

new_discus <- get_discus(l) %>% filter(Date > last_date)
new_fstadv <- get_fstadv(l) %>% filter(Date > last_date)

#' tidy fstadv
new_adv <- tidy_fstadv(new_fstadv)
new_wr <- tidy_wr(new_fstadv)
new_fcst <- tidy_fcst(new_fstadv)
new_fcst_wr <- tidy_fcst_wr(new_fstadv)

#' rest of products
new_public <- get_public(l) %>% filter(Date > last_date)
new_update <- get_update(l) %>% filter(Date > last_date)
new_wndprb <- get_wndprb(l) %>% filter(Date > last_date)

#' bind to original
discus <- bind_rows(discus, new_discus)
fstadv <- bind_rows(fstadv, new_fstadv)
adv <- bind_rows(adv, new_adv)
wr <- bind_rows(wr, new_wr)
fcst <- bind_rows(fcst, new_fcst)
fcst_wr <- bind_rows(fcst_wr, new_fcst_wr)
public <- bind_rows(public, new_public)
update <- bind_rows(update, new_update)
wndprb <- bind_rows(wndprb, new_wndprb)
