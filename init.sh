#!/bin/bash 
cd /uber
cp config.json /root/Python-Sample-Application/
cd /root/Python-Sample-Application
export UBER_CLIENT_ID=`jq '.UBER_CLIENT_ID' config.json`
export UBER_CLIENT_SECRET=`jq '.UBER_CLIENT_SECRET' config.json`
python app.py

