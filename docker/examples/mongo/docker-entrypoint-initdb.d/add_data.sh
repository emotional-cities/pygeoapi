#!/bin/bash

mongoimport --db db -c shops --file "/mongo_data/output.geojson" --jsonArray
mongoimport --db db -c gas_stations --file "/mongo_data/output2.geojson" --jsonArray
