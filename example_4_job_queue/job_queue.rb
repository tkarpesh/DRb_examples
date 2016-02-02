require 'drb'
require 'singleton'

class JobQueue
  include Singleton

  def initialize
    @jobs = []
  end

  def push(job)
    @jobs << job
  end

  def work
    loop do
      job = @jobs.pop

      puts "job: #{job}" if job
    end
  end
end

t = Thread.new do
  JobQueue.instanсe.work
end

DRb.start_service('druby://localhost:1234', JobQueue.instance)
DRb.thread.join
