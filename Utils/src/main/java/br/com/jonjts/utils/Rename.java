/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * @author jon_j
 */
public class Rename {

    private static List<Movie> movies;

    public static void main(String[] args) {
        readFile();
        Scanner scanner = new Scanner(System.in);

        //System.out.println("Informe o diretorio dos filmes como no exemplo (ex. C:\\Users\\jon_j\\Downloads\\Youtube): ");
        String diretorioEntrada = "C:\\Users\\jon_j\\Downloads\\Youtube"; //scanner.nextLine();

        //System.out.println("Informe o diretorio para salvar os filmes como no exemplo (ex. C:\\Users\\jon_j\\Downloads\\tube\\): ");
        String diretorioSaida = "D:\\jonas\\Filmes\\";//scanner.nextLine();

        //fixFileName(diretorioEntrada);

        int count = 1;
        String nao = "";
        File directory = new File(diretorioEntrada);
        String[] list = directory.list();
        for (String s : list) {
            for (Movie m : movies) {
                if (removeSpecialChar(m.getYoutubeTitle()).equalsIgnoreCase(removeSpecialChar(s))) {
                    File fileMovie = new File(directory.getAbsolutePath() + "\\" + s);
                    boolean b = false;
                    for (String sFiles : fileMovie.list()) {
                        if (sFiles.endsWith(".mp4")) {
                            b = true;
                            count++;
                            System.out.println(sFiles);
                            rename(fileMovie.getAbsolutePath() + "\\" + sFiles, diretorioSaida + m.getId() + ".mp4");
                            break;
                        }

                    }
                    if (!b) {
                        nao += m.getYoutubeTitle() + "; ";
                    }

                    break;
                }
            }
        }

    }

    @org.jetbrains.annotations.NotNull
    private static String removeSpecialChar(String txt) {
        String strSemAcentos = Normalizer.normalize(txt, Normalizer.Form.NFD);
        strSemAcentos = strSemAcentos.replaceAll("[^\\p{ASCII}]", "");
        return strSemAcentos.replaceAll(" ", "").replaceAll("'", "").replaceAll("_", "").
                replaceAll("#", "").replaceAll("\"", "").replaceAll(":", "").
                replace("(", "").replace(")", "").replaceAll("$","").trim();
    }

    private static void fixFileName(String diretorioEntrada) {
        File directory = new File(diretorioEntrada);
        String[] list = directory.list();
        for (String s : list) {
            File fileMovie = new File(directory.getAbsolutePath() + "\\" + s);
            for (String sFiles : fileMovie.list()) {
                if (sFiles.endsWith(".mp4")) {
                    System.out.println(sFiles);
                    rename(fileMovie.getAbsolutePath() + "\\" + sFiles, fileMovie.getAbsolutePath() + "\\fix.mp4");
                    break;
                }
            }
        }
    }

    private static void rename(String old, String young) {
        try {
            // Arquivo ou diretório com nome antigo   
            File file = new File(old);
            // Arquivo ou diretório com novo nome  
            File file2 = new File(young);
            if (!file2.exists()) {
                // Renomeando arquivo ou diretório  
                file.renameTo(file2);
                file.delete();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private static void readFile() {
        String nome = "movies.txt";
        try {
            FileReader arq = new FileReader(nome);
            BufferedReader lerArq = new BufferedReader(arq);
            movies = new ArrayList<Movie>();
            String linha = lerArq.readLine();

            while (linha != null) {
                String[] split = linha.split(" ;");
                final long id = Long.parseLong(split[0]);
                String title = split[1];
                String youtubeId = split[2];
                String youtubeTitle = split[3];
                Movie movie = new Movie(id, youtubeId, youtubeTitle, title, null);
                movies.add(movie);
                linha = lerArq.readLine();
            }

            arq.close();

        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
        }
    }

}

class Movie {

    private Long id;
    private String youtubeId;
    private String youtubeTitle;
    private String title;
    private String queryTerm;

    public Movie() {
    }

    public Movie(Long id, String youtubeId, String youtubeTitle, String title, String queryTerm) {
        this.id = id;
        this.youtubeId = youtubeId;
        this.youtubeTitle = youtubeTitle;
        this.title = title;
        this.queryTerm = queryTerm;
    }

    public String getYoutubeTitle() {
        return youtubeTitle;
    }

    public void setYoutubeTitle(String youtubeTitle) {
        this.youtubeTitle = youtubeTitle;
    }

    public String getQueryTerm() {
        return queryTerm;
    }

    public void setQueryTerm(String queryTerm) {
        this.queryTerm = queryTerm;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getYoutubeId() {
        return youtubeId;
    }

    public void setYoutubeId(String youtubeId) {
        this.youtubeId = youtubeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
