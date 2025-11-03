require_relative '../lib/interpreter'
require_relative '../lib/parser'
require_relative '../lib/lexer'

RSpec.describe Interpreter do
  describe '#execute' do
    it 'executes a DISPLAY statement' do
      input = <<~COBOL
        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO.
        PROCEDURE DIVISION.
        DISPLAY "HELLO WORLD".
      COBOL

      lexer = Lexer.new(input)
      tokens = lexer.tokenize
      parser = Parser.new(tokens)
      ast = parser.parse
      interpreter = Interpreter.new

      expect { interpreter.execute(ast) }.to output("HELLO WORLD\n").to_stdout
    end
  end
end
