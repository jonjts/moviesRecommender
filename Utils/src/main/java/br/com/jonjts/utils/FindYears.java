package br.com.jonjts.utils;

import br.com.jonjts.renamevideos.model.*;
import br.com.jonjts.renamevideos.model.Movie;
import br.com.jonjts.utils.persistence.MoviePersistence;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.ronsmits.omdbapi.Omdb;
import org.ronsmits.omdbapi.OmdbConnectionErrorException;
import org.ronsmits.omdbapi.OmdbMovieNotFoundException;
import org.ronsmits.omdbapi.OmdbSyntaxErrorException;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

/**
 * Author Jonas [@jonjts] [16/11/2016].
 */
public class FindYears {

    private static String address = "http://www.omdbapi.com/?";

    public static void main(String[] args) {
        MoviePersistence moviePersistence = null;
        try {
            FileWriter arq = new FileWriter("UpdateDadosIMDB.txt");
            PrintWriter gravarArq = new PrintWriter(arq);

            moviePersistence = new MoviePersistence();
            List<br.com.jonjts.renamevideos.model.Movie> movies =
                    moviePersistence.queryBuilder().where().isNull("imdb_rating").query();
            address += "&plot=full";
            address += "&r=json";
            for (Movie m : movies) {
                DecimalFormat decimalFormat = new DecimalFormat("0000000");
                int i = Integer.parseInt(m.getImdbId());
                String id = "&i=tt" + decimalFormat.format(i);

                HttpClient httpClient = HttpClientBuilder.create().build();
                HttpGet get = new HttpGet(address + id);
                get.setHeader("Accept", "application/json;charset=UTF-8");
                get.setHeader("Content-type", "application/json;charset=UTF-8");
                HttpResponse response = httpClient.execute(get);
                try {
                    JSONObject jSONObject = new JSONObject(EntityUtils.toString(response.getEntity()));
                    if (jSONObject.has("imdbRating") && jSONObject.has("Year")) {
                        double imdbRating = jSONObject.getDouble("imdbRating");
                        int year = jSONObject.getInt("Year");
                        m.setYear(year);
                        m.setImdbRating(imdbRating);
                        moviePersistence.update(m);
                        System.out.println(m.getTitle());
                        gravarArq.println("UPDATE movie_lens.movies SET imdb_rating = " + m.getImdbRating() + ", year= "+year+" WHERE id = " + m.getId() + "; ");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            arq.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                moviePersistence.getConnectionSource().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
