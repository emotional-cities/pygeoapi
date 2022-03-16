>&2 echo "Pushing geopackage indexes"
>&2 echo "GeoPackage is converted in GeoJSON before being loaded into Elastic to workaround a bug with capital letters in geometry.type"
exec ogr2ogr -geomfield geom -unsetFid -nlt MULTIPOLYGON -s_srs EPSG:27700 -t_srs EPSG:4326 -makevalid -overwrite -f GeoJSON /tmp/activity_level_ldn.geojson /data/activity_level_ldn.gpkg &
sleep 5
exec ogr2ogr -unsetFid -lco GEOMETRY_NAME=geometry -overwrite -lco INDEX_NAME=activity_level_ldn -lco OVERWRITE_INDEX=YES ES:http://elastic_search:9200 /tmp/activity_level_ldn.geojson &
>&2 echo "activity_level_ldn done"
sleep 5
exec ogr2ogr -geomfield geom -unsetFid -nlt MULTIPOLYGON -s_srs EPSG:27700 -t_srs EPSG:4326 -makevalid -overwrite -f GeoJSON /tmp/cardivasular_disease_ldn.geojson /data/cardivasular_disease_ldn.gpkg &
sleep 5
exec ogr2ogr -unsetFid -lco GEOMETRY_NAME=geometry -overwrite -lco INDEX_NAME=cardivasular_disease_ldn -lco OVERWRITE_INDEX=YES ES:http://elastic_search:9200 /tmp/cardivasular_disease_ldn.geojson &
>&2 echo "cardivasular_disease_ldn done"
sleep 5
exec ogr2ogr -geomfield geom -unsetFid -s_srs EPSG:27700 -t_srs EPSG:4326 -makevalid -overwrite -f GeoJSON /tmp/tweet_count_sample.geojson /data/tweet_count_sample.gpkg &
sleep 5
exec ogr2ogr -unsetFid -lco GEOMETRY_NAME=geometry -overwrite -lco INDEX_NAME=tweet_count_sample -lco OVERWRITE_INDEX=YES ES:http://elastic_search:9200 /tmp/tweet_count_sample.geojson &
>&2 echo "tweet_count_sample done"
>&2 echo "Geopackage indexes are loaded"
exec $@