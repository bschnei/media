Sample docker compose file for small home media server stack

I started with a simple goal: put authentication in front of some common media server webapps I had running at home. I wanted something that could support multiple users as well as access controls to specify which resources would be accessible to which users.

I wound up using Authelia because it had support for both of those features along with good documentation and cool devs.

The one disappointment I discovered was that external IP addresses did not get passed through Docker which means I could not use Authelia's IP-based access controls. I think the cleanest solution would be to move traefik into a separate docker network running in "host" mode, but that's not without its tradeoffs.

This is running on a Synology NAS which requires some ugly hacks to get it to work.

Major credit to htpcBeginner's fantastic website and examples.
