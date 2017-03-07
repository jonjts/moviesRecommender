/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.Mood;
import com.j256.ormlite.support.ConnectionSource;
import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class MoodPersistence extends GenericPersistence<Mood, Integer> {

    public MoodPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), Mood.class);
    }

    public MoodPersistence(ConnectionSource connectionSource) throws SQLException {
        super(connectionSource, Mood.class);
    }

}
