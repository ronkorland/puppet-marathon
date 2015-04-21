require 'spec_helper'

describe 'marathon::config' do

  let(:owner) { 'root' }
  let(:group) { 'root' }
  let(:marathon) { '/etc/marathon' }
  let(:conf) { '/etc/marathon/conf' }

  let(:params){{
    :marathon_dir => marathon,
    :conf_dir => conf,
    :mesos_role => 'marathon',
    :event_subscriber => 'http_callback',
    :http_endpoints => 'http://localhost:8085/events',
    :task_launch_timeout => '300000',
    :owner    => owner,
    :group    => group,
  }}

    it { should contain_file(
      "#{conf}/mesos_role"
    ).with_content(/^marathon$/)}

    it { should contain_file(
      "#{conf}/event_subscriber"
    ).with_content(/^http_callback$/)}

    it { should contain_file(
      "#{conf}/http_endpoints"
    ).with_content(/^http:\/\/localhost:8085\/events$/)}

    it { should contain_file(
      "#{conf}/task_launch_timeout"
    ).with_content(/^300000$/)}

  context 'allow changing config directory' do
    let(:my_marathon_dir) { '/tmp/marathon' }
    let(:my_conf_dir) { '/tmp/marathon/conf' }
    let(:params){{
      :marathon_dir => my_marathon_dir,
      :conf_dir => my_conf_dir,
      :mesos_role => 'marathon',
    }}

    it 'contains mesos_role file in config directory' do
      should contain_file(
        "#{my_conf_dir}/mesos_role"
      ).with_content(/^marathon$/)
    end
  end

end
