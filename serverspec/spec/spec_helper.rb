require 'serverspec'
require 'docker'

set :backend, :docker
set :docker_url, ENV['DOCKER_HOST']

# sslを無効
Excon.defaults[:ssl_verify_peer] = false
