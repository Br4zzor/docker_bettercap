FROM mini/base:latest
MAINTAINER Br4zzor <br4zzor@protonmail.com>

RUN apk add --update ca-certificates && \
    rm -rf /var/cache/apk/* /tmp/*
RUN apk add --no-cache --update \
    bash=4.3.42-r3 \
    build-base=0.4-r1 \
    musl-dev=1.1.12-r5 \
    ruby=2.2.4-r0 \
    ruby-dev=2.2.4-r0 \
    ruby-irb=2.2.4-r0 \
    ruby-rdoc=2.2.4-r0 \
    libcap-dev=2.24-r1 \
    libpcap-dev=1.7.4-r0 \
    iptables-dev=1.4.21-r4 \
    && rm -rf /var/cache/apk/*
    
RUN gem install bettercap
EXPOSE 80 443 5300 8080 8081 8082 8083 
RUN mkdir /work-session
VOLUME ["/work-session"]
WORKDIR /work-session

ENTRYPOINT ["bettercap"]
CMD ["-h"]
