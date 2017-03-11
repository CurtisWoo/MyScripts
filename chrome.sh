#!/bin/bash
#Script to start chromium and set ~/.cache/chromium/Default to /tmp/cache

chromium --disk-cache-dir=/tmp/cache &
