#!/bin/bash

sleep 5

#Disable acceleration

xinput set-prop 6 'Device Accel Profile' -1
xinput set-prop 6 'Device Accel Velocity Scaling' 1
xinput set-prop 7 'Device Accel Profile' -1
xinput set-prop 7 'Device Accel Velocity Scaling' 1

