#!/usr/bin/env bash
# Default output
param_raw="false"
# Default unit
unit="metric"
symbol="C"
wind_unit="km/h"
# Default city is current location
# Find current location
mylocation=$(locateme -f "lat={LAT},lon={LON}")
my_lat=$(awk -F, '{print $1}' <<< "$mylocation" | sed 's/lat=//g')
my_lon=$(awk -F, '{print $2}' <<< "$mylocation" | sed 's/lat=//g')