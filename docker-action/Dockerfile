ARG flutter_version

FROM cirrusci/flutter:${flutter_version}

USER root

WORKDIR /home/cirrus

COPY docker-action/entrypoint.sh /home/cirrus/entrypoint.sh

RUN chmod +x docker-action/entrypoint.sh

ENTRYPOINT ["/home/cirrus/entrypoint.sh"]
