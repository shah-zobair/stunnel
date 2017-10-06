FROM openshift/rhel7

#RUN echo "yum-master.example.com" > /etc/yum/vars/build_server && \
#    echo "rhel7-latest" > /etc/yum/vars/buildtag && \
#    echo "prod" > /etc/yum/vars/environment && \
#    echo "latest" > /etc/yum/vars/patchlevel

#ADD files/container.repo /etc/yum.repos.d/

RUN yum update -y && \
    yum install -y stunnel net-tools nmap && yum clean all

ADD files/stunnel.service /usr/lib/systemd/system/
ADD files/stunnel.conf /etc/stunnel/

USER 0
EXPOSE 389

ENTRYPOINT /usr/bin/stunnel && /bin/bash
