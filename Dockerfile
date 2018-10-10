FROM ubuntu:18.04
MAINTAINER camel

# OS configs
ENV USER root
RUN touch /etc/apt/apt.conf.d/99force-ipv4 && \
    echo "Acquire::ForceIPv4 \"true\";" >>  /etc/apt/apt.conf.d/99force-ipv4

# Common tools
RUN apt-get update
RUN apt-get install -y sudo software-properties-common curl wget git zip unzip vim build-essential 

# C
RUN apt-get install -y valgrind

# Python3
RUN apt-get install -y python3 python3-pip 
RUN pip3 install requests beautifulsoup4 matplotlib

WORKDIR /proj
VOLUME /proj

CMD ["/bin/bash"]
