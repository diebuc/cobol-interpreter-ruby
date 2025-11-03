require_relative 'ast'

class Parser
  def initialize(tokens)
    @tokens = tokens
    @position = 0
  end

  def parse
    expect(:IDENTIFICATION)
    expect(:DIVISION)
    expect(:DOT)
    
    expect(:PROGRAM_ID)
    expect(:DOT)
    program_id = current_token[:value]
    advance
    expect(:DOT)
    
    expect(:PROCEDURE)
    expect(:DIVISION)
    expect(:DOT)
    
    statements = []
    while @position < @tokens.length
      if current_token[:type] == :DISPLAY
        statements << parse_display
      else
        advance
      end
    end
    
    procedure_division = ProcedureDivisionNode.new(statements)
    ProgramNode.new(program_id, procedure_division)
  end

  private

  def current_token
    @tokens[@position] || { type: :EOF, value: nil }
  end

  def advance
    @position += 1
  end

  def expect(type)
    raise "Expected #{type}, got #{current_token[:type]}" unless current_token[:type] == type
    advance
  end

  def parse_display
    expect(:DISPLAY)
    value = current_token[:value]
    advance
    expect(:DOT)
    DisplayNode.new(value)
  end
end
