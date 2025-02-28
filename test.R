library(terra)
libVersion()

url <- "/vsizip/vsicurl/https://naciscdn.org/naturalearth/10m/raster/SR_LR.zip/SR_LR.tif"
set.seed(1)
pts <- cbind(x = runif(44000, -180, 180), y = runif(44000, -90, 90))

r <- rast(url)
inMemory(r)
extr <- extract(r, pts)
any(is.na(extr$SR_LR))
length(extr$SR_LR[is.na(extr$SR_LR)])
