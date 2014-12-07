# start-server.sh
#!/bin/bash
cd /app
source /etc/profile.d/rvm.sh
bundle exec unicorn -D -p 3000
