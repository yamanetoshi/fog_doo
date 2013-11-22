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


#@compute.list_virtual_machines["listvirtualmachinesresponse"]["virtualmachine"].map {|item| print item["id"], " ", item["displayname"], " ", item["state"], "\n" }

@compute.list_virtual_machines["listvirtualmachinesresponse"]["virtualmachine"].map {|item| 
  if /^devopsOkinawa/ =~ item["displayname"]
    print item["id"], " ", item["displayname"], " ", item["state"], "\n" 
  end
}

