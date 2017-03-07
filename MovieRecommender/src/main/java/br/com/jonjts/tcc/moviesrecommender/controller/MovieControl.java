package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.Movie;
import br.com.jonjts.tcc.moviesrecommender.persistence.MoviePersistence;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;
import java.util.List;

/**
 * Author Jonas [@jonjts] [05/11/2016].
 */
public class MovieControl extends Control<Movie, MoviePersistence> {

    @Override
    public MoviePersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null &&
                persistence.getConnectionSource().isOpen(Movie.TABLE_NAME))) {
            persistence = new MoviePersistence();
        }
        return persistence;
    }

}
