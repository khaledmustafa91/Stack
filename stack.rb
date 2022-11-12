class Stack

  def initialize
    @stack = []
    @max_stack = []
    @average = 0
    @elements_sum = 0
  end

  def push(element)
    stack.insert(0, element)
    update_max(element)
    update_average(element)
  end

  def pop
    stack[0]
  end

  def get_max
    max_stack[0]
  end

  def get_average
    average
  end

  private

  def update_max(element)
    if max_stack.empty? 
      push_max(element) 
    elsif element > max_stack[0]
      push_max(element)
    else
      push_max(max_stack[0])
    end
  end

  def push_max(element)
    max_stack.insert(0, element)
  end

  def update_average(element)
    @elements_sum = elements_sum + element
    @average = elements_sum.to_f / stack.size
  end

  attr_accessor :stack, :max_stack, :average, :elements_sum
end

stack = Stack.new
stack.push(1) # stack [1], Ave = 1, max [1]
stack.push(2) # stack [2, 1], Ave = 1.5, max [2, 1]
stack.push(5) # stack [5, 2 ,1], Ave = 2.6, max [5, 2, 1]
stack.push(3) # stack [3, 5, 2 ,1], Ave = 2.75, max [5, 5, 2, 1]
stack.push(4) # stack [4, 3, 5, 2 ,1], Ave = 3.0, max [5, 5, 5, 2, 1]

puts stack.pop # 4 
puts stack.get_max # 5
puts stack.get_average # 3.0 