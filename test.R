library(terra)
libVersion()
gdal(warn = 1)

url <- "/vsicurl/https://os.zhdk.cloud.switch.ch/chelsav2/GLOBAL/climatologies/1981-2010/bio/CHELSA_bio10_1981-2010_V.2.1.tif"
e = ext(c(-26, 37.5, 34, 72))
r = rast(url, win = e, raw = TRUE)
r = toMemory(r)
