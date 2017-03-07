package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.GenericMood;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;

/**
 * Author Jonas [@jonjts] [24/10/2016].
 */
public class GenericMoodPersistence extends GenericPersistence<GenericMood, Integer> {

    public GenericMoodPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), GenericMood.class);
    }
    public GenericMoodPersistence(ConnectionSource connectionSource) throws SQLException {
        super(connectionSource, GenericMood.class);
    }

}
