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


@compute.delete_port_forwarding_rule ({
                                        'id' => "127829",
                                      })

p @compute.list_port_forwarding_rules({'ipaddressid' => "2962"})

