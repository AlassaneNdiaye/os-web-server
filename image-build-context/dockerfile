FROM httpd

ENV BOOTSTRAP true

RUN apt-get update; apt-get install -y curl wget xorriso

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

HEALTHCHECK --interval=5s CMD curl http://localhost/ || exit 1
ENTRYPOINT ["/entrypoint.sh"]
