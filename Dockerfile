# Base Image
FROM ubuntu:18.04
# The author
LABEL maintainer="Cold_fusion"
WORKDIR /root

#Install depenedencies
RUN apt-get update && apt-get install -y \
    tar \
    git \
    jq \
    wget \
    python \
    python-pip \
    libncurses5-dev
COPY init.sh /usr/bin/
#Install other dependancies using pip
RUN cd ${WORKDIR} \
&& git clone https://github.com/uber/Python-Sample-Application.git \
&& cd Python-Sample-Application \
&& pip install -r requirements.txt \
&& chmod +x /usr/bin/init.sh 
#Export port
EXPOSE 7000
VOLUME [ "/uber" ]
ENTRYPOINT [ "init.sh" ]
