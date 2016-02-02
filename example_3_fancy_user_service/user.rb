class User
  include DRbUndumped

  attr_accessor :user, :email, :created_at

  def initialize(attributes)
    attributes.each { |k, v| send("#{k}=", v) }
  end

  def email
    puts 'asked for email'
    "#{user} <#{@email}>"
  end

  def to_s
    "<User: user:#{@user}, email:#{@email}, created_at:#{@created_at}>"
  end
end
