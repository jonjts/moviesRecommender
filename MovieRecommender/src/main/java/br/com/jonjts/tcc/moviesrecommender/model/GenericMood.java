package br.com.jonjts.tcc.moviesrecommender.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

/**
 * Author Jonas [@jonjts] [24/10/2016].
 */
@DatabaseTable(tableName = "generic_moods")
public class GenericMood {

    public static final String TABLE_NAME = "generic_moods";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField
    private String name;

    public GenericMood() {
    }

    public GenericMood(Integer id) {
        this.id = id;
    }

    public GenericMood(Integer id, String name) {
        this.id = id;
        this.name = name;
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
}
