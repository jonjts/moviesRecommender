/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.ColorMood;
import com.j256.ormlite.support.ConnectionSource;
import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class ColorMoodPersistence extends GenericPersistence<ColorMood, Integer> {

    public ColorMoodPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), ColorMood.class);
    }

    public ColorMoodPersistence(ConnectionSource connectionSource) throws SQLException {
        super(connectionSource, ColorMood.class);
    }

   
    

}
