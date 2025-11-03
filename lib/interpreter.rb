require_relative 'ast'

class Interpreter
  def execute(ast)
    case ast
    when ProgramNode
      execute(ast.procedure_division)
    when ProcedureDivisionNode
      ast.statements.each { |stmt| execute(stmt) }
    when DisplayNode
      puts ast.value
    end
  end
end
