# docker-raspbian
This repository provides a docker image which starts a rasbian emulator thanks to qemu

## Build the docker image
 
```
docker build -t docker-raspbian .
```

## Run the docker image

```
docker run --rm --privileged -p 5022:22 -p 5900:5900 -v $(pwd):/img docker-raspbian
```

## Access the running image through vnc

Get a vnc client and connect to localhost:5900

## Access the running image through ssh

First ensure that an ssh server daemon is running in your emulated rasbian instance.
For instance, you can connect through vnc and type:

```
sudo systemctl enable ssh
sudo systemctl start ssh
```

Then ssh into your instance by running:

```
ssh -p5022 pi@locahost
```
