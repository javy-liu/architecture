

sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

docker-machine create -d virtualbox local

docker-machine create \
    -d virtualbox \
    --swarm \
    --swarm-master \
    --swarm-discovery token://689177081933d2f16d3d5abcaf9e59a8 \
    swarm-master

docker-machine create \
    -d virtualbox \
    --swarm \
    --swarm-discovery token://689177081933d2f16d3d5abcaf9e59a8 \
    swarm-node-00

docker run -d -p 5000:5000 \
    -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/var/lib/registry \
    -v /Users/Shared/docker/registry/registry:/var/lib/registry \
    --restart=always --name registry registry:2

docker run -d -p 5000:5000 \
    -e STANDALONE=false \
    -e MIRROR_SOURCE=https://registry-1.docker.io \
    -e MIRROR_SOURCE_INDEX=https://index.docker.io \
    --restart=always --name mirror3 registry

docker run -d --restart=always --name nginx -p 80:80 -p 443:443 --dns 192.168.99.1 -v /Users/Shared/docker/nginx/nginx:/etc/nginx -v /Users/Shared/docker/nginx/www:/usr/share/nginx/html nginx

docker run -d -p 5000:5000 --restart=always --name registry -v -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/var/lib/registry registry:2.0.1


docker-machine create \
    -d virtualbox \
    --swarm \
    --swarm-master \
    --swarm-discovery token://689177081933d2f16d3d5abcaf9e59a8 \
    --engine-registry-mirror 192.168.99.100:5000 \
    swarm-master



eval $(docker-machine env --swarm swarm-master)

docker run -d -p 8081:8081 --name nexus --restart=always \
-v /Users/Shared/docker/nexus/sonatype-work:/sonatype-work \
nexus

curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

