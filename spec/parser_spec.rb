require_relative '../lib/parser'
require_relative '../lib/lexer'

RSpec.describe Parser do
  describe '#parse' do
    it 'parses a simple COBOL program' do
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

      expect(ast).to be_a(ProgramNode)
      expect(ast.program_id).to eq('HELLO')
      expect(ast.procedure_division).to be_a(ProcedureDivisionNode)
      expect(ast.procedure_division.statements.length).to eq(1)
      expect(ast.procedure_division.statements.first).to be_a(DisplayNode)
      expect(ast.procedure_division.statements.first.value).to eq('HELLO WORLD')
    end
  end
end
