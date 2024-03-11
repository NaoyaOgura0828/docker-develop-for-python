# Set the base image
ARG BASE_IMAGE_TAG=${BASE_IMAGE_TAG}
FROM ubuntu:${BASE_IMAGE_TAG}

# Set ARG
ARG TZ=Asia/Tokyo
ARG USER_NAME=${USER_NAME}
ARG PYTHON_VERSION=${PYTHON_VERSION}

# Set TimeZone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Repository Update
RUN apt-get update -y &&\
    apt-get upgrade -y

# Install Packages
RUN apt-get update -y &&\
    apt-get install curl -y &&\
    apt-get install git -y &&\
    apt-get install software-properties-common -y &&\
    apt-get install sudo -y &&\
    apt-get install unzip -y &&\
    apt-get install vim -y &&\
    apt-get install wget -y &&\
    apt-get install zip -y

# Add Repository DeadSnakes PPA
RUN add-apt-repository ppa:deadsnakes/ppa -y

# Install python
RUN apt-get update -y &&\
    apt-get install python${PYTHON_VERSION} -y

# Install pip
RUN wget https://bootstrap.pypa.io/get-pip.py &&\
    python${PYTHON_VERSION} get-pip.py &&\
    rm get-pip.py

# Add User
RUN adduser ${USER_NAME} --force-badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

# Setup WORKDIR
WORKDIR /home/${USER_NAME}

# Change User
USER ${USER_NAME}
