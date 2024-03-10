## O11 OTT

### Notes:

Beta is a old build, please use latest or nightly, nightly is the most stable release.

O11 is a software with webui that allow you to get working with L3 and other CDM systems.

This software only works on x64_86 architecture.

```
docker run \
  --name o11 \
  --restart always \
  --detach \
  --publish 1234:1234 \
  --volume /mnt/o11-ott:/mnt \
  cyberpoison/o11-ott-streamer:latest 
```
go to `http://Machine_IP:1234`

The startup_script that run on the machine automatically is :
```
#!/bin/bash

# Touch the file if it doesn't exist
if [ ! -f "/mnt/o11.cfg" ]; then
    touch /mnt/o11.cfg
fi

# Install dependencies if requirements.txt exists
if [ -f "/mnt/scripts/requirements.txt" ]; then
    /usr/bin/pip install -r /mnt/scripts/requirements.txt
fi

# Create symlink if o11.cfg exists and /home/o11.cfg if doesn't exist
if [ -f "/mnt/o11.cfg" ] && [ ! -e "/home/o11.cfg" ]; then
    ln -s /mnt/o11.cfg /home/o11.cfg
fi

# Run software
/home/$(Software) --path /mnt/ -noramfs
```
