/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.persistence;

import com.j256.ormlite.jdbc.JdbcConnectionSource;
import com.j256.ormlite.support.ConnectionSource;
import java.sql.SQLException;

/**
 *
 * @author Jonas
 */
public class Persistence {

    private ConnectionSource connectionSource;
    private static Persistence instance;
    private static final String databaseUrl = "jdbc:mysql://"
            + System.getenv("OPENSHIFT_MYSQL_DB_HOST") + ":"
            + System.getenv("OPENSHIFT_MYSQL_DB_PORT") + "/movie_lens";

    private Persistence() {
        try {
            connectionSource = createConnectionSource();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private ConnectionSource createConnectionSource() throws SQLException {
        final String password = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
        final String user = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        return new JdbcConnectionSource(databaseUrl, user, password);
    }

    public static Persistence instance() {
        if (instance == null) {
            instance = new Persistence();
        }
        return instance;
    }

    public ConnectionSource getConnectionSource() {
        return connectionSource;
    }
}
