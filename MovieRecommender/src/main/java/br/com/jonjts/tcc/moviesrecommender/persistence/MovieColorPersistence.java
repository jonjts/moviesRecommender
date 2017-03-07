/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.MovieColor;
import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class MovieColorPersistence extends GenericPersistence<MovieColor, Integer> {

    public MovieColorPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), MovieColor.class);
    }

}
