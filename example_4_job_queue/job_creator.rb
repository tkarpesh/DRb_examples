require 'drb'

job_queue = DRbObject.new_with_uri('druby://localhost:1234')

threads = []

5.times do |i|
  threads << Thread.new do
    loop do
      sleep(rand)
      job_queue.push "Thread #{i + 1}: #{Time.now}"
    end
  end
end

threads.map(&:join)
