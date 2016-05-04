FROM centos:7

RUN yum update -y && \
    yum install -y openssh-server openssh-clients perl-core && \
    yum clean all

RUN mkdir -p -m 0700 /root/.ssh

RUN sed -ri 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -ri 's/^#PermitEmptyPasswords no/PermitEmptyPasswords no/' /etc/ssh/sshd_config && \
    sed -ri 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
