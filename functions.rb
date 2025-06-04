class FunctionImpl
  def initialize(name)
    @name = name
  end

  def evaluate_call(args)
    throw "#{self.class.name}.evaluate_call() is not implemented!"
  end
end

class FunctionDef < FunctionImpl

  def initialize(name, arg_names, body)
    @name = name
    @arg_names = arg_names
    @body = body
  end

  def evaluate_call()
    @body.evaluate()
  end

end

class FunctionMax < FunctionImpl
  def initialize()
    super('max')
  end

  def evaluate_call(args)
    unparse_args(args).max()
  end
end

class FunctionMin < FunctionImpl
  def initialize()
    super('min')
  end

  def evaluate_call(args)
    unparse_args(args).min()
  end
end

class FunctionAbs < FunctionImpl
  def initialize()
    super('abs')
  end

  def evaluate_call(arg)
    value = arg[0].evaluate()
    if value < 0
      value *= -1
    end
    value
  end
end

class FunctionPow < FunctionImpl

  def initialize()
    super('pow')
  end

  def evaluate_call(args)
    base_value = args[0].evaluate()
    exp_value = args[1].evaluate()
    base_value**exp_value
  end

end

class FunctionPi < FunctionImpl
  
  def initialize()
    super('pi')
  end

  def evaluate_call
    Math::PI
  end

end

class FunctionRandom < FunctionImpl

  def initialize()
    super('random')
  end

  def evaluate_call
    Random.rand
  end

end

class FunctionPrint < FunctionImpl
  
  def initialize()
    super('print')
  end
  
  def evaluate_call(args)
    puts(unparse_args(args))
  end

end

def initialize_functions(state)
  state["max"] = FunctionMax.new
  state["abs"] = FunctionAbs.new
  state["min"] = FunctionMin.new
  state["pow"] = FunctionPow.new
  state["pi"] = FunctionPi.new
  state["random"] = FunctionRandom.new
  state["print"] = FunctionPrint.new
end

def unparse_args(args)
  unparsed_args = []
  for arg in args do
    unparsed_args.push(arg.evaluate())
  end
  unparsed_args
end
