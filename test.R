Sys.setenv(GDAL_SKIP="DODS")
library(sf)
library(terra)

urls <- c(
   "https://wxs.ign.fr/altimetrie/geoportail/r/wms?version=1.3.0&request=GetMap&format=image/geotiff&layers=ELEVATION.ELEVATIONGRIDCOVERAGE.HIGHRES&styles=&width=1409&height=1958&crs=EPSG:2154&bbox=122533.640534,6793252.122258,129577.244682667,6803041.179502",
   "https://wxs.ign.fr/altimetrie/geoportail/r/wms?version=1.3.0&request=GetMap&format=image/geotiff&layers=ELEVATION.ELEVATIONGRIDCOVERAGE.HIGHRES&styles=&width=1409&height=1958&crs=EPSG:2154&bbox=129577.244682667,6793252.122258,136620.848831333,6803041.179502"
)

tiles_list <- NULL
for (i in seq_along(urls)) {
   message(i, "/", length(urls), " downloading...", sep = "")

   tmp <- tempfile(fileext = ".tif")
   
   gdal_utils(
      util = "translate",
      source = urls[i],
      destination = tmp,
      options = c("-a_srs", "EPSG:2154"))
   
   tiles_list <- c(tiles_list, tmp)
}

temp_ext <- tempfile(pattern = "rast", fileext = ".tif")

tiles_list <- normalizePath(tiles_list)
writeRaster(vrt(tiles_list, overwrite = TRUE), temp_ext, overwrite = TRUE)

rast <- rast(temp_ext)
