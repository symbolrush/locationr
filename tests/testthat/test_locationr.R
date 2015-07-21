test_that("class of a location object is 'location'", {
  expect_match(class(new("location")), "location")
})


test_that(
  "Method 'plot2leaflet' works with a location object of a single location", {
    rosenbergstrasse59 <- new("location",
                              name = "FHSG",
                              street = "Rosenbergstrasse 59",
                              zip_code = "9001",
                              community = "St.Gallen",
                              canton = "SG",
                              lat = geocoder::geocode(
                                "Rosenbergstrasse 59, 9001 St.Gallen")$lat,
                              lng = geocoder::geocode(
                                "Rosenbergstrasse 59, 9001 St.Gallen")$lng)
    map <- plot2leaflet(rosenbergstrasse59)
    map
    expect_match(class(rosenbergstrasse59), "location")
    expect_match(class(map)[1], "leaflet")
    expect_match(class(map)[2], "htmlwidget")
  })


test_that("Method 'plot2leaflet' works with a vector of locations", {
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
                     geocoder::geocode("Bahnhofplatz, 9000 St.Gallen")$lat)
  )
  map <- plot2leaflet(twoPlaces)
  map
  expect_match(class(map)[1], "leaflet")
  expect_match(class(map)[2], "htmlwidget")
})
