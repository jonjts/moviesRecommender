/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.utils.findvideo;

import br.com.jonjts.renamevideos.model.Movie;
import br.com.jonjts.renamevideos.model.MoviesColor;
import br.com.jonjts.utils.persistence.MovieColorPersistence;
import br.com.jonjts.utils.persistence.MoviePersistence;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * @author Jonas
 */
public class Main {

    private static List<Movie> movies;
    public static String token;

    public static void main(String[] args) {
        readFile();
        //loadMoviesToFindUrl();

        Scanner scanner = new Scanner(System.in);
        System.out.print("Token: ");
        token = scanner.nextLine();

        for (Movie movie : movies) {
            try {
                String[] split = Search.search(movie.getQueryTerm(), token).split(" ; ");
                movie.setYoutubeId(split[0]);
                movie.setYoutubeTitle(split[1]);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        writeUrls();
        writeMoviesJSon();
        writeMoviesTxt();

    }

    private static void writeMoviesJSon() {
        try {
            FileWriter arq = new FileWriter("movies.JSON");
            PrintWriter gravarArq = new PrintWriter(arq);

            gravarArq.print("[");

            for (Movie movie : movies) {
                gravarArq.print("{");
                gravarArq.print("\"id\":" + movie.getId() + ",");
                gravarArq.print("\"title\":\"" + movie.getTitle() + "\",");
                gravarArq.print("\"youtubeId\":\"" + movie.getYoutubeId() + "\",");
                gravarArq.print("\"youtubeTitle\":\"" + movie.getYoutubeTitle() + "\",");
                gravarArq.print("\"queryTerm\":\"" + movie.getQueryTerm() + "\"");
                gravarArq.print("},");
            }
            gravarArq.print("]");
            arq.close();
        } catch (IOException iOException) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", iOException.getMessage());
        }
    }

    private static void writeMoviesTxt() {
        try {
            FileWriter arq = new FileWriter("movies.txt");
            PrintWriter gravarArq = new PrintWriter(arq);

            for (Movie movie : movies) {
                gravarArq.print(movie.getId() + " ; ");
                gravarArq.print(movie.getTitle() + " ; ");
                gravarArq.print(movie.getYoutubeId() + " ; ");
                gravarArq.println(movie.getYoutubeTitle() + " ; ");
            }
            arq.close();
        } catch (IOException iOException) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", iOException.getMessage());
        }
    }

    private static void writeUrls() {
        try {
            FileWriter arq = new FileWriter("urls.txt");
            PrintWriter gravarArq = new PrintWriter(arq);

            for (Movie movie : movies) {
                gravarArq.println("https://www.youtube.com/watch?v=" + movie.getYoutubeId());
            }
            arq.close();
        } catch (IOException iOException) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", iOException.getMessage());
        }
    }

    private static void readFile() {
        String nome = "input.txt";
        try {
            FileReader arq = new FileReader(nome);
            BufferedReader lerArq = new BufferedReader(arq);
            movies = new ArrayList<Movie>();
            String linha = lerArq.readLine();

            while (linha != null) {
                String[] split = linha.split(";");
                Movie movie = new Movie(Integer.parseInt(split[0]), null, null, split[1], split[1] + " trailer");
                movies.add(movie);
                linha = lerArq.readLine();
            }

            arq.close();

        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
        }
    }

}