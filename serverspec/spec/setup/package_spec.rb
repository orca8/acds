require 'spec_helper'

describe 'Setup' do
  def os_version
    command('cat /etc/redhat-release').stdout
  end

  it 'install check CentOS' do
    expect(os_version).to match(/CentOS.+7\.\d/)
  end

  it 'install check httpd' do
    expect(package('httpd')).to be_installed
  end

  it 'install check epel-release' do
    expect(package('epel-release')).to be_installed
  end
end
