/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.Color;
import br.com.jonjts.tcc.moviesrecommender.model.ColorMood;
import br.com.jonjts.tcc.moviesrecommender.model.Mood;
import br.com.jonjts.tcc.moviesrecommender.persistence.ColorMoodPersistence;
import com.j256.ormlite.support.ConnectionSource;
import java.sql.SQLException;
import java.util.Collection;

/**
 *
 * @author jon_j
 */
public class ColorMoodControl extends Control<ColorMood, ColorMoodPersistence> {

    private ColorMoodPersistence persistence;

    @Override
    public ColorMoodPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null && !persistence.getConnectionSource().isOpen(ColorMood.TABLE_NAME))) {
            persistence = new ColorMoodPersistence();
        }
        return persistence;
    }

    public Collection<ColorMood> findColorWithMoodSimilar(Color color) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            MoodControl moodControl = new MoodControl();
            Collection<Mood> moods = moodControl.get(color);
            return getPersistence().queryBuilder().where().in("mood_id", moods).query();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return null;
    }
}
