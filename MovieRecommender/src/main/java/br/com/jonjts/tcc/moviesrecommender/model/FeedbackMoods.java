/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

/**
 *
 * @author jon_j
 */
@DatabaseTable(tableName = "feedbacks_moods")
public class FeedbackMoods {

    public static final String TABLE_NAME = "feedbacks_moods";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField(columnName = "feedback_id", foreign = true)
    private Feedback feedback;

    @DatabaseField(columnName = "mood_id", foreign = true)
    private GenericMood genericMood;

    public FeedbackMoods() {
    }

    public FeedbackMoods(Integer id, Feedback feedback, GenericMood mood) {
        this.id = id;
        this.feedback = feedback;
        this.genericMood = mood;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public GenericMood getGenericMood() {
        return genericMood;
    }

    public void setGenericMood(GenericMood genericMood) {
        this.genericMood = genericMood;
    }

}
