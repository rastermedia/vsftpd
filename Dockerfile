FROM debian:jessie

RUN apt-get update && apt-get install -y -q vsftpd

ADD vsftpd.conf /etc/
ADD vsftpd.sh /root/

RUN mkdir -p /var/run/vsftpd/empty \
 && chmod +x /root/vsftpd.sh \
 && chown root:root /etc/vsftpd.conf

VOLUME /ftp/


EXPOSE 21/tcp 12000 12001 12002 12003

ENTRYPOINT ["/root/vsftpd.sh"]
CMD ["vsftpd"]
