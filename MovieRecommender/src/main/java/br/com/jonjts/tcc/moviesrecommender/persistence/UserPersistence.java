package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.User;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;

/**
 * Author Jonas [@jonjts] [05/11/2016].
 */
public class UserPersistence extends GenericPersistence<User, Integer> {

    public UserPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), User.class);
    }
}
