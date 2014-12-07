#!/bin/bash
cd /application
source /etc/profile.d/rvm.sh
bundle exec unicorn -p 3000