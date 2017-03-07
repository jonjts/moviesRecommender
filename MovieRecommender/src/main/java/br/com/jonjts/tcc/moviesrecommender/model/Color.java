/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.model;

import br.com.jonjts.tcc.moviesrecommender.persistence.ColorPersistence;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import java.io.Serializable;

/**
 *
 * @author jon_j
 */
@DatabaseTable(tableName = "colors")
public class Color{
    
    public static final String TABLE_NAME = "colors";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField
    private String name;

    @DatabaseField
    private Integer r;

    @DatabaseField
    private Integer g;

    @DatabaseField
    private Integer b;

    public Color() {
        super();
    }

    public Color(Integer r, Integer g, Integer b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }

    public Color(Integer id, String name, Integer r, Integer g, Integer b) {
        this.id = id;
        this.name = name;
        this.r = r;
        this.g = g;
        this.b = b;
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

}
