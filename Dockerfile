############################################################
# Dockerfile
############################################################

# Based on Debian
FROM centos:latest

############################################################
# Installation
############################################################

# Setup
RUN echo "Installing Packages ..." &&\
	# Install
	yum update -y &&\
	yum install -y curl bash &&\
	# Download and extract SteamCMD
	yum install -y glibc.i686 libstdc++.i686 &&\
	cd /usr/local/bin &&\
	curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz &&\
	ln -s /usr/local/bin/steamcmd.sh /usr/local/bin/steamcmd &&\
	cp /usr/local/bin/linux32/steamclient.so /usr/lib/steamclient.so &&\
	cp /usr/local/bin/linux64/steamclient.so /usr/lib64/steamclient.so &&\
	# Update SteamCMD
	/usr/local/bin/steamcmd +quit

############################################################
# Execution
############################################################

# Entrypoint
CMD ["steamcmd"]
