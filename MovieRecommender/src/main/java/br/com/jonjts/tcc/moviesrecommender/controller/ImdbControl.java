/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.ImdbMovie;
import br.com.jonjts.tcc.moviesrecommender.model.Movie;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.io.IOException;
import java.text.DecimalFormat;

/**
 * @author jon_j
 */
public class ImdbControl {

    private String address = "http://www.omdbapi.com/?";

    public ImdbMovie getPoster(Movie movie) {
        ImdbMovie imdbMovie = new ImdbMovie();
        // address += "t=" + fixTitle(getTitle(movie.getTitle()));
        //address += "&type=movie";
        DecimalFormat decimalFormat = new DecimalFormat("0000000");
        int i = Integer.parseInt(movie.getImdbId());
        address += "&plot=full";
        address += "&r=json";
        address += "&i=tt" + decimalFormat.format(i);

        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpGet get = new HttpGet(address);
            get.setHeader("Accept", "application/json;charset=UTF-8");
            get.setHeader("Content-type", "application/json;charset=UTF-8");
            HttpResponse response = httpClient.execute(get);
            JSONObject jSONObject = new JSONObject(EntityUtils.toString(response.getEntity()));
            if (jSONObject.has("Poster")) {
                String poster = jSONObject.getString("Poster");
                if (!poster.equals("N/A")) {
                    imdbMovie.setPoster(poster);
                }
            }
            if (jSONObject.has("Plot")) {
                String plot = jSONObject.getString("Plot");
                imdbMovie.setPlot(plot);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return imdbMovie;
    }

    private String getTitle(String title) {
        final String substring = title.substring(0, title.length() - 6).replace(" ", "+");
        return substring;
    }

    private String fixTitle(String title) {
        if (title.contains(",")) {
            String fixed = null;
            int lastIndexOf = title.lastIndexOf(",");
            String inicio = title.substring(0, lastIndexOf);
            String fim = title.substring(lastIndexOf + 1, title.length());
            fixed = fim + inicio;
            return fixed;
        } else {
            return title;
        }
    }

}
