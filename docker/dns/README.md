# Bind9 DNS Server

## build

`docker build -t dns:oyach .`

## run

`docker run -d --name <name> dns:oyach`

`docker run -d --name <name> -p 53:53 -p 53:53/udp -v /opt/oyach/etc/bind:/etc/bind dns:oyach`




