require 'drb'

class UserService
  def authenticate(user)
    puts "attempting to authenticate: #{user}"

    if user == 'tkarpesh'
      {
        user:       user,
        email:     'tatiana.karpesh@gmail.com',
        created_at: Time.now
      }
    else
      puts '!!ACCESS IS DENIED!!'
    end
  end
end

puts 'Starting UserService...'

DRb.start_service('druby://localhost:1234', UserService.new)
DRb.thread.join
