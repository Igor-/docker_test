# start-server.sh
#!/bin/bash
cd /app
/bin/bash -l bundle exec unicorn -D -p 3000
