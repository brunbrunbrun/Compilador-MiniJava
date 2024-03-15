# Compilador-MiniJava 🤏☕
<p align="center">
  <img src="https://github.com/brunbrunbrun/Compilador-MiniJava/assets/92926937/74f5b2d6-0a42-4a3e-8825-394bc3cf3fc6" width="200" alt="Descrição da imagem">
</p>



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

## Analise Sintatica
Foi implementado um analisador sintático descendente recursivo.

# Como usar
- Colocar o codigo dentro do arquivo **input.txt** na raiz do diretorio.
-  rodar o script: 
`./run_Compilador.sh` para Windows.
- rodar o script:
`./run_Compilador_unix.sh` para UNIX.

