cd Lexico/
./lexer < ../input_errado.txt
if grep -q "ERRO LEXICO" output.txt; then
    echo "Erro lexico encontrado!"
    grep -n "ERRO LEXICO" output.txt | while read -r line; do
        line_number=$(echo "$line" | cut -d':' -f1)
        conteudo=$(echo "$line" | cut -d':' -f2-)
        echo "Erro encontrado na linha $line_number: $conteudo"
    done
else
    echo "Codigo Lexicamente correto!"
    cd ..
    cd Sintatico/
    ./Sintatico
fi
