# rrricanesdata

Supporting datasets for the R package `rrricanes`.

* AA: Basin identifier (AL or EP)
* BB: Year number of cyclone
* CCCC: Year of cyclone

## Annual Summaries

AABBCCCC.Rda

Header | Definition
-------|-----------
`Key` | Unique identifier for cyclone
`Name` | Name of cyclone
`Wind` | Maximum wind of cyclone in knots
`StartDate` | Date/time of first advisory
`EndDate` | Date/time of last advisory

## Forecast/Advisory Data

AABBCCCC_fstadv.Rda

Header | Definition
-------|-----------
`Status` | Classification of cyclone
`Name` | Name of cyclone
`Adv` | Advisory number
`Date` | Date and time of advisory
`Key` | Unique identifier of cyclone
`Lat` | Latitude of cyclone center
`Lon` | Longitude of cyclone center
`Wind` | Maximum sustained one-minute winds in knots
`Gust` | Maximum sustained one-minute gusts in knots
`Pressure` | Minimum central pressure in millibars
`PosAcc` | Position accuracy of cyclone in nautical miles
`FwdDir` | Compass angle of forward motion
`FwdSpeed` | Forward speed in miles per hour
`Eye` | Size of eye in nautical miles
`NE64` | Radius of >=64kt winds in northeast quadrant
`SE64` | Radius of >=64kt winds in southeast quadrant
`SW64` | Radius of >=64kt winds in southwest quadrant
`NW64` | Radius of >=64kt winds in northwest quadrant
`NE50` | Radius of >=50kt winds in northeast quadrant
`SE50` | Radius of >=50kt winds in southeast quadrant
`SW50` | Radius of >=50kt winds in southwest quadrant
`NW50` | Radius of >=50kt winds in northwest quadrant
`NE34` | Radius of >=34kt winds in northwest quadrant
`SE34` | Radius of >=34kt winds in southeast quadrant
`SW34` | Radius of >=34kt winds in southwest quadrant
`NW34` | Radius of >=34kt winds in northwest quadrant
`Hr{n}FcstDate` | Forecast valid date *
`Hr{n}Lat` | Forecast latitude in `n` hours *
`Hr{n}Lon` | Forecast longitude in `n` hours *
`Hr{n}Wind` | Forecast maximum wind in `n` hours *
`Hr{n}Gust` | Forecast maximum gust in `n` hours *
`Hr{n}NE64` | Forecast wind radius in `n` hours *
`Hr{n}SE64` | Forecast wind radius in `n` hours *
`Hr{n}SW64` | Forecast wind radius in `n` hours *
`Hr{n}NW64` | Forecast wind radius in `n` hours *
`Hr{n}NE50` | Forecast wind radius in `n` hours *
`Hr{n}SE50` | Forecast wind radius in `n` hours *
`Hr{n}SW50` | Forecast wind radius in `n` hours *
`Hr{n}NW50` | Forecast wind radius in `n` hours *
`Hr{n}NE34` | Forecast wind radius in `n` hours *
`Hr{n}SE34` | Forecast wind radius in `n` hours *
`Hr{n}SW34` | Forecast wind radius in `n` hours *
`Hr{n}NW34` | Forecast wind radius in `n` hours *
`SeasNE` | Radius of 12ft seas in northeast qaudrant
`SeasSE` | Radius of 12ft seas in southeast qaudrant
`SeasSW` | Radius of 12ft seas in southwest qaudrant
`SeasNW` | Radius of 12ft seas in northwest qaudrant

* Forecast variables exist for 12, 24, 36, 48 and 72 hour intervals. For storms after 2005 season, 96 and 120 hours are available. Not all forecast periods will exist for every advisory.

## Strike Probabilities Data

AABBCCCC_prblty.Rda

Header | Definition
-------|-----------
`Status` | Status of cyclone
`Name` | Name of cyclone
`Adv` | Advisory number
`Date` | Date and time of advisory
`Location` | Location for respective strike probability
`A` | Probability of center passing within 65 nautical miles within 12 hours
`B` | Probability of center passing within 65 nautical miles within 24 hours
`C` | Probability of center passing within 65 nautical miles within 36 hours
`D` | Probability of center passing within 65 nautical miles within 48 hours
`E` | Probability of center passing within 65 nautical miles within 72 hours

## Wind Speed Probabilities Data

AABBCCCC_wndprb.Rda

Header | Definition
-------|-----------
`Key` | Unique identifier of cyclone
`Adv` | Advisory number
`Date` | Date and time of advisory
`Location` | Location for respective wind speed probability
`Wind` | Minium wind speed for which probabilities reference
`Wind12` | Probability of sustained `Wind` within 12 hours.
`Wind24` |  Probability of sustained `Wind` within 24 hours.
`Wind24Cum` | Cumulative probability through 24 hours.
`Wind36` |  Probability of sustained `Wind` within 36 hours.
`Wind36Cum` | Cumulative probability through 36 hours.
`Wind48` |  Probability of sustained `Wind` within 48 hours.
`Wind48Cum` | Cumulative probability through 48 hours.
`Wind72` |  Probability of sustained `Wind` within 72 hours.
`Wind72Cum` | Cumulative probability through 72 hours.
`Wind96` |  Probability of sustained `Wind` within 96 hours.
`Wind96Cum` | Cumulative probability through 96 hours.
`Wind120` |  Probability of sustained `Wind` within 120 hours.
`Wind120Cum` | Cumulative probability through 120 hours.

Source: [National Hurricane Center](http://www.nhc.noaa.gov/)