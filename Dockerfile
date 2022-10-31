FROM python:3.10.7

RUN apt update -y
RUN apt upgrade -y
RUN apt install sudo -y

RUN adduser NaoyaOgura --force-badname

RUN echo "NaoyaOgura ALL=NOPASSWD: ALL" | tee /etc/sudoers

ENTRYPOINT tail -f /dev/null