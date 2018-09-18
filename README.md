# Dockerized ws-to-tcp

A containerized version of this simple (https://github.com/mafintosh/ws-to-tcp) ws proxy, used because the mqtt client I was using didn't play nicely with websockify. This is a multi-arch build that contains `armhf` and `amd64`.

Docker instructions not included, but here are some compose instructions instead:

```
wsproxy:
  image: damouse/ws2tcp
  network_mode: host
  command: ws-to-tcp --from 9001 --to 1882
```

## Building and Pushing

Install cross-compiler and copy it over:

```
sudo apt-get install qemu-user-static
cp /usr/bin/qemu-arm-static qemu-arm-static 
```

Build the container, but change the commented line for switch out archs between builds.

```
docker build . -t damouse/ws2tcp:armhf
docker push damouse/ws2tcp:armhf

docker build . -t damouse/ws2tcp:amd64
docker push damouse/ws2tcp:amd64
```

Creating the manifest for multi-arch files the first time: 

```
docker manifest create damouse/ws2tcp:latest damouse/ws2tcp:armhf damouse/ws2tcp:amd64 

docker manifest annotate damouse/ws2tcp:latest damouse/ws2tcp:armhf --os linux --arch arm

docker manifest annotate damouse/ws2tcp:latest damouse/ws2tcp:amd64 --os linux --arch amd64

docker manifest push damouse/ws2tcp:latest
```
