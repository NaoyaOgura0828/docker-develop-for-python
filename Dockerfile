FROM rockylinux:9.1

ARG PYTHON3_8=3.8.10
ARG PYTHON3_9=3.9.13
ARG PYTHON3_10=3.10.9
ARG PYTHON3_11=3.11.1

# Execution user name after container startup
ARG USER_NAME

# Repository Update
RUN dnf update -y

# Install sudo
RUN dnf install sudo -y

# Install git
RUN dnf install git -y

# Install depends on Python
RUN dnf install gcc -y
RUN dnf install openssl-devel -y
RUN dnf install bzip2-devel -y
RUN dnf install libffi-devel -y
RUN dnf install zlib-devel -y
RUN dnf install tar -y
RUN dnf install wget -y
RUN dnf install make -y
RUN dnf install xz -y

# Install pip
RUN dnf install pip -y

# Install Python3.8
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/${PYTHON3_8}/Python-${PYTHON3_8}.tar.xz &&\
    tar -xf Python-${PYTHON3_8}.tar.xz -C /opt/
RUN cd /opt/Python-${PYTHON3_8} && \
    ./configure --enable-optimizations && \
    make && \
    make altinstall

# Install Python3.9
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/${PYTHON3_9}/Python-${PYTHON3_9}.tar.xz &&\
    tar -xf Python-${PYTHON3_9}.tar.xz -C /opt/
RUN cd /opt/Python-${PYTHON3_9} && \
    ./configure --enable-optimizations && \
    make && \
    make altinstall

# Install Python3.10
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/${PYTHON3_10}/Python-${PYTHON3_10}.tar.xz &&\
    tar -xf Python-${PYTHON3_10}.tar.xz -C /opt/
RUN cd /opt/Python-${PYTHON3_10} && \
    ./configure --enable-optimizations && \
    make && \
    make altinstall

# Install Python3.11
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/${PYTHON3_11}/Python-${PYTHON3_11}.tar.xz &&\
    tar -xf Python-${PYTHON3_11}.tar.xz -C /opt/
RUN cd /opt/Python-${PYTHON3_11} && \
    ./configure --enable-optimizations && \
    make && \
    make altinstall

# Add User
RUN adduser ${USER_NAME} --badnames

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" | tee /etc/sudoers

ENTRYPOINT tail -f /dev/null