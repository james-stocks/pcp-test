require 'spec_helper'
describe 'leiningen' do
  context 'with default values for all parameters' do
    it { should contain_class('leiningen') }
  end
end
