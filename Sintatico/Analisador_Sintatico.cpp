#include <iostream>
#include <vector>
#include <string>
#include <utility>
#include <fstream>


using namespace std;

//Percorre o arquivo .txt gerado pelo Lexer, e transforma
//cada linha em um pair <tipo,lexema>
vector<pair<string, string> > getTokens(const string& filename){
    vector<pair<string, string> > Tokens;
    string line;
    ifstream file(filename);

    if(file.is_open()){
        while(getline(file, line)){
            size_t pos = line.find('|');
            if(pos != string::npos){
                string first = line.substr(0, pos);
                string second = line.substr(pos + 1);

                first.erase(0, first.find_first_not_of(" \t"));
                first.erase(first.find_last_not_of(" \t") + 1);
                second.erase(0, second.find_first_not_of(" \t"));
                second.erase(second.find_last_not_of(" \t") + 1);

                Tokens.emplace_back(first, second);
            }
        }
        file.close();
    } else {
        cerr << "Erro ao abrir o arquivo" << endl;
    }

    return Tokens;
}

vector<pair<string, string> > Tokens;
size_t TokenIndex = 0;

//Prototipos de funções
bool PROG();
bool MAIN();
bool CLASSE();
bool VAR();
bool METODO();
bool PARAMS();
bool TIPO();
bool CMD();
bool REXP();

void reportErro(const string& mensagem){
    cerr << "Erro Sintatico: " << mensagem << " no TokenIndex: " << TokenIndex << endl;
}

bool match(const string& expected){
    if(TokenIndex < Tokens.size() && Tokens[TokenIndex].second == expected){
        TokenIndex++;
        return true;
    }
    reportErro("Esperava \'" + expected +"\' mas encontrou \'" + Tokens[TokenIndex].second + "\'");
    return false;
}

bool match2(const string& expected){
    if(TokenIndex < Tokens.size() && Tokens[TokenIndex].second == expected){
        TokenIndex++;
        return true;
    }
    return false;
}

bool id(){
    if(TokenIndex < Tokens.size() && Tokens[TokenIndex].first == "Identificador"){
        TokenIndex++;
        return true;
    }
    reportErro("Esperava indentificador");
    return false;
}

bool num(){
    if(TokenIndex < Tokens.size() && Tokens[TokenIndex].first == "Numerais"){
        TokenIndex++;
        return true;
    }
    reportErro("Esperava numeral");
    return false;
}

bool PROG(){
    return MAIN() && CLASSE();
}

bool MAIN(){
    return match("class") 
    && id() 
    && match("{") 
    && match("public") 
    && match("static") 
    && match("void") 
    && match("main") 
    && match("(") 
    && match("String") 
    && match("[") 
    && match("]") 
    && id()
    && match(")") 
    && match("{") 
    && CMD()
    && match("}") 
    && match("}");
}

bool CLASSE(){
    return match("class")
    && id()
    && match("[") 
    && match("extends") 
    && id()
    && match("]") 
    && match("{") 
    && VAR()
    && METODO()
    && match("}"); 
}

bool VAR(){
    return TIPO()
    && id()
    && match(";"); 
}

bool METODO(){
    return match("public")
    && TIPO()
    && id()
    && match("(")
    && PARAMS()
    && match(")")
    && match("{")
    && VAR()
    && CMD()
    && match("return")
    && REXP()
    && match(";")
    && match("}");
}

bool PARAMS(){
    return TIPO()
    && id();
}

bool TIPO(){
    if (match2("boolean") || match2("int")){
        return true;
    }
    reportErro("Esperava um tipo (boolean ou int)");
    return false;
}

bool CMD(){
    if(match2("if")){
        return match("(")
        && REXP()
        && match(")")
        && CMD(); 
    } 
    else if(match2("while")){
        return match("(")
        && REXP()
        && match(")")
        && CMD();
    } 
    else if(match2("System.out.println")){
        return match("(")
        && REXP()
        && match(")") 
        && match(";");
    } 
    else if(id()){
        return match("=")
        && REXP()
        && match(";");
    }
    else{
    reportErro("token inesperado");
    return false;
    }

}

bool REXP(){
    return num()
    && match("<")
    && num(); 
}



int main(){
    Tokens = getTokens("../Lexico/output.txt");

    /*
    //teste
    for(auto& t: Tokens){
        cout << "Tipo: " << t.first << ", Lexema: "<< t.second << endl;
    }
    */

    if(PROG() && TokenIndex == Tokens.size()){
        cout << "Codigo Sintaticamente correto!" << endl;
    }
    else{
        cout << "Codigo Sintaticamente INCORRETO!" << endl;
    }
    return 0;

}