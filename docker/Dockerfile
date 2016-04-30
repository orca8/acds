FROM centos:6

# install dependency
RUN yum install -y git tar make gcc openssl-devel readline-devel zlib-devel epel-release
RUN yum update -y

# install ruby(rbenv)
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN cd ~/.rbenv && src/configure && make -C src
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
RUN source ~/.bash_profile
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN rbenv install 2.3.1 && rbenv global 2.3.1

# install serverspec and docker-api
RUN gem install serverspec && gem install docker-api

# install ansible
RUN yum install -y ansible
