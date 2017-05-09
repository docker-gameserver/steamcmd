############################################################
# Dockerfile
############################################################

# Based on Debian
FROM centos:latest

############################################################
# Environment Configuration
############################################################



############################################################
# Installation
############################################################

# Setup
RUN echo "Installing Packages ..." &&\
	# Install
	yum update -y &&\
	yum install -y curl &&\
	# Download and extract SteamCMD
	mkdir -p /opt/steamcmd &&\
	yum install -y glibc.i686 libstdc++.i686 &&\
	cd /opt/steamcmd &&\
	curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

# Update SteamCMD
RUN timeout 30s /opt/steamcmd/steamcmd.sh; exit 0

############################################################
# Execution
############################################################

# Working Directory
WORKDIR /opt/steamcmd

# Entrypoint
CMD ["./steamcmd.sh"]
