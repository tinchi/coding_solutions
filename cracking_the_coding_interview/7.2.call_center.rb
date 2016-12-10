class Employee
  attr_accessor :current_call

  def receive

  end

  def call_complete

  end

end
class Respondent < Employee

  def handle call
    puts "Start handle call##{call.id}"
    is_free? = false

    escalate(call) if call.resolve == false

    is_free? = true
    # send notification to call center
  end

  def escalate call
    manager.handle(call)
  end
end
def Manager < Employer
  attr_accessor :respondents, :director

  def escalate call
    director.handle(call)
  end

end

def Director < Manager
  attr_accessor :managers

  def escalate call
    # drop call
    # director.handle(call)
  end
# what should director do, if he can't handle the call
end

class Call
  attr_accessor :rank, :caller, :handler

  def resolve
    # blabla
  end
end

class CallCenter
  attr_accessor :respondents, :managers, :director
  attr_accessor :free_respondents
  attr_accessor :call_queue

  def initialize
    @call_queue = []
  end

  def dispatch call
    # push to queue
    @call_queue << call
  end

  def process
    free_respondents.each do |free|
      free.handle @call_queue.shift
    end

  end
end

call_center = CallCenter.new()
call_center.respondents = #...
call_center.managers = #...
call_center.director = #...

calls.each do |call|
  call_center.dispatch(call)
end