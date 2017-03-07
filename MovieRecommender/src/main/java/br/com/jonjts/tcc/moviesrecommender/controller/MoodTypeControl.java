package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.MoodType;
import br.com.jonjts.tcc.moviesrecommender.persistence.MoodTypePersistence;

import java.sql.SQLException;

/**
 * Author Jonas [@jonjts] [24/10/2016].
 */
public class MoodTypeControl extends Control<MoodType, MoodTypePersistence> {

    @Override
    public MoodTypePersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null &&
                !persistence.getConnectionSource().isOpen(MoodType.TABLE_NAME))) {
            persistence = new MoodTypePersistence();
        }
        return persistence;
    }
}
