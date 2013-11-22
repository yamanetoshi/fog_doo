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

ctr = 1
while line = gets
  line.chomp!

  ret = @compute.deploy_virtual_machine({
          'displayname' => "devopsOkinawa" << ctr.to_s,
          'serviceOfferingId' => SERVICE_OFFERING_ID,
          'templateId' => TEMPLATE_ID,
          'zoneId' => ZONE_ID,
                                        })
  @compute.create_port_forwarding_rule ({
                                        'ipaddressid' => line,
                                        'privateport' => "22",
                                        'protocol' => "tcp",
                                        'publicport' => "10022",
                                        'virtualmachineid' => ret["deployvirtualmachineresponse"]["id"], 
                                        })

  ctr += 1
end

#@compute.list_virtual_machines["listvirtualmachinesresponse"]["virtualmachine"].map {|item| print item["id"], " ", item["displayname"], " ", item["state"], "\n" }

