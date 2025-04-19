FROM amd64/gcc

COPY spec /opt/spec

WORKDIR /opt/spec

RUN yes | ./install.sh

RUN cp config/gcc-linux-x86.cfg config/myconfig.cfg

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]