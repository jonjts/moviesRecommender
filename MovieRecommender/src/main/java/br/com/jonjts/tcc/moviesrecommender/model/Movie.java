/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

/**
 * @author jon_j
 */
@DatabaseTable(tableName = "movies")
public class Movie {

    public static final String TABLE_NAME = "movies";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField
    private String title;

    @DatabaseField
    private Integer year;

    @DatabaseField(columnName = "imdb_rating")
    private Double imdbRating;

    @DatabaseField(columnName = "imdb_id")
    private String imdbId;

    @DatabaseField(columnName = "tmdb_id")
    private String tmdbId;

    public Movie() {
    }

    public Movie(Integer id) {
        this.id = id;
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

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Double getImdbRating() {
        return imdbRating;
    }

    public void setImdbRating(Double imdbRating) {
        this.imdbRating = imdbRating;
    }

    @Override
    public boolean equals(Object obj) {
        Movie m = (Movie) obj;
        return m.getId() == id;
    }

}
