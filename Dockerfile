FROM ubuntu

ENV PROJECT varsityathlete

ENV SASS_VERSION 1.32.10

RUN apt-get update && apt-get install -y nginx make curl

RUN cd /tmp && \
    curl \
        --silent \
        --location \
        --request GET \
        https://github.com/sass/dart-sass/releases/download/${SASS_VERSION}/dart-sass-${SASS_VERSION}-linux-x64.tar.gz \
        --output sass.tgz && \
        tar xzvf sass.tgz && \
        mv dart-sass/sass /usr/local/bin/

RUN ln -sf /opt/${PROJECT}/nginx/site.conf /etc/nginx/sites-enabled/default

WORKDIR /opt/${PROJECT}

