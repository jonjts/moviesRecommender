/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.*;
import br.com.jonjts.tcc.moviesrecommender.persistence.FeedbackPersistence;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author jon_j
 */
public class FeedbackControl extends Control<Feedback, FeedbackPersistence> {

    @Override
    public FeedbackPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null &&
                !persistence.getConnectionSource().isOpen(Feedback.TABLE_NAME))) {
            persistence = new FeedbackPersistence();
        }
        return persistence;
    }

    public void insert(List<Feedback> feedbacks, List<GenericMood> moods) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            FeedbackMoodControl feedbackMoodControl = new FeedbackMoodControl();
            for (Feedback feed : feedbacks) {
                Feedback insert = insert(feed);
                for (GenericMood m : moods) {
                    FeedbackMoods feedbackMoods = new FeedbackMoods();
                    feedbackMoods.setFeedback(insert);
                    feedbackMoods.setGenericMood(m);
                    feedbackMoodControl.insert(feedbackMoods);
                }
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public List<Integer> consultFeedbecados(User user) {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            List<Feedback> feedbackList = persistence.queryBuilder().where().eq("user_id", user).query();
            List<Integer> movies = new ArrayList<Integer>();
            for (Feedback f : feedbackList) {
                movies.add(f.getMovie().getId());
            }
            return movies;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
