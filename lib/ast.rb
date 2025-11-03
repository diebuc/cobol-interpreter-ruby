class ASTNode
end

class ProgramNode < ASTNode
  attr_reader :program_id, :procedure_division

  def initialize(program_id, procedure_division)
    @program_id = program_id
    @procedure_division = procedure_division
  end
end

class ProcedureDivisionNode < ASTNode
  attr_reader :statements

  def initialize(statements)
    @statements = statements
  end
end

class DisplayNode < ASTNode
  attr_reader :value

  def initialize(value)
    @value = value
  end
end
