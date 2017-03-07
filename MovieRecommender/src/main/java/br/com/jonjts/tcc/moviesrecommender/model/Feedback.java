/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.model;

import com.j256.ormlite.dao.ForeignCollection;
import com.j256.ormlite.field.DataType;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.field.ForeignCollectionField;
import com.j256.ormlite.table.DatabaseTable;

import java.util.Date;

/**
 * @author jon_j
 */
@DatabaseTable(tableName = "feedbacks")
public class Feedback {

    public static final String TABLE_NAME = "feedbacks";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField(columnName = "movie_id", foreign = true)
    private Movie movie;

    @DatabaseField(columnName = "user_id", foreign = true)
    private User user;

    @DatabaseField(columnName = "rating")
    private Integer rating;

    @DatabaseField(dataType = DataType.DATE, format = "dd/MM/yyyy HH:mm")
    private Date time;

    @ForeignCollectionField(eager = false)
    private ForeignCollection<FeedbackMoods> feedbacksMoods;

    public Feedback() {
    }

    public Feedback(Integer id, Movie movie, Date time) {
        this.id = id;
        this.movie = movie;
        this.time = time;
    }

    public Feedback(Integer id, Movie movie, User user, Integer rating, Date time) {
        this.id = id;
        this.movie = movie;
        this.user = user;
        this.rating = rating;
        this.time = time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public ForeignCollection<FeedbackMoods> getFeedbacksMoods() {
        return feedbacksMoods;
    }

    public void setFeedbacksMoods(ForeignCollection<FeedbackMoods> feedbacksMoods) {
        this.feedbacksMoods = feedbacksMoods;
    }

}
