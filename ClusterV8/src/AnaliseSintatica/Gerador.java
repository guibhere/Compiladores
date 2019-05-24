package AnaliseSintatica;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import AnaliseLexica.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Felipe
 */
public class Gerador {

    //Essa classe foi comentada pois ja foi gerada a classe lexer
    /**
     * @param args the command line arguments
     */
    public static void gerarLexer(String path) {
        File file = new File(path);
        JFlex.Main.generate(file);

    }

    public static void main(String[] args) {
        // TODO code application logic here
        String path = "C:\\Users\\12161003841\\Desktop\\Compiladores\\ClusterV8\\src\\AnaliseSintatica\\Lexer.flex";
        gerarLexer(path);

       

    }
}
