# Use the official Ubuntu 18.04 image as base
FROM ubuntu:18.04

# Set non-interactive mode to avoid prompts during the build
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install any necessary tools
RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        wget \
        ffmpeg \
        gnupg \
        lsb-release \
        tzdata

# Add the deadsnakes PPA for Python 3.10
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update

# Install Python 3.10 and pip for Python 3.10
RUN apt-get install -y \
        python3.10 \
        python3-pip

# Create a symlink for `python3` and `pip3` to point to Python 3.10
RUN ln -s /usr/bin/python3.10 /usr/bin/python3 && \
    ln -s /usr/bin/pip3 /usr/bin/pip

# Create a directory in the container
WORKDIR /home

# Copy files from ott/ to /home in the container
COPY ott/ /home/

# Change permissions of the script
RUN chmod +x /home/o11_v22b1-DRMStuff
RUN chmod +x /home/startup_script.sh

# Define the default command to run when the container starts
CMD ["/home/startup_script.sh"]
