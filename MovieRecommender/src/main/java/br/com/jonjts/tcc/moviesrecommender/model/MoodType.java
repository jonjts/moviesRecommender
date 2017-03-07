package br.com.jonjts.tcc.moviesrecommender.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

/**
 * Author Jonas [@jonjts] [24/10/2016].
 */
@DatabaseTable(tableName = "mood_type")
public class MoodType {

    public static final String TABLE_NAME = "mood_type";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField(foreign = true, columnName = "mood_id")
    private Mood mood;

    @DatabaseField(foreign = true, columnName = "generic_mood_id")
    private GenericMood genericMood;

    public MoodType() {
    }

    public MoodType(Integer id) {
        this.id = id;
    }

    public MoodType(Integer id, Mood mood, GenericMood genericMood) {
        this.id = id;
        this.mood = mood;
        this.genericMood = genericMood;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Mood getMood() {
        return mood;
    }

    public void setMood(Mood mood) {
        this.mood = mood;
    }

    public GenericMood getGenericMood() {
        return genericMood;
    }

    public void setGenericMood(GenericMood genericMood) {
        this.genericMood = genericMood;
    }
}
