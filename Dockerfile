ARG flutter_version=stable
FROM cirrusci/flutter:${input_flutter_version}

USER root

WORKDIR /home/cirrus

COPY entrypoint.sh /home/cirrus/entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/home/cirrus/entrypoint.sh"]
