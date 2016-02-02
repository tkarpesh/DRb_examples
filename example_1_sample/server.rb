require 'drb'

front = []
DRb.start_service('druby://localhost:1234', front)
front << 'first'

# DRb.thread.join
# my_obj.extend DRbUndumped
# def front.[](ind)
#   DRbObject.new(super)
# end
