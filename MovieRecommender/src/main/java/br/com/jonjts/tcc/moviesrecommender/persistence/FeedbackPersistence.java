/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.Feedback;
import com.j256.ormlite.support.ConnectionSource;
import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class FeedbackPersistence extends GenericPersistence<Feedback, Integer> {

    public FeedbackPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), Feedback.class);
    }

    public FeedbackPersistence(ConnectionSource connectionSource) throws SQLException {
        super(connectionSource, Feedback.class);
    }

   

}
