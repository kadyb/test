library("stars")
library("exactextractr")

pop_count = read_stars(system.file('sao_miguel/gpw_v411_2020_count_2020.tif', package = 'exactextractr'))
concelhos = read_sf(system.file('sao_miguel/concelhos.gpkg', package = 'exactextractr'))

aggregate(pop_count, concelhos, FUN = mean, exact = TRUE)
