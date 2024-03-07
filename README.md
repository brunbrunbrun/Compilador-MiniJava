# Compilador-MiniJava 🤏☕

## Especificação Léxica

- Espaços em branco:
    `[\n \t \r \f]`

- Identificadores:
    Uma letra `[a-zA-Z]+`, seguido de zero ou mais letras `[0-9a-zA-Z]*`, dígitos ou `_`

- Numerais:
    Apenas números inteiros `[0-9]`

- Operadores:
    `=`
    `<`
    `==`
    `!=`
    `+`
    `-`
    `*`
    `&&`
    `!`

- Pontuação:
    `(`
    `)`
    `[`
    `]`
    `{`
    `}`
    `;`
    `.`
    `,`

- Palavras reservadas:
    `boolean` `class` `extends` `public` `static` `void` `main` `String` `return` `int` `if` `else` `while` `length` `true` `false` `this` `new` `null` `System.out.println`

  ## Gramatica
    ```EBNF
    PROG 	= MAIN CLASSE
    MAIN 	= 'class' 'id' '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']' 'id' ')' '{' CMD '}' '}'
    CLASSE 	= 'class' 'id' '[' 'extends' 'id' ']' '{' VAR METODO '}'
    VAR 	= TIPO 'id' ';'
    METODO 	= 'public' TIPO 'id' '(' PARAMS ')' '{' VAR CMD 'return' REXP ';' '}'
    PARAMS 	= TIPO 'id'
    TIPO 	= 'boolean'
		| 'int'
    CMD 	= 'if' '(' REXP ')' CMD
		| 'while' '(' REXP ')' CMD
		| 'System.out.println' '(' REXP ')' ';'
		| 'id' '=' REXP ';'
    REXP 	= 'num' '<' 'num'
    ```
