# create a method to plot a location object to a leaflet object
#' Plot a 'location' object to a leaflet widget
#'
#' @param theObject A location.
#' @return A leaflet object.
#' @examples
#' rosenbergstrasse59 <- new("location",
#' name = "FHSG",
#' street = "Rosenbergstrasse 59",
#' zip_code = "9001",
#' community = "St.Gallen",
#' canton = "SG",
#' lat = geocoder::geocode("Rosenbergstrasse 59, 9001 St.Gallen")$lat,
#' lng = geocoder::geocode("Rosenbergstrasse 59, 9001 St.Gallen")$lng)
#' map <- plot2leaflet(rosenbergstrasse59)
#' map
#'
#' twoPlaces <- new("location",
#'                 street = c("Rosenbergstrasse 59","Bahnhofplatz"),
#'                  zip_code = c("9001","9000"),
#'                  community = c("St.Gallen","St.Gallen"),
#'                  canton = c("SG","SG"),
#'                  lat = c(geocoder::geocode(
#'                    "Rosenbergstrasse 59, 9001 St.Gallen")$lat,
#'                    geocoder::geocode(
#'                      "Bahnhofplatz, 9000 St.Gallen")$lat),
#'                  lng = c(geocoder::geocode(
#'                    "Rosenbergstrasse 59, 9001 St.Gallen")$lng,
#'                    geocoder::geocode("Bahnhofplatz, 9000 St.Gallen")$lng)
#' )
#' map <- plot2leaflet(twoPlaces)
#' map

setGeneric(name = "plot2leaflet", def = function(theObject, popup = "NotDefined"){
  standardGeneric("plot2leaflet")
}
)

setMethod(f = "plot2leaflet", signature = "location",
          definition = function(theObject, popup){
            fhs <- rgb(0, 102, 153, maxColorValue=255)
            library(magrittr)
            library(leaflet)
            m <- leaflet(width = "100%") %>%
              # Base groups
              addTiles(group = "OSM (default)") %>%
              addProviderTiles("Stamen.Toner", group = "Toner") %>%
              addProviderTiles("Stamen.TonerLite", group = "Toner Lite") %>%
              # Overlay groups
              addCircleMarkers(
                lng = theObject@lng,
                lat = theObject@lat,
                popup = popup,
                group = theObject@name,
                radius = 6,
                color = fhs,
                fillOpacity = 0.7
              ) %>%
              # Layers control
              addLayersControl(
                baseGroups = c("OSM (default)", "Toner", "Toner Lite"),
                overlayGroups = c(theObject@name),
                options = layersControlOptions(collapsed = FALSE)
              )
              m
          }
)
