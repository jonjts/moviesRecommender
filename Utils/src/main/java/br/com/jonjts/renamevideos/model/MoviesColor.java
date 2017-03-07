/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.renamevideos.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import java.awt.Color;
import java.io.Serializable;

/**
 *
 * @author jon_j
 */
@DatabaseTable(tableName = "movies_colors")
public class MoviesColor implements Serializable {

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField(columnName = "movie_id", foreign = true,foreignAutoRefresh = true)
    private Movie movieId;

    @DatabaseField
    private Integer r;

    @DatabaseField
    private Integer g;

    @DatabaseField
    private Integer b;

    @DatabaseField
    private Integer frequency;

    public MoviesColor() {
        super();
    }

    public MoviesColor(Integer id, Movie movieId, Integer r, Integer g, Integer b,
            Integer frequency) {
        this.id = id;
        this.movieId = movieId;
        this.r = r;
        this.g = g;
        this.b = b;
        this.frequency = frequency;
    }
    
    public MoviesColor(Movie movieId, Color rgb, Integer frequency) {
        this.movieId = movieId;
        this.r = rgb.getRed();
        this.g = rgb.getGreen();
        this.b = rgb.getBlue();
        this.frequency = frequency;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Movie getMovieId() {
        return movieId;
    }

    public void setMovieId(Movie movieId) {
        this.movieId = movieId;
    }

    public Integer getR() {
        return r;
    }

    public void setR(Integer r) {
        this.r = r;
    }

    public Integer getG() {
        return g;
    }

    public void setG(Integer g) {
        this.g = g;
    }

    public Integer getB() {
        return b;
    }

    public void setB(Integer b) {
        this.b = b;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    
}
