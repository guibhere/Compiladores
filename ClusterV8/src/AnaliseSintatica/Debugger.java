/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnaliseSintatica;

import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.Lexer;
import java_cup.runtime.Symbol;


public class Debugger {
    public static void main(String[] args) throws Exception {
parser p = new parser(new Yylex(new StringReader("init ?> inicio do codigo <?"
        + "WHILE(1>2){"
        + "se (#(id1)&&@a>1)||(1!1) {"
        + "se(@a==1){ @a=1}"
        + "interrupt}"
        + "sepa(@a>1)"
        + "{@a=1}"
        + "sepa #(id2){@a=1"
        + "in(@a).}"
        + ""
       
        
        + "}"
        
        + "finit")));

      
      
      
      
      
     
       
        try {
            System.out.println(p.parse());
        } catch (Exception ex) {
            Logger.getLogger(Debugger.class.getName()).log(Level.SEVERE, null, ex);
        }
}
}
