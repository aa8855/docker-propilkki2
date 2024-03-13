# read ini file into variables
. /etc/pp2host/pp2host.conf

# The important undocumented -start -argument
ARGS="-start"

if [ "$PUBLIC" = "no" ]; then
ARGS="$ARGS -nopublic"
fi
if [ "$PUBLIC_WEB" = "no" ]; then
ARGS="$ARGS -hideweb"
fi

# Run the server
/usr/sbin/pp2host \
${ARGS} \
-pid "/var/run/pilkki.pid" \
-port "${NETWORK_PORT}" \
-playername "${PLAYER_NAME}" \
-playernation "${PLAYER_NATION}" \
-playerpassword "${ADMIN_PASSWORD}" \
-gamepassword "${GAME_PASSWORD}" \
-hostpassword "${HOST_PASSWORD}" \
-adminpassword "${ADMIN_PASSWORD}" \
-recmail "${REC_MAIL}" \
-recpassword "${REC_PASSWORD}" \
-hello "${HELLO}" \
-pathdata "/usr/share/pp2host" \
-pathsettings "/etc/pp2host/static" \
-pathlogs "/etc/pp2host/static" \
-pathtemp "/etc/pp2host/static" \
-minver "${MIN_CLIENT_VER}" \
-maxver "${MAX_CLIENT_VER}"

#sleep 3600