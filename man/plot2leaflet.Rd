% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/plot2leaflet.R
\name{plot2leaflet}
\alias{plot2leaflet}
\title{Plot a 'location' object to a leaflet widget}
\usage{
plot2leaflet(theObject, popup = "NotDefined")
}
\arguments{
\item{theObject}{A location.}
}
\value{
A leaflet object.
}
\description{
Plot a 'location' object to a leaflet widget
}
\examples{
rosenbergstrasse59 <- new("location",
name = "FHSG",
street = "Rosenbergstrasse 59",
zip_code = "9001",
community = "St.Gallen",
canton = "SG",
lat = geocoder::geocode("Rosenbergstrasse 59, 9001 St.Gallen")$lat,
lng = geocoder::geocode("Rosenbergstrasse 59, 9001 St.Gallen")$lng)
map <- plot2leaflet(rosenbergstrasse59)
map

twoPlaces <- new("location",
                street = c("Rosenbergstrasse 59","Bahnhofplatz"),
                 zip_code = c("9001","9000"),
                 community = c("St.Gallen","St.Gallen"),
                 canton = c("SG","SG"),
                 lat = c(geocoder::geocode(
                   "Rosenbergstrasse 59, 9001 St.Gallen")$lat,
                   geocoder::geocode(
                     "Bahnhofplatz, 9000 St.Gallen")$lat),
                 lng = c(geocoder::geocode(
                   "Rosenbergstrasse 59, 9001 St.Gallen")$lng,
                   geocoder::geocode("Bahnhofplatz, 9000 St.Gallen")$lng)
)
map <- plot2leaflet(twoPlaces)
map
}

