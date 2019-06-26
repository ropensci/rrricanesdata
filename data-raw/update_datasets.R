#' @title update
#' @description Update rrricanesdata datasets with all products issued up to
#'   the end of the previous month.
#' @author Tim Trice

library(rrricanesdata)

storm_list <-
  get_storm_list() %>%
  dplyr::filter(
    YYYY >= lubridate::year(last_update),
    # Filter out invest and disturbance areas
    CY < 70
  )

(keys <- storm_list$STORMID)

storm_data <- purrr::map(keys, get_ftp_storm_data)

tibble::glimpse(storm_data)

#' # ---- libraries ----
#' library(dplyr)
#' library(lubridate)
#' library(purrr)
#' library(readr)
#' library(rrricanes)
#' library(rrricanesdata)
#' library(stringr)
#' library(tidyr)
#'
#' url <- "ftp://ftp.nhc.noaa.gov/atcf/pub/"
#' con <- curl::curl(url, "r")
#' tbl <- read.table(con, stringsAsFactors = FALSE, fill = TRUE, skip = 1L)
#' close(con)
#'
#' tbl <-
#'   tbl %>%
#'   mutate(
#'     datetime = mdy(
#'       paste(
#'         V6,
#'         str_pad(V7, width = 2L, side = "left", pad = "0"),
#'         str_sub(V9, start = 5L, end = 8L),
#'         sep = "-")
#'     ),
#'     Key = str_to_upper(str_sub(V9, start = 1L, end = 8L))
#'   )
#'
#' # ---- rrricanesdata ----
#' #' Load current datasets
#' ds_names <- data(package = "rrricanesdata")$results[,3]
#'
#' # Load existing datasets into list
#' ds_existing <- map(ds_names, ~get(.))
#' names(ds_existing) <- ds_names
#'
#' # ---- last-update ----
#' #' When was the last cyclone updated?
#' last_update <- max(ds_existing$public$Date, ds_existing$update$Date)
#'
#' # --- current-keys ----
#' #' Get keys of "current" storms
#' keys <-
#'   tbl %>%
#'   filter(datetime >= floor_date(last_update, "day")) %>%
#'   distinct(Key) %>%
#'   pull()
#'
#' # ---- storm-list ----
#' #' Load storm_list.txt from NHC FTP server.
#' #' Var X13 will generate some NA warnings; this is fine. These are end dates
#' #'  for the cyclone.
#' storm_list <-
#'   read_csv(
#'     file = "ftp://ftp.nhc.noaa.gov/atcf/index/storm_list.txt",
#'     skip = 1L,
#'     col_names = FALSE,
#'     col_types = cols(
#'       .default = col_character(),
#'       X9 = col_integer(),
#'       X12 = col_integer(),
#'       X13 = col_integer()        #' See note above
#'     )
#'   ) %>%
#'   filter(X21 %in% keys)
#'
#' # ---- current-storms ----
#' #' Get listing of all cyclones for this year.
#' current_storms <-
#'   get_storms() %>%
#'   extract(
#'     col = Name,
#'     into = c("Class", "Name"),
#'     regex = "^([[:alpha:][:blank:]]+) ([[:alpha:][:punct:]]+)$"
#'   ) %>%
#'   mutate(Name = str_to_upper(Name)) %>%
#'   filter(Name %in% storm_list$X1) %>%
#'   pull(Link) %>%
#'   get_storm_data(products = c("discus", "fstadv", "public", "update", "wndprb"))
#'
#' #' Loop through ds; drop anything <= last_update and before 1st of current month.
#' ds <-
#'   current_storms %>%
#'   map(
#'     ~filter(
#'       .,
#'       Date > last_update,
#'       Date < ymd(sprintf("%s-%s-01",
#'                          year(Sys.Date()),
#'                          month(Sys.Date())
#'       ))
#'     )
#'   )
#'
#' # Bind updated datasets to existing
#' ds_existing <- map2(ds, ds_existing[names(ds)], bind_rows)
#'
#' # Bring to Global env
#' list2env(ds_existing, envir = .GlobalEnv)
#'
#' # Build tidy fstadv datasets
#' if (exists("fstadv")) {
#'   adv <- tidy_adv(fstadv)
#'   fcst <- tidy_fcst(fstadv)
#'   fcst_wr <- tidy_fcst_wr(fstadv)
#'   wr <- tidy_wr(fstadv)
#' }
#'
#' # Build storms dataframe
#' storms <- fstadv %>%
#'   group_by(Key) %>%
#'   summarise(Name = last(Name),
#'             Wind = max(Wind, na.rm = TRUE),
#'             StartDate = first(Date),
#'             EndDate = last(Date)) %>%
#'   arrange(StartDate)
#'
#' # I'm apparently not good enough to be more efficient with this piece.
#' usethis::use_data(adv, overwrite = TRUE)
#' usethis::use_data(discus, overwrite = TRUE)
#' usethis::use_data(fcst, overwrite = TRUE)
#' usethis::use_data(fcst_wr, overwrite = TRUE)
#' usethis::use_data(fstadv, overwrite = TRUE)
#' usethis::use_data(public, overwrite = TRUE)
#' usethis::use_data(storms, overwrite = TRUE)
#' usethis::use_data(update, overwrite = TRUE)
#' usethis::use_data(wndprb, overwrite = TRUE)
#' usethis::use_data(wr, overwrite = TRUE)
