package br.com.jonjts.tcc.moviesrecommender.model;

import com.j256.ormlite.field.DataType;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import java.util.Date;

/**
 * Author Jonas [@jonjts] [05/11/2016].
 */
@DatabaseTable(tableName = "recommendation_history")
public class RecommendationHistory {

    public static final String TABLE_NAME = "recommendation_history";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField(foreign = true, columnName = "user_id")
    private User user;

    @DatabaseField(foreign = true, columnName = "movie_id", foreignAutoRefresh = true)
    private Movie movie;

    @DatabaseField(dataType = DataType.DATE, format = "dd/MM/yyyy HH:mm")
    private Date time;

    public RecommendationHistory() {
    }

    public RecommendationHistory(Integer id) {
        this.id = id;
    }

    public RecommendationHistory(Integer id, User user, Movie movie) {
        this.id = id;
        this.user = user;
        this.movie = movie;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
}
