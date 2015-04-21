require 'spec_helper'
describe 'marathon' do

  context 'with defaults for all parameters' do
    it { should contain_class('marathon') }
    it { should contain_class('marathon::config') }
    it { should contain_class('marathon::params') }
  end

  it { should compile.with_all_deps }
end
