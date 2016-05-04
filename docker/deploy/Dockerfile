FROM centos:6

# install dependency
RUN yum install -y ntp git tar make gcc zlib zlib-devel openssl-devel sqlite-devel \
                   gcc-c++ glibc-headers libyaml-devel readline readline-devel \
                   zlib-devel libffi-devel epel-release && \
    yum update -y && \
    yum clean all && \
    service ntpd start

# install ruby(rbenv)
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 2.3.1 && rbenv global 2.3.1

# install serverspec
RUN gem install serverspec --no-document

# install ansible
RUN yum install -y ansible && yum clean all

# generating new ssh key
RUN ssh-keygen -q -t rsa -b 4096 -N '' -f /root/.ssh/id_rsa
ADD ssh-config /root/.ssh/config
RUN chown root:root /root/.ssh/config && chmod 0600 /root/.ssh/config
