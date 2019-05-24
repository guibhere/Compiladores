package AnaliseSintatica;

import java_cup.runtime.Symbol;
import AnaliseSintatica.sym;
//import static lexico.Tokens.*;
%%
%class Yylex
%public
%unicode
%cup 
//%full
%column
%line
//%char
//%ignorecase
%eofval{
    return new Symbol(sym.EOF, new String("Fim do Arquivo"));
%eofval}
//%class Lexer
//%type Tokens
WHITE = [ \n|\t|\r|\f]
blank=[ \t\r\n]
/*%{
public String lexeme;
/*public int ContaToken;*/
%}*/

numeros = [0-9]
letras = [a-zA-Z]
all = {letras}|{WHITE}|{numeros}
any =[^]
Comentario   = "?>" [^*] ~"<?" | "?>" "<"+ "?"
String   = "$" [^*] ~"$" | "$" + "$"
%%
{Comentario} {/*Ignore*/}
{WHITE} {/*Ignore*/}


/* Palavras reservadas*/
("se") {return new Symbol (sym.IF, yychar, yyline, yytext());}
("sen") {return new Symbol (sym.ELSE, yychar, yyline, yytext());}
("sepa") {return new Symbol (sym.ELIF, yychar, yyline, yytext());}
("(") {return new Symbol (sym.AP, yychar, yyline, yytext());}
(")") {return new Symbol (sym.FP, yychar, yyline, yytext());}
("[") {return new Symbol (sym.AC, yychar, yyline, yytext());}
("]") {return new Symbol (sym.FC, yychar, yyline, yytext());}
("{") {return new Symbol (sym.ACH, yychar, yyline, yytext());}
("}") {return new Symbol (sym.FCH, yychar, yyline, yytext());}
("=") {return new Symbol (sym.ATR, yychar, yyline, yytext());}
("+") {return new Symbol (sym.OP, yychar, yyline, yytext());}
("-") {return new Symbol (sym.OP, yychar, yyline, yytext());}
("*") {return new Symbol (sym.OP, yychar, yyline, yytext());}
("/") {return new Symbol (sym.OP, yychar, yyline, yytext());}
("^") {return new Symbol (sym.OP, yychar, yyline, yytext());}
("<") {return new Symbol (sym.COMP, yychar, yyline, yytext());}
(">") {return new Symbol (sym.COMP, yychar, yyline, yytext());}
("==") {return new Symbol (sym.COMP, yychar, yyline, yytext());}
("!") {return new Symbol (sym.COMP, yychar, yyline, yytext());}
(">=") {return new Symbol (sym.COMP, yychar, yyline, yytext());}
("<=") {return new Symbol (sym.COMP, yychar, yyline, yytext());}
("&&") {return new Symbol (sym.OPLOG, yychar, yyline, yytext());}
("||") {return new Symbol (sym.OPLOG, yychar, yyline, yytext());}
("WHILE") {return new Symbol (sym.WHILE, yychar, yyline, yytext());}
("in") {return new Symbol (sym.RD, yychar, yyline, yytext());}
("out") {return new Symbol (sym.WR, yychar, yyline, yytext());}
("init") {return new Symbol (sym.BEGIN, yychar, yyline, yytext());}
("finit") {return new Symbol (sym.END, yychar, yyline, yytext());}
("repeat") {return new Symbol (sym.FOR, yychar, yyline, yytext());}
(">>>") {return new Symbol (sym.START, yychar, yyline, yytext());}
("<<<") {return new Symbol (sym.STOP, yychar, yyline, yytext());}
("arq.abrir") {return new Symbol (sym.FILE, yychar, yyline, yytext());}
("arq.fechar") {return new Symbol (sym.FILE, yychar, yyline, yytext());}
("arq.gravar") {return new Symbol (sym.FILE, yychar, yyline, yytext());}
("@"{letras}*{numeros}*) {return new Symbol (sym.VAR, yychar, yyline, yytext());}
({String}) {return new Symbol (sym.STRING, yychar, yyline, yytext());}
({numeros}*) {return new Symbol (sym.NUM, yychar, yyline, new Integer(yytext()));}
("->") {return new Symbol (sym.SEND, yychar, yyline, yytext());}
("<-") {return new Symbol (sym.RECEIVE, yychar, yyline, yytext());}
("#") {return new Symbol (sym.BUSY, yychar, yyline, yytext());}
(",") {return new Symbol (sym.SEPARADOR, yychar, yyline, yytext());}
("id"{numeros}*) {return new Symbol (sym.ID, yychar, yyline, yytext());}
("interrupt") {return new Symbol (sym.BREAK, yychar, yyline, yytext());}

/*({D}({L})+ {lexeme=yytext(); return erro;}*/
. {}