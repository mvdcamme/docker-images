FROM python:3.8.0-slim-buster

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
        zip=3.0-11+b1 \
        unzip=6.0-23+deb10u1 \
        bc=1.07.1-2+b1 \
        cowsay=3.03+dfsg2-6 \
        fortune-mod=1:1.99.1-7+b1 \
        figlet=2.2.5-3 \
        toilet=0.3-1.2 \
        ed=1.15-1 \
        imagemagick=8:6.9.10.23+dfsg-2.1 \
        vim=2:8.1.0875-5 \
        tree=1.8.0-1 \
        poppler-utils=0.71.0-5 \
        binutils=2.31.1-16 \
        wget=1.20.1-1.1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    # Judge dependencies
    pip install --upgrade pygments==2.4.2 && \
    chmod 711 /mnt && \
    useradd -m runner && \
    mkdir /home/runner/workdir && \
    chown runner:runner /home/runner/workdir
ENV PATH="/home/runner/workdir:/usr/games:${PATH}"

USER runner
WORKDIR /home/runner/workdir

COPY main.sh /main.sh
