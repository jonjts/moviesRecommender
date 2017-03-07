/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.model;

import br.com.jonjts.tcc.moviesrecommender.persistence.MoodPersistence;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

/**
 * @author jon_j
 */
@DatabaseTable(tableName = "moods", daoClass = MoodPersistence.class)
public class Mood {

    public static final String TABLE_NAME = "MOODS";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField
    private String name;

    @DatabaseField
    private Boolean status;

    public Mood() {
        super();
    }

    public Mood(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Mood(Integer id, String name, Boolean status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}
