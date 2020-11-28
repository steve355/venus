#!/usr/bin/env bash

cd /naiveproxy
naive &

cd caddy
caddy -log stdout -agree=true
