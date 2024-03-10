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

# Run your main command
/home/o11_v22b1-DRMStuff --path /mnt/ -noramfs

