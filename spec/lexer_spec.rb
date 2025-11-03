require_relative '../lib/lexer'

RSpec.describe Lexer do
  describe '#tokenize' do
    it 'tokenizes IDENTIFICATION DIVISION' do
      lexer = Lexer.new('IDENTIFICATION DIVISION.')
      tokens = lexer.tokenize
      
      expect(tokens).to eq([
        { type: :IDENTIFICATION, value: 'IDENTIFICATION' },
        { type: :DIVISION, value: 'DIVISION' },
        { type: :DOT, value: '.' }
      ])
    end

    it 'tokenizes PROGRAM-ID' do
      lexer = Lexer.new('PROGRAM-ID. HELLO.')
      tokens = lexer.tokenize
      
      expect(tokens).to eq([
        { type: :PROGRAM_ID, value: 'PROGRAM-ID' },
        { type: :DOT, value: '.' },
        { type: :IDENTIFIER, value: 'HELLO' },
        { type: :DOT, value: '.' }
      ])
    end

    it 'tokenizes PROCEDURE DIVISION with DISPLAY' do
      lexer = Lexer.new('PROCEDURE DIVISION. DISPLAY "HELLO WORLD".')
      tokens = lexer.tokenize
      
      expect(tokens).to eq([
        { type: :PROCEDURE, value: 'PROCEDURE' },
        { type: :DIVISION, value: 'DIVISION' },
        { type: :DOT, value: '.' },
        { type: :DISPLAY, value: 'DISPLAY' },
        { type: :STRING, value: 'HELLO WORLD' },
        { type: :DOT, value: '.' }
      ])
    end
  end
end
