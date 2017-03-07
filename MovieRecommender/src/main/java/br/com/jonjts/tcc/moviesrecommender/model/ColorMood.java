/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.model;

import br.com.jonjts.tcc.moviesrecommender.persistence.ColorMoodPersistence;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import java.io.Serializable;

/**
 *
 * @author jon_j
 */
@DatabaseTable(tableName = "colors_moods")
public class ColorMood {

    public static final String TABLE_NAME = "colors_moods";

    @DatabaseField
    private Integer id;

    @DatabaseField(columnName = "color_id", foreign = true)
    private Color color;

    @DatabaseField(columnName = "mood_id", foreign = true)
    private Mood mood;

    public ColorMood() {
        super();
    }

    public ColorMood(Integer id, Color color, Mood mood) {
        this.id = id;
        this.color = color;
        this.mood = mood;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Mood getMood() {
        return mood;
    }

    public void setMood(Mood mood) {
        this.mood = mood;
    }

}
