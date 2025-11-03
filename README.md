# COBOL Interpreter in Ruby

**🚧 Work In Progress (WIP) 🚧**

A minimal COBOL script interpreter built with Ruby using Test-Driven Development (TDD).

## Components

- **Lexer**: Tokenizes COBOL source code
- **Parser**: Builds Abstract Syntax Tree (AST) from tokens  
- **AST**: Node classes representing program structure
- **Interpreter**: Executes the AST

## Supported Features

- IDENTIFICATION DIVISION
- PROGRAM-ID declaration
- PROCEDURE DIVISION
- DISPLAY statements with string literals

## Usage

```bash
# Run a COBOL program
./bin/cobol examples/hello.cob

# Run tests
bundle exec rspec
```

## Example COBOL Program

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO.
PROCEDURE DIVISION.
DISPLAY "HELLO WORLD".
```

## Architecture

1. **Lexer** (`lib/lexer.rb`) - Converts source code into tokens
2. **Parser** (`lib/parser.rb`) - Builds AST from tokens
3. **AST** (`lib/ast.rb`) - Node classes for program structure
4. **Interpreter** (`lib/interpreter.rb`) - Executes the AST
5. **CobolInterpreter** (`lib/cobol_interpreter.rb`) - Main orchestrator

All components are built using TDD with comprehensive test coverage.
