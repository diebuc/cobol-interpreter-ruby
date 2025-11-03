class Lexer
  KEYWORDS = {
    'IDENTIFICATION' => :IDENTIFICATION,
    'DIVISION' => :DIVISION,
    'PROGRAM-ID' => :PROGRAM_ID,
    'PROCEDURE' => :PROCEDURE,
    'DISPLAY' => :DISPLAY
  }.freeze

  def initialize(input)
    @input = input
    @position = 0
  end

  def tokenize
    tokens = []
    while @position < @input.length
      skip_whitespace
      break if @position >= @input.length

      if current_char == '.'
        tokens << { type: :DOT, value: '.' }
        advance
      elsif current_char == '"'
        tokens << tokenize_string
      elsif letter?
        tokens << tokenize_word
      else
        advance
      end
    end
    tokens
  end

  private

  def current_char
    @input[@position]
  end

  def advance
    @position += 1
  end

  def skip_whitespace
    advance while @position < @input.length && current_char.match?(/\s/)
  end

  def letter?
    current_char.match?(/[A-Za-z-]/)
  end

  def tokenize_string
    advance # skip opening quote
    start = @position
    advance while @position < @input.length && current_char != '"'
    value = @input[start...@position]
    advance # skip closing quote
    { type: :STRING, value: value }
  end

  def tokenize_word
    start = @position
    advance while @position < @input.length && current_char.match?(/[A-Za-z0-9-]/)
    value = @input[start...@position]
    type = KEYWORDS[value] || :IDENTIFIER
    { type: type, value: value }
  end
end
