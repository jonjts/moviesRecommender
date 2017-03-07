package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.GenericMood;
import br.com.jonjts.tcc.moviesrecommender.persistence.GenericMoodPersistence;

import java.sql.SQLException;

/**
 * Author Jonas [@jonjts] [24/10/2016].
 */
public class GenericMoodControl extends Control<GenericMood, GenericMoodPersistence> {

    @Override
    public GenericMoodPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null &&
                !persistence.getConnectionSource().isOpen(GenericMood.TABLE_NAME))) {
            persistence = new GenericMoodPersistence();
        }
        return persistence;
    }
}
