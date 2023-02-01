ARG flutter_version=stable
FROM cirrusci/flutter:${flutter_version}

USER root

WORKDIR /home/cirrus

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
