#!/bin/bash

mongoimport --db sawcer -c shops --file "/mongo_data/shops.geojson" --jsonArray
