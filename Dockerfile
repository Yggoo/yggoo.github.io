FROM alpine:3.13

ARG BUILD_DATE=""
ARG VCS_REF="latest"
ARG VERSION="latest"

LABEL maintainer="https://github.com/Yggoo/yggoo.github.io" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="Yggoo" \
      org.label-schema.name="yggoo_build" \
      org.label-schema.license="MIT" \
      org.label-schema.description="This is a dockerized collection of tools needed to build yggoo website" \
      org.label-schema.vcs-url="https://github.com/Yggoo/yggoo.github.io.git" \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.version=${VERSION} \
      org.label-schema.url="https://yggoo.github.io" \
      org.label-schema.usage="https://github.com/Yggoo/yggoo.github.io/blob/master/README.md"

ARG bash_version=5.1.0-r0
ARG nodejs_version=14.15.4-r0
ARG gpp_version=10.2.1_pre1-r3
ARG git_version=2.30.1-r0
ARG npm_version=14.15.4-r0
ARG make_version=4.3-r0
ARG jq_version=1.6-r1
ARG python3_version=3.8.7-r0


RUN apk --update --no-cache add \
    bash=${bash_version} \
    jq=${jq_version} \
    make=${make_version} \
    g++=${gpp_version} \
    git=${git_version} \
    nodejs=${nodejs_version} \
    npm=${npm_version} \
    python3=${python3_version}

RUN npm -g config set user root
RUN npm install -g npm@6.14.11 create-nuxt-app
