#!/bin/bash

mongoimport --db sawcer -c shops --file "/mongo_data/output.geojson" --jsonArray
