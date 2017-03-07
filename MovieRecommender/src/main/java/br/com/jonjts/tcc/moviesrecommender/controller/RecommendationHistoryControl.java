package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.Movie;
import br.com.jonjts.tcc.moviesrecommender.model.RecommendationHistory;
import br.com.jonjts.tcc.moviesrecommender.model.User;
import br.com.jonjts.tcc.moviesrecommender.persistence.RecommendationHistoryPersistence;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author Jonas [@jonjts] [05/11/2016].
 */
public class RecommendationHistoryControl extends Control<RecommendationHistory, RecommendationHistoryPersistence> {
    @Override
    public RecommendationHistoryPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null &&
                persistence.getConnectionSource().isOpen(RecommendationHistory.TABLE_NAME))) {
            persistence = new RecommendationHistoryPersistence();
        }
        return persistence;
    }

    public List<RecommendationHistory> lastRecommendation(User user) {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            List<RecommendationHistory> query = persistence.queryBuilder().
                    orderBy("time", false).limit(10l).where().eq("user_id", user).query();
            return query;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<RecommendationHistory>();
    }

    public void insert(List<Movie> movies, User user) {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            for(Movie m : movies){
                RecommendationHistory recommendationHistory =  new RecommendationHistory(null, user, m);
                persistence.create(recommendationHistory);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
