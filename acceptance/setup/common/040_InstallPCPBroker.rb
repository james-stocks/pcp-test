require 'pcp_test/config_helper.rb'
extend PcpTestConfigHelper

step 'Copy Puppet module for pcp-broker' do
  on(pcp_broker, puppet('module','install','puppetlabs-stdlib'))
  on(pcp_broker, puppet('module','install','puppetlabs-vcsrepo'))
  on(pcp_broker, puppet('module','install','puppetlabs-hocon'))
  on(pcp_broker, puppet('module','install','maestrodev-wget'))
  copy_module_to(pcp_broker, :source => 'puppet-modules/leiningen', :module_name => 'leiningen')
  copy_module_to(pcp_broker, :source => 'puppet-modules/pcp_broker', :module_name => 'pcp_broker')
end

step 'Install pcp-broker' do
    apply_manifest_on(pcp_broker, <<-MANIFEST)
class { 'pcp_broker':
  run_broker   => false,
  ssl_cert     => '#{PCP_CERTS_TARGET_DIR}/broker.example.com_crt.pem',
  ssl_key      => '#{PCP_CERTS_TARGET_DIR}/broker.example.com_key.pem',
  ssl_ca_cert  => '#{PCP_CERTS_TARGET_DIR}/ca_crt.pem',
  ssl_crl_path => '#{PCP_CERTS_TARGET_DIR}/ca_crl.pem',
}
MANIFEST

  on(pcp_broker, puppet('apply -e "file { \'/var/log/puppetlabs\': ensure => directory, }"'))
end

step 'Run lein deps to download Clojure dependencies' do
  on(pcp_broker, 'cd /opt/puppet-git-repos/pcp-broker; export LEIN_ROOT=ok; lein deps')
end
