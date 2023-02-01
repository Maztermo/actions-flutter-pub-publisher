ARG flutter_version
FROM cirrusci/flutter:${flutter_version}

USER root

WORKDIR /home/cirrus

COPY entrypoint.sh /home/cirrus/entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/home/cirrus/entrypoint.sh"]
