# Rscript process_bef.R
# Rscript process_ntd.R


# topojson -o data/topo/county.json data/shp/county.geojson -p GEOID10 -p name -p totpop10 -p Reg_Comm -p Sq_Miles -s 1e-9
# topojson -o data/topo/rc.json data/shp/rc.geojson -p -s 1e-9
topojson \
	-e data/reps/sunlight/congress.csv \
	--id-property=+DISTRICT,+district \
	-o data/topo/congress.json data/shp/geojsonCONGPROP2_new.geojson \
	-p DISTRICT -d district -p last_name -p first_name -p party -p website -p oc_email -p phone \
	-s 1e-9

topojson \
	-e data/reps/sunlight/senate.csv \
	--id-property=+DISTRICT,+district \
	-o data/topo/senate.json data/shp/geojsonSENATE14-Shape_new.geojson \
	-p DISTRICT -d district -p last_name -p first_name -p party -p photo_url -p email -p url -p phone \
	-s 1e-9

topojson \
	-e data/reps/sunlight/house.csv \
	--id-property=+DISTRICT,+district \
	-o data/topo/house.json data/shp/geojsonHouse12re_new.geojson \
	-p DISTRICT -d district -p last_name -p first_name -p party -p photo_url -p email -p url -p phone \
	-s 1e-9


# topojson -o congress.json congress.geojson -p ID -p DISTRICT -s 1e-9
