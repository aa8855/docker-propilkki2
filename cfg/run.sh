#!/bin/bash
# read ini file into variables
. /etc/pp2host/pp2host.conf

# The important undocumented -start -argument
ARGS="-start"

if [[ "$PUBLIC" = "no" ]] || [[ -z "$PUBLIC" ]]; then
ARGS="$ARGS -nopublic"
fi
if [[ "$PUBLIC_WEB" = "no" ]] || [[ -z "$PUBLIC_WEB" ]]; then
ARGS="$ARGS -hideweb"
fi

# Run the server
/usr/sbin/pp2host \
${ARGS} \
-pid "/var/run/pilkki.pid" \
-port "${NETWORK_PORT}" \
-playername "${PLAYER_NAME}" \
-recmail "${REC_MAIL}" \
-recpassword "${REC_PASSWORD}" \
-hello "${HELLO}" \
-pathdata "/usr/share/pp2host" \
-pathsettings "/etc/pp2host/static" \
-pathlogs "/etc/pp2host/static" \
-pathtemp "/etc/pp2host/static"