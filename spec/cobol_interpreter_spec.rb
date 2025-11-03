require_relative '../lib/cobol_interpreter'

RSpec.describe CobolInterpreter do
  describe '#run' do
    it 'runs a complete COBOL program' do
      input = <<~COBOL
        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO.
        PROCEDURE DIVISION.
        DISPLAY "HELLO WORLD".
      COBOL

      interpreter = CobolInterpreter.new
      expect { interpreter.run(input) }.to output("HELLO WORLD\n").to_stdout
    end
  end
end
