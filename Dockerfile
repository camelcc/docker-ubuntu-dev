FROM ubuntu:18.04
MAINTAINER camel

# OS configs
ENV USER root
RUN touch /etc/apt/apt.conf.d/99force-ipv4 && \
    echo "Acquire::ForceIPv4 \"true\";" >>  /etc/apt/apt.conf.d/99force-ipv4

# Common tools
RUN apt-get update
RUN apt-get install -y sudo software-properties-common curl wget git zip unzip vim build-essential net-tools xvfb libxi6 libgconf-2-4

# C
RUN apt-get install -y valgrind

# Java
RUN apt-get install -y default-jdk

# Python3
RUN apt-get install -y python3 python3-pip 
RUN pip3 install requests beautifulsoup4 matplotlib

# Chrome
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# Chrome Driver
RUN wget https://chromedriver.storage.googleapis.com/75.0.3770.90/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver

RUN pip3 install -U selenium

WORKDIR /proj
VOLUME /proj


CMD ["/bin/bash"]
