Sample docker compose file for a home media/networking server

Note: these services are only exposed to my LAN. This compose file lacks the security needed for these services to be publicly exposed.

This is running on a Synology NAS which requires a hack to get it to work. The change-ports script makes the built-in nginx webserver listen on ports 81 and 444 to free up 80 and 443 for traefik.

Major credit to htpcBeginner's fantastic website and examples.

