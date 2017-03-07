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
import br.com.jonjts.tcc.moviesrecommender.persistence.MoodPersistence;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author jon_j
 */
public class MoodControl extends Control<Mood, MoodPersistence> {

    private MoodPersistence persistence;

    @Override
    public MoodPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null
                && persistence.getConnectionSource().isOpen(Mood.TABLE_NAME))) {
            persistence = new MoodPersistence();
        }
        return persistence;
    }

    public Collection<Mood> get(Color color) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            ColorMoodPersistence colorMoodPersistence = new ColorMoodPersistence();
            List<ColorMood> query = colorMoodPersistence.queryBuilder().where().eq("color_id", color.getId()).query();
            return getPersistence().queryBuilder().where().in("id", bind(query)).and().eq("status", true).query();
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return new ArrayList<>();
    }

    public Collection<Mood> get(Long limit) throws Exception {
        limit = limit == null ? 400 : limit;
        limit = limit == 0 ? 400 : limit;
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            QueryBuilder<Mood, Integer> moodQueryBuilder = getPersistence().queryBuilder();
            moodQueryBuilder.where().eq("status", true);
            return moodQueryBuilder.limit(limit).query();
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return new ArrayList<>();
    }

    @Override
    public Collection<Mood> getAll() throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            return getPersistence().queryBuilder().where().eq("status", true).query();
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return new ArrayList<>();
    }

    private List<Integer> bind(Collection<ColorMood> collection) {
        List<Integer> list = new ArrayList<Integer>();
        for (ColorMood cm : collection) {
            list.add(cm.getMood().getId());
        }
        return list;
    }

}
