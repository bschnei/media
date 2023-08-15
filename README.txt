Sample docker compose file for small home media server stack

I started with a simple goal: put authentication in front of some common media server webapps I had running at home. I wanted something that could support multiple users as well as access controls to specify which resources would be accessible to which users.

I wound up using Authelia because it had support for both of those features along with good documentation and cool devs.

This is running on a Synology NAS which requires some ugly hacks to get it to work. The change-ports script makes the built-in nginx webserver listen on ports 81 and 444 to free up 80 and 443 for traefik.

Major credit to htpcBeginner's fantastic website and examples.
