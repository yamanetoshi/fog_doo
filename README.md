HOW TO USE
------------------

## install

    $ git clone
	$ cd fog_doo
    $ bundle install

## kickoff resources

    $ bundle exec ruby list_doo_GIP.rb 2>/dev/null | (J\(B
	awk '{print $1;}'|bundle exec ruby deploy_doo.rb

## destroy resources

    $ bundle exec ruby list_doo_GIP.rb | (J\(B
	awk '{print $1;}'|bundle exec ruby destroy_list_doo.rb

## list resources

    $ bundle exec ruby list_doo_vm.rb

	
