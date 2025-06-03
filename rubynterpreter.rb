require_relative 'expressions'
require_relative 'statements'
require_relative 'parser'
require_relative 'functions'

puts "Welcome to Rubynterpreter."
puts "Finish your code with an empty line to process it."
puts ""
parser = Parser.new
input = []
state = { }
initialize_functions(state)
ARGF.each do |line|
  if (line.strip().empty?)
    code = input.join('\n')
    if (code.strip().empty?)
      puts "Exit"
      break
    else
      begin
        ast = parser.parse_string(code)
        # puts ast.inspect
        puts "#{ast.unparse()} = #{ast.evaluate(state)}"
      rescue => error
        STDERR.puts "#{error.class}: #{error.message}"
      ensure
        input = []
      end
    end
  else
    input << line
  end
end
