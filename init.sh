#!/bin/bash 
cd /uber
export UBER_CLIENT_ID=`jq '.UBER_CLIENT_ID' config.json`
export UBER_CLIENT_SECRET=`jq '.UBER_CLIENT_SECRET' config.json`
cd /root/Python-Sample-Application
python app.py
