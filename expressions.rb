class Expression

  def unparse()
    throw "#{self.class.name}.unparse() is not implemented!"
  end

  def evaluate(state)
    throw "#{self.class.name}.evaluate() is not implemented!"
  end
end

class VariableExp < Expression
  def initialize(identifier)
    @identifier = identifier
  end

  def unparse()
    "#{identifier}"
  end

  def evaluate(state = {})
    state[identifier]
  end

  attr_reader :identifier
end

class FunctionCall < Expression
  def initialize(identifier, args)
    @identifier = identifier
    @args = args
  end

  def unparse()
    "#{identifier}(#{unparse_args(args)})"
  end

  def evaluate(state = {})
    puts(args)
    if args.length() > 0
      state[identifier].evaluate_call(args)
    else
      state[identifier].evaluate_call
    end
  end

  attr_reader :identifier
  attr_reader :args
end

class Numeral < Expression
  def initialize(value)
    @value = Float(value)
  end

  attr_reader :value

  def unparse()
    "#{@value}"
  end

  def evaluate(state = {})
    @value
  end
end

class Negation < Expression
  def initialize(value)
    @value = value
  end

  def unparse()
    "(!#{value.unparse()})"
  end

  def evaluate(state = {})
    not value.evaluate(state)
  end

  attr_reader :value
end

class Addition < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} + #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) + right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class Subtraction < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} - #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) - right.evaluate(state)  
  end

  attr_reader :left
  attr_reader :right
  
end

class Minus < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} - #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) - right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class LogicalOr < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} || #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) || right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class LogicalAnd < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} && #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) && right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class Multiplication < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} * #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) * right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
  
end

class Power < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} ** #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) ** right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class Division < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} / #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) / right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class ComparisonEqual < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end
  
  def unparse()
    "(#{left.unparse()} == #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) == right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class ComparisonDifferent < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} != #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) != right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class ComparisonLessThan < Expression
  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} < #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) < right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class ComparisonGreaterThan < Expression

  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} > #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) > right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class ComparisonGreaterThanOrEqual < Expression

  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} >= #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) >= right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class ComparisonLessThanOrEqual < Expression

  def initialize(left, right)
    @left = left
    @right = right
  end

  def unparse()
    "(#{left.unparse()} <= #{right.unparse()})"
  end

  def evaluate(state = {})
    left.evaluate(state) <= right.evaluate(state)
  end

  attr_reader :left
  attr_reader :right
end

class TruthValue < Expression

  def initialize(value)
    @value = !!(value)
  end

  def self.True
     @@True ||= TruthValue.new(true)
  end

  def self.False  
    @@False ||= TruthValue.new(false)
  end

  attr_reader :value
  def unparse
    "#{@value}"
  end
  
  def evaluate(state = {})
    @value
  end

  def self.get(value)
    value ? TruthValue.True : TruthValue.False
  end
end
