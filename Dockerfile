ARG ALPINE_VERSION
FROM johannweging/base-alpine:$ALPINE_VERSION

ARG MONGODB_VERSION_ASSERT

RUN set -x \
&& apk add --no-cache --update "mongodb$MONGODB_VERSION_ASSERT"

ADD rootfs /

RUN set -x \
&& chmod +x /run.sh

EXPOSE 27017
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/run.sh"]
