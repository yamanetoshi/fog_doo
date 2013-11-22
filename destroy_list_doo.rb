# -*- coding: euc-jp -*-
$:.unshift File.dirname(__FILE__) 

require 'rubygems'
require 'fog'
require 'pp'

require 'access_key'

# create a compute connection
cloudstack_uri = URI.parse(END_POINT)

@compute = Fog::Compute.new(
:provider => 'CloudStack',
:cloudstack_api_key => ACCESS_KEY_ID,
:cloudstack_secret_access_key => SECRET_ACCESS_KEY,
:cloudstack_host => cloudstack_uri.host,
:cloudstack_port => cloudstack_uri.port,
:cloudstack_path => cloudstack_uri.path,
:cloudstack_scheme => cloudstack_uri.scheme,
)

key1="listportforwardingrulesresponse"
key2="portforwardingrule"
key3="virtualmachineid"

while line = gets
  line.chomp!
  ret =  @compute.list_port_forwarding_rules({'ipaddressid' => line})

  @compute.delete_port_forwarding_rule ({
                                          'id' => ret[key1][key2][0]["id"],
                                        })

  @compute.destroy_virtual_machine({
                                     'id' => ret[key1][key2][0][key3],
                                   })
end

