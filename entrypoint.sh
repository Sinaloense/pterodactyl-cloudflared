#!/bin/bash
cd /home/container

# Output Current Cloudflared Version
cloudflared --version

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${PRINT_SAFE_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
