## O11 OTT

O11 is a software with webui that allow you to get working with L3DRM and other DRM systems.

```
docker run \
  --name o11 \
  --restart always \
  --detach \
  --publish 1234:1234 \
  --volume /mnt/o11-ott:/mnt \
  cyberpoison/o11-ott-streamer:beta \
  /home/o11_v22b1-DRMStuff --path /mnt/ -noramfs
```

In case you want a `startup_script.sh`

Create this script on `/mnt/o11-ott/startup_script.sh`
```
#!/bin/bash

# Install dependencies
/usr/bin/pip install -r /mnt/scripts/requirements.txt

ln -s /mnt/o11.cfg /home/o11.cfg
# Run your main command
/home/o11_v22b1-DRMStuff --path /mnt/ -noramfs
```
