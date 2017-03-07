/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.Movie;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class MoviePersistence extends GenericPersistence<Movie, Integer> {

    public MoviePersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), Movie.class);
    }

    public MoviePersistence(ConnectionSource connectionSource) throws SQLException {
        super(connectionSource, Movie.class);
    }

}
