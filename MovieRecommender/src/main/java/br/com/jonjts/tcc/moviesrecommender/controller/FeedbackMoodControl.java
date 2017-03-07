/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.FeedbackMoods;
import br.com.jonjts.tcc.moviesrecommender.persistence.FeedbackMoodPersistence;
import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class FeedbackMoodControl extends Control<FeedbackMoods, FeedbackMoodPersistence> {

    @Override
    public FeedbackMoodPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null && !persistence.getConnectionSource().isOpen(FeedbackMoods.TABLE_NAME))) {
            persistence = new FeedbackMoodPersistence();
        }
        return persistence;
    }

}
