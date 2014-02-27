GENERAL USAGE
------------------

- This tool supports only CloudStack API
- This tool is used to deploy and destroy virtual resources

HOW TO USE
------------------

## install

    $ git clone
    $ cd fog_doo
    $ bundle install

## make access_key.rb

    $ cp access_key.rb.proto access_key.rb
    $ cat access_key.rb
    ACCESS_KEY_ID=''
    SECRET_ACCESS_KEY=''
    END_POINT=''
    
    SERVICE_OFFERRING_ID=''
    ZONE_ID=''
    TEMPLATE_ID=''
    
    DOO_GIPS=[]
    $

Please edit access_key.rb

- ACCESS_KEY_ID : enter access key of cloudstack api
- SECRET_ACCESS_KEY : enter secret key of cloudstack api
- END_POINT : enter end-point URI
- SERVICE_OFFERING_ID : enter instance size
- ZONE_ID : enter zone id
- TEMPLATE_ID : enter template id
- DOO_GIPS : enter Global IP Address list

## kickoff resources

    $ bundle exec ruby list_doo_GIP.rb 2>/dev/null | awk '{print $1;}'|bundle exec ruby deploy_doo.rb

## destroy resources

    $ bundle exec ruby list_doo_GIP.rb 2>/dev/null | awk '{print $1;}'|bundle exec ruby destroy_list_doo.rb

## list resources

    $ bundle exec ruby list_doo_vm.rb

	
