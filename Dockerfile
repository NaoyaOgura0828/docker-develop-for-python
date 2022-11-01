FROM python:3.10.7

# Execution user name after container startup
ARG USER_NAME=NaoyaOgura

# Repository Update
RUN apt update -y
RUN apt upgrade -y

# sudo Install
RUN apt install sudo -y

# Add User
RUN adduser ${USER_NAME} --force-badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" | tee /etc/sudoers

ENTRYPOINT tail -f /dev/null