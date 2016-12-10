class Stack < Array
  attr_accessor :min_e

  def initialize *args
    super
    @min_e = 0
  end

  def push *args
    @min_e = [args.first, min_e].min
    super
  end
  def pop *args
    @min_e = [args.first, min_e].min
    super
  end

  def min
    @min_e.nil? ? 'NO' : @min_e
  end
end

stack = Stack.new(10)

stack.push(1)
stack.push(10)
puts stack.min
stack.push(20)
stack.push(-10)
puts stack.min