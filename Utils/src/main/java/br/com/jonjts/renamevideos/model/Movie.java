package br.com.jonjts.renamevideos.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.stmt.query.In;
import com.j256.ormlite.table.DatabaseTable;

/**
 * Author Jonas [@jonjts] [25/10/2016].
 */
@DatabaseTable(tableName = "movies")
public class Movie {

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField
    private String title;

    @DatabaseField
    private Integer year;

    @DatabaseField(columnName = "imdb_id")
    private String imdbId;

    @DatabaseField(columnName = "tmdb_id")
    private String tmdbId;

    @DatabaseField(columnName = "imdb_rating")
    private Double imdbRating;


    private Boolean loaded;

    private String youtubeId;
    private String youtubeTitle;
    private String queryTerm;

    public Movie() {
    }

    public Movie(Integer id, String youtubeId, String youtubeTitle, String title, String queryTerm) {
        this.id = id;
        this.youtubeId = youtubeId;
        this.youtubeTitle = youtubeTitle;
        this.title = title;
        this.queryTerm = queryTerm;
    }

    public Movie(Integer movieId) {
        this.id = movieId;
    }


    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getYoutubeId() {
        return youtubeId;
    }

    public void setYoutubeId(String youtubeId) {
        this.youtubeId = youtubeId;
    }

    public String getYoutubeTitle() {
        return youtubeTitle;
    }

    public void setYoutubeTitle(String youtubeTitle) {
        this.youtubeTitle = youtubeTitle;
    }

    public String getQueryTerm() {
        return queryTerm;
    }

    public void setQueryTerm(String queryTerm) {
        this.queryTerm = queryTerm;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Boolean getLoaded() {
        return loaded;
    }

    public void setLoaded(Boolean loaded) {
        this.loaded = loaded;
    }

    public String getImdbId() {
        return imdbId;
    }

    public void setImdbId(String imdbId) {
        this.imdbId = imdbId;
    }

    public String getTmdbId() {
        return tmdbId;
    }

    public void setTmdbId(String tmdbId) {
        this.tmdbId = tmdbId;
    }

    public Double getImdbRating() {
        return imdbRating;
    }

    public void setImdbRating(Double imdbRating) {
        this.imdbRating = imdbRating;
    }
}
