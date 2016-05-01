require 'spec_helper'

describe 'Deploy' do
  def os_version
    command('cat /etc/redhat-release').stdout
  end

  it 'install check CentOS' do
    expect(os_version).to match(/CentOS/)
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
