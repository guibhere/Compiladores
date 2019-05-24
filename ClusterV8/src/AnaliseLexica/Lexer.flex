package AnaliseLexica;

import static AnaliseLexica.Token.*;

%%
%class Lexer
%type Token


numeros = [0-9]
letras = [a-zA-Z]
%{
public String lexeme;
%}
WHITE=[ \t\r]
blank=[ \t\r\n]
any =[^]
Comentario   = "?>" [^*] ~"<?" | "?>" "<"+ "?"
String   = "$" [^*] ~"$" | "$" + "$"          
                    
%%
{Comentario} {lexeme = yytext(); return COMENT;}
{WHITE} {return ESPACO;}

/* Palavras reservadas*/
(\n) {lexeme = yytext(); return PLINHA;}
("arq.abrir") {lexeme = yytext(); return FILE;}
("arq.fechar") {lexeme = yytext(); return FILE;}
("arq.graver") {lexeme = yytext(); return FILE;}
("repeat") {lexeme = yytext(); return FOR;}
("se") {lexeme = yytext(); return IF;}
("sepa") {lexeme = yytext(); return ELIF;}
("sen") {lexeme = yytext(); return ELSE;}
("(") {lexeme = yytext(); return AP;}
(")") {lexeme = yytext(); return FP;}
("{") {lexeme = yytext(); return ACH;}
("}") {lexeme = yytext(); return FCH;}
("[") {lexeme = yytext(); return AC;}
("]") {lexeme = yytext(); return FC;}
("=") {lexeme = yytext(); return ATR;}
("+") {lexeme = yytext(); return OP;}
("-") {lexeme = yytext(); return OP;}
("*") {lexeme = yytext(); return OP;}
("/") {lexeme = yytext(); return OP;}
("^") {lexeme = yytext(); return OP;}
("<") {lexeme = yytext(); return COMP;}
(">") {lexeme = yytext(); return COMP;}
("==") {lexeme = yytext(); return COMP;}
("!") {lexeme = yytext(); return COMP;}
(">=") {lexeme = yytext(); return COMP;}
("<=") {lexeme = yytext(); return COMP;}
("&&") {lexeme = yytext(); return OPLOG;}
("||") {lexeme = yytext(); return OPLOG;}
("WHILE") {lexeme = yytext(); return WHILE;}
("in") {lexeme = yytext(); return RD;}
("out") {lexeme = yytext(); return WR;}
("init") {lexeme = yytext(); return BEGIN;}
("finit") {lexeme = yytext(); return END;}
(">>>") {lexeme = yytext(); return START;}
("<<<") {lexeme = yytext(); return STOP;}
("@"{letras}*{numeros}*) {lexeme = yytext(); return VAR;}
("id"{numeros}*) {lexeme = yytext(); return ID;}
(",") {lexeme = yytext(); return SEPARADOR;}
({numeros}*) {lexeme = yytext(); return NUM;}
({String}) {lexeme = yytext(); return STRING;}
("->") {lexeme = yytext(); return SEND;}
("<-") {lexeme = yytext(); return RECEIVE;}
("#") {lexeme = yytext(); return BUSY;}
("interrupt") {lexeme = yytext(); return BREAK;}

. {lexeme = yytext(); return ERRO;}