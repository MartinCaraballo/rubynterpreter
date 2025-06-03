class Statement
  def unparse()
    throw "#{self.class.name}.unparse() is not implemented!"
  end

  def evaluate(state = {})
    throw "#{self.class.name}.evaluate() is not implemented!"
  end
end

class ExprStmt < Statement

  def initialize(expression)
    @expression = expression
  end

  def evaluate(state = {})
    expression.evaluate(state)
    state
  end

  def unparse()
    "#{expression.unparse()};"
  end

  attr_reader :expression
end

class Assignment < Statement 
  def initialize(identifier, expression)
    @identifier = identifier
    @expression = expression
  end
  def unparse()
    "#{identifier} = #{expression.unparse()};"
  end

  def evaluate(state = {})
    state[identifier] = expression.evaluate(state) 
    state
  end

  attr_reader :identifier
  attr_reader :expression
end

class Block < Statement
  def initialize(statements = [])
    @statements = statements
  end

  def unparse()
    aux = ''
    statements.each do |value|
      aux += value.unparse() + ' '
    end
    "{ #{aux} }"
  end

  def evaluate(state = {})
    statements.each do |value| value.evaluate(state) end
    state  
  end

  attr_reader :statements
end

class IfThenElse < Statement
  def initialize(condition, bodyThen, bodyElse = nil)
    @condition = condition
    @bodyThen = bodyThen
    @bodyElse = bodyElse
  end

  def unparse()
    "if #{condition.unparse} #{bodyThen.unparse} else #{bodyElse.unparse}"
  end

  def evaluate(state = {})
    if (condition.evaluate(state))
      bodyThen.evaluate(state)
    else
      bodyElse.evaluate(state)
    end
    state
  end

  attr_reader :condition
  attr_reader :bodyThen
  attr_reader :bodyElse
end

class WhileDo < Statement
  def initialize(condition, body)
    @condition = condition
    @body = body
  end

  def unparse()
    "while #{condition} #{body}"
  end

  def evaluate(state = {})
    while (condition.evaluate(state))
      body.evaluate(state)
    end
    state
  end

  attr_reader :condition
  attr_reader :body
end

# class PrintStmt < Statement
#   def initialize(expression)
#     @expression = expression
#   end
#
#   def unparse()
#     "print (#{expression.unparse});"    
#   end
#
#   def evaluate(state = {})
#     puts (expression.evaluate(state))
#     state
#   end
#
#   attr_reader :expression
# end
