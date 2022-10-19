library("stars")

tif = system.file("tif/L7_ETMs.tif", package = "stars")
r = read_stars(tif,proxy=T)
pnt = st_sample(st_as_sfc(st_bbox(r)), 10)
st_extract(r, pnt) %>% st_as_sf()
