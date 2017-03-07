/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.Color;
import br.com.jonjts.tcc.moviesrecommender.model.ColorMood;
import br.com.jonjts.tcc.moviesrecommender.model.Mood;
import br.com.jonjts.tcc.moviesrecommender.model.MoodType;
import br.com.jonjts.tcc.moviesrecommender.persistence.ColorMoodPersistence;
import br.com.jonjts.tcc.moviesrecommender.persistence.ColorPersistence;
import com.j256.ormlite.dao.DatabaseResultsMapper;
import com.j256.ormlite.dao.GenericRawResults;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.support.ConnectionSource;
import com.j256.ormlite.support.DatabaseResults;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/**
 * @author jon_j
 */
public class ColorControl extends Control<Color, ColorPersistence> {

    private ColorPersistence persistence;

    @Override
    public ColorPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null && !persistence.getConnectionSource().isOpen(Color.TABLE_NAME))) {
            persistence = new ColorPersistence();
        }
        return persistence;
    }

    public Collection<Color> get(Collection<Mood> list) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            ColorMoodPersistence colorMoodPersistence = new ColorMoodPersistence();
            QueryBuilder<ColorMood, Integer> queryColorMood = colorMoodPersistence.queryBuilder();
            QueryBuilder<Color, Integer> queryColor = getPersistence().queryBuilder();

            List<ColorMood> query = queryColorMood.where().in("mood_id", list).query();

            return queryColor.join(queryColorMood).where().in("id", bindColor(query)).query();
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return new ArrayList<>();
    }

    public Collection<Color> getByMoods(Collection<Integer> genericMoods) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {

            StringBuilder sql = new StringBuilder("SELECT * FROM movie_lens.colors WHERE id IN (SELECT color_id FROM movie_lens.colors_moods WHERE mood_id IN (SELECT mood_id FROM movie_lens.mood_type WHERE generic_mood_id IN (");
            Iterator<Integer> iterator = genericMoods.iterator();
            while (iterator.hasNext()){
                sql.append(iterator.next());
                if(iterator.hasNext()){
                    sql.append(",");
                }
            }
            sql.append(")))");

            GenericRawResults<Color> colors = getPersistence().queryRaw(sql.toString(), new DatabaseResultsMapper<Color>() {
                @Override
                public Color mapRow(DatabaseResults databaseResults) throws SQLException {
                    int id = databaseResults.getInt(databaseResults.findColumn("id"));
                    String name = databaseResults.getString(databaseResults.findColumn("name"));
                    int r = databaseResults.getInt(databaseResults.findColumn("r"));
                    int g = databaseResults.getInt(databaseResults.findColumn("g"));
                    int b = databaseResults.getInt(databaseResults.findColumn("b"));

                    return new Color(id, name, r, g, b);
                }
            });

            return colors.getResults();
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return new ArrayList<>();
    }

    private List<Integer> bindMood(List<MoodType> list) {
        List<Integer> moods = new ArrayList<>();
        for (MoodType mt : list) {
            moods.add(mt.getMood().getId());
        }
        return moods;
    }

    private List<Integer> bindColor(List<ColorMood> list) {
        List<Integer> colors = new ArrayList<Integer>();
        for (ColorMood cm : list) {
            colors.add(cm.getColor().getId());
        }
        return colors;
    }

}
