package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.MoodType;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;

/**
 * Author Jonas [@jonjts] [24/10/2016].
 */
public class MoodTypePersistence extends GenericPersistence<MoodType, Integer> {

    public MoodTypePersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), MoodType.class);
    }

    public MoodTypePersistence(ConnectionSource connectionSource) throws SQLException {
        super(connectionSource, MoodType.class);
    }
}
