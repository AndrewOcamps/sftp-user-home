FROM atmoz/sftp

COPY files/reconfigure-sftp.sh /
COPY files/add-conf.sh /
RUN chmod +x /reconfigure-sftp.sh && chmod +x /add-conf.sh

RUN sh /add-conf.sh

ENTRYPOINT ["/entrypoint"]

