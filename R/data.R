#' @title rrricanesdata
#' @description rrricanesdata is the complimentary data package to `rrricanes`.
#' @docType package
#' @name rrricanes
NULL

#' Advisory - Basic advisory data
#'
#' \describe{
#'    \item{Key}{Unique identifier of cyclone}
#'    \item{Adv}{Advisory number}
#'    \item{Date}{Date and time of advisory}
#'    \item{Status}{Classification of cyclone}
#'    \item{Name}{Name of cyclone}
#'    \item{Lat}{Latitude of cyclone center}
#'    \item{Lon}{Longitude of cyclone center}
#'    \item{Wind}{Maximum sustained one-minute winds in knots}
#'    \item{Gust}{Maximum sustained one-minute gusts in knots}
#'    \item{Pressure}{Minimum central pressure in millibars}
#'    \item{PosAcc}{Position accuracy of cyclone in nautical miles}
#'    \item{FwdDir}{Compass angle of forward motion}
#'    \item{FwdSpeed}{Forward speed in miles per hour}
#'    \item{Eye}{Size of eye in nautical miles}
#'    \item{SeasNE}{Radius of 12ft seas in northeast quadrant}
#'    \item{SeasSE}{Radius of 12ft seas in southeast quadrant}
#'    \item{SeasSW}{Radius of 12ft seas in southwest quadrant}
#'    \item{SeasNW}{Radius of 12ft seas in northwest quadrant}
#' }
"adv"

#' Storm Discussions
#'
#' \describe{
#'   \item{Status}{Classification of storm, e.g., Tropical Storm, Hurricane,
#'     etc.}
#'   \item{Name}{Name of storm}
#'   \item{Adv}{Advisory Number}
#'   \item{Date}{Date of advisory issuance}
#'   \item{Key}{ID of cyclone}
#'   \item{Contents}{Text content of product}
#' }
"discus"

#' Forecasts - Forecast positions per Forecast/Advisory
#'
#' \describe{
#'    \item{Key}{Unique identifier of cyclone}
#'    \item{Adv}{Advisory number}
#'    \item{Date}{Date and time of advisory}
#'    \item{FcstDate}{Forecast date and time in UTC}
#'    \item{Lat}{Forecast latitude}
#'    \item{Lon}{Forecast Longitude}
#'    \item{Wind}{Forecast wind in knots}
#'    \item{Gust}{Forecast gust in knots}
#' }
"fcst"

#' Forecast Wind Radius - Wind radius for each \code{fcst}
#'
#' \describe{
#'    \item{Key}{Unique identifier of cyclone}
#'    \item{Adv}{Advisory number}
#'    \item{Date}{Date and time of advisory}
#'    \item{FcstDate}{Forecast date and time in UTC}
#'    \item{WindField}{Minimum sustained wind field for quadrants}
#'    \item{NE}{Radius in nautical miles for northeast quadrant}
#'    \item{SE}{Radius in nautical miles for southeast quadrant}
#'    \item{SW}{Radius in nautical miles for southwest quadrant}
#'    \item{NW}{Radius in nautical miles for northwest quadrant}
#' }
"fcst_wr"

#' Forecast/Advisory
#'
#' \describe{
#'    \item{Status}{Classification of cyclone}
#'    \item{Name}{Name of cyclone}
#'    \item{Adv}{Advisory number}
#'    \item{Date}{Date and time of advisory}
#'    \item{Key}{Unique identifier of cyclone}
#'    \item{Lat}{Latitude of cyclone center}
#'    \item{Lon}{Longitude of cyclone center}
#'    \item{Wind}{Maximum sustained one-minute winds in knots}
#'    \item{Gust}{Maximum sustained one-minute gusts in knots}
#'    \item{Pressure}{Minimum central pressure in millibars}
#'    \item{PosAcc}{Position accuracy of cyclone in nautical miles}
#'    \item{FwdDir}{Compass angle of forward motion}
#'    \item{FwdSpeed}{Forward speed in miles per hour}
#'    \item{Eye}{Size of eye in nautical miles}
#'    \item{NE64}{Radius of >=64kt winds in northeast quadrant}
#'    \item{SE64}{Radius of >=64kt winds in southeast quadrant}
#'    \item{SW64}{Radius of >=64kt winds in southwest quadrant}
#'    \item{NW64}{Radius of >=64kt winds in northwest quadrant}
#'    \item{NE50}{Radius of >=50kt winds in northeast quadrant}
#'    \item{SE50}{Radius of >=50kt winds in southeast quadrant}
#'    \item{SW50}{Radius of >=50kt winds in southwest quadrant}
#'    \item{NW50}{Radius of >=50kt winds in northwest quadrant}
#'    \item{NE34}{Radius of >=34kt winds in northwest quadrant}
#'    \item{SE34}{Radius of >=34kt winds in southeast quadrant}
#'    \item{SW34}{Radius of >=34kt winds in southwest quadrant}
#'    \item{NW34}{Radius of >=34kt winds in northwest quadrant}
#'    \item{Hr\{n\}FcstDate}{Forecast valid date}
#'    \item{Hr\{n\}Lat}{Forecast latitude in `n` hours}
#'    \item{Hr\{n\}Lon}{Forecast longitude in `n` hours}
#'    \item{Hr\{n\}Wind}{Forecast maximum wind in `n` hours}
#'    \item{Hr\{n\}Gust}{Forecast maximum gust in `n` hours}
#'    \item{Hr\{n\}NE64}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}SE64}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}SW64}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}NW64}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}NE50}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}SE50}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}SW50}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}NW50}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}NE34}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}SE34}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}SW34}{Forecast wind radius in `n` hours}
#'    \item{Hr\{n\}NW34}{Forecast wind radius in `n` hours}
#'    \item{SeasNE}{Radius of 12ft seas in northeast quadrant}
#'    \item{SeasSE}{Radius of 12ft seas in southeast quadrant}
#'    \item{SeasSW}{Radius of 12ft seas in southwest quadrant}
#'    \item{SeasNW}{Radius of 12ft seas in northwest quadrant}
#' }
"fstadv"

#' Position Estimates
#'
#' \describe{
#'   \item{Status}{Classification of storm, e.g., Tropical Storm, Hurricane,
#'     etc.}
#'   \item{Name}{Name of storm}
#'   \item{Date}{Date of advisory issuance}
#'   \item{Contents}{Text content of product}
#' }
"posest"

#' Strike Probabilities
#'
#' \describe{
#'   \item{Status}{Classification of storm, e.g., Tropical Storm, Hurricane,
#'     etc.}
#'   \item{Name}{Name of storm}
#'   \item{Adv}{Advisory Number}
#'   \item{Date}{Date of advisory issuance}
#'   \item{Location}{Location for which the probability statistics rely}
#'   \item{A}{Probability of a strike within the next 12 hours}
#'   \item{B}{Probability of a strike between 12 and 24 hours}
#'   \item{C}{Probability of a strike between 24 and 36 hours}
#'   \item{D}{Probability of a strike between 36 and 48 hours}
#'   \item{E}{Probability of a strike between 48 and 72 hours}
#' }
"prblty"

#' Public Advisory
#'
#' \describe{
#'   \item{Status}{Classification of storm, e.g., Tropical Storm, Hurricane,
#'     etc.}
#'   \item{Name}{Name of storm}
#'   \item{Adv}{Advisory Number}
#'   \item{Date}{Date of advisory issuance}
#'   \item{Key}{Unique ID of the cyclone}
#'   \item{Contents}{Text content of product}
#' }
"public"

#' Storm Summary
#'
#' \describe{
#'   \item{Key}{Storm ID}
#'   \item{Name}{Storm name}
#'   \item{Wind}{Peak wind speed in knots}
#'   \item{StartDate}{Date/time of first advisory}
#'   \item{EndDate}{Date/time of last advisory}
#' }
"storms"

#' Tropical Cyclone Updates
#'
#' \describe{
#'   \item{Status}{Classification of storm, e.g., Tropical Storm, Hurricane,
#'     etc.}
#'   \item{Name}{Name of storm}
#'   \item{Date}{Date of advisory issuance}
#'   \item{Key}{Unique ID of cyclone}
#'   \item{Contents}{Text content of product}
#' }
"update"

#' Wind Speed Probabilities
#'
#' \describe{
#'   \item{Status}{Classification of storm, e.g., Tropical Storm, Hurricane,
#'     etc.}
#'   \item{Name}{Name of storm}
#'   \item{Adv}{Advisory Number}
#'   \item{Date}{Date of advisory issuance}
#'   \item{Wind}{Minimum wind speed for which probabilities reference}
#'   \item{Wind12}{Probability of sustained `Wind` within 12 hours}
#'   \item{Wind24}{Probability of sustained `Wind` within 24 hours}
#'   \item{Wind24Cum}{Cumulative probability through 24 hours}
#'   \item{Wind36}{Probability of sustained `Wind` within 36 hours}
#'   \item{Wind36Cum}{Cumulative probability through 36 hours}
#'   \item{Wind48}{Probability of sustained `Wind` within 48 hours}
#'   \item{Wind48Cum}{Cumulative probability through 48 hours}
#'   \item{Wind72}{Probability of sustained `Wind` within 72 hours}
#'   \item{Wind72Cum}{Cumulative probability through 72 hours}
#'   \item{Wind96}{Probability of sustained `Wind` within 96 hours}
#'   \item{Wind96Cum}{Cumulative probability through 96 hours}
#'   \item{Wind120}{Probability of sustained `Wind` within 120 hours}
#'   \item{Wind120Cum}{Cumulative probability through 120 hours}
#' }
"wndprb"

#' Wind Radius - Current wind radius
#'
#' \describe{
#'    \item{Key}{Unique identifier of cyclone}
#'    \item{Adv}{Advisory number}
#'    \item{Date}{Date and time of advisory}
#'    \item{Windfield}{Minimum wind speed expected}
#'    \item{NE}{Radius of `Windfield` in the northeast quadrant}
#'    \item{SE}{Radius of `Windfield` in the southeast quadrant}
#'    \item{SW}{Radius of `Windfield` in the southwest quadrant}
#'    \item{NW}{Radius of `Windfield` in the northwest quadrant}
#' }
"wr"
