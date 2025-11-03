require_relative 'lexer'
require_relative 'parser'
require_relative 'interpreter'

class CobolInterpreter
  def run(source_code)
    lexer = Lexer.new(source_code)
    tokens = lexer.tokenize
    
    parser = Parser.new(tokens)
    ast = parser.parse
    
    interpreter = Interpreter.new
    interpreter.execute(ast)
  end
end
