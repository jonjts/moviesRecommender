/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.FeedbackMoods;
import com.j256.ormlite.support.ConnectionSource;
import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class FeedbackMoodPersistence extends GenericPersistence<FeedbackMoods, Integer> {

    public FeedbackMoodPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), FeedbackMoods.class);
    }

    public FeedbackMoodPersistence(ConnectionSource connectionSource) throws SQLException {
        super(connectionSource, FeedbackMoods.class);
    }

}
