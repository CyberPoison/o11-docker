# Use the official Ubuntu 18.04 image as base
FROM ubuntu:18.04

# Update packages and install any necessary tools
RUN apt-get update && \
    apt-get install -y \
    && apt-get install -y wget \
                          ffmpeg \
                          ffprobe

# Create a directory in the container
WORKDIR /home

# Copy files from ott/ to /home in the container
COPY ott/ /home/

# Change permissions of the script
RUN chmod +x /home/o11_v22b1-DRMStuff

# Define the default command to run when the container starts
CMD ["/home/o11_v22b1-DRMStuff"]

