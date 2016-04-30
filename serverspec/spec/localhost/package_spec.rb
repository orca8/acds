require 'spec_helper'

describe 'Dockerfile' do
  before(:all) do
    set :os, family: :redhat
    # Dockerfileがあるカレントディレクトリを指定
    image = Docker::Image.build_from_dir('../docker/')
    # docker imageの指定
    set :docker_image, image.id
  end

  def os_version
    command('cat /etc/redhat-release').stdout
  end

  it 'install version CentOS' do
    expect(os_version).match(/CentOS/)
  end

  it 'install check ruby' do
    expect(command('ruby --version').stdout).to_not be nil
  end

  it 'install check serverspec' do
    expect(command('gem list').stdout).to match(/serverspec/)
  end

  it 'install check ansible' do
    expect(command('ansible --version').stdout).to_not be nil
  end
end
