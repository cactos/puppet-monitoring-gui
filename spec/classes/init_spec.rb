require 'spec_helper'
describe 'cactos_monitoring_gui' do
  context 'with default values for all parameters' do
    it { should contain_class('cactos_monitoring_gui') }
  end
end
