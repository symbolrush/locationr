import_canton <- function(ct){
  locations <- import()
  # Filter out unused columns
  locations <- locations[,c(3,4,5)]
  # give meaningful names
  names(locations) <- c("zip_code", "community", "canton")
  locations <- subset(locations, locations$canton == ct)
}

import_locations_bfs <- function(){
  locations <- read.csv(system.file("extdata", "CH_Gemeinden_BFS.csv", package = "locationr"), sep = ",")
  names(locations) <- c("political_community","BFSNR","zip_code", "community", "canton","einwohner")
  return(locations)
}

import_plz_x_y <- function(){
  plz_x_y <- read.csv(system.file("extdata", "PLZ_X_Y.csv", package = "locationr"), sep= ";", header=FALSE)
  names(plz_x_y) <- c("zip_code", "canton", "y", "x")
  plz_x_y <- plz_x_y[,c(1,3,4)]
}

import_and_merge <- function(){
  gemeinden <- import_locations_bfs()
  plz_x_y <- import_plz_x_y()
  locations <- merge(gemeinden, plz_x_y)
}
