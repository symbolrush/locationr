#' An S4 Class to represent a location object.
#'
#' @slot name A character vector
#' @slot street A character vector
#' @slot zip_code A character vector
#' @slot community A character vector
#' @slot canton A character vector of length 2
#' @slot lat A numeric value
#' @slot lng A numeric value
setClass(
  "location",
  representation(
    name = "character",
    street = "character",
    zip_code = "character",
    community = "character",
    canton = "character",
    lat = "numeric",
    lng = "numeric"
  )
)

# create a method to assign the value of a coordinate
setGeneric(name = "setCoordinate", def = function(theObject,lat,lng){
  standardGeneric("setCoordinate")
}
)

setMethod(f = "setCoordinate", signature = "location",
  definition = function(theObject,lat,lng){
    theObject@lat <- lat
    theObject@lng <- lng
    return(theObject)
  }
)

# create a method to plot a location object to a .png file
setGeneric(name = "plot2png", def = function(theObject,width,height){
  standardGeneric("plot2png")
}
)

setMethod(f = "plot2png", signature = "location",
          definition = function(theObject,width,height){
            print("to png")
          }
)
