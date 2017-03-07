package br.com.jonjts.utils.persistence;

import br.com.jonjts.renamevideos.model.Movie;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;

/**
 * Author Jonas [@jonjts] [25/10/2016].
 */
public class MoviePersistence extends GenericPersistence<Movie, Integer> {

    public MoviePersistence() throws SQLException {
        super(Persistencia.instance().getConnectionSource(), Movie.class);
    }
}
