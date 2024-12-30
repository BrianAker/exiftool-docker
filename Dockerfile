FROM alpine:3.21.0

ENV EXIFTOOL_VERSION=13.10

RUN apk add --no-cache perl make
RUN apk add --update openssl
RUN cd /tmp \
	&& wget https://exiftool.org/Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& tar -zxvf Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& cd Image-ExifTool-${EXIFTOOL_VERSION} \
	&& perl Makefile.PL \
	&& make test \
	&& make install \
	&& cd .. \
	&& rm -rf Image-ExifTool-${EXIFTOOL_VERSION}


VOLUME /tmp

WORKDIR /tmp

ENTRYPOINT ["exiftool"]
