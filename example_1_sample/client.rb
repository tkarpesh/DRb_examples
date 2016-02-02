require 'drb'

DRb.start_service
remote_obj = DRbObject.new_with_uri('druby://localhost:1234')
