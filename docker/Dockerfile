FROM centos:6

# install dependency
RUN yum install -y git tar make gcc zlib zlib-devel openssl-devel sqlite-devel \
gcc-c++ glibc-headers libyaml-devel readline readline-devel zlib-devel libffi-devel \
epel-release && yum update -y

# install ruby(rbenv)
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN cd ~/.rbenv && src/configure && make -C src
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
source ~/.bash_profile
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN ~/.rbenv/bin/rbenv install 2.3.1 && ~/.rbenv/bin/rbenv global 2.3.1

# install serverspec and docker-api
RUN ~/.rbenv/shims/gem install serverspec && ~/.rbenv/shims/gem install docker-api

# install ansible
RUN yum install -y ansible
