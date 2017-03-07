/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.Color;
import br.com.jonjts.tcc.moviesrecommender.model.Movie;
import br.com.jonjts.tcc.moviesrecommender.model.MovieColor;
import br.com.jonjts.tcc.moviesrecommender.model.User;
import br.com.jonjts.tcc.moviesrecommender.persistence.MovieColorPersistence;
import br.com.jonjts.tcc.moviesrecommender.persistence.MoviePersistence;
import br.com.jonjts.tcc.moviesrecommender.util.ColorUtil;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author jon_j
 */
public class MovieColorControl extends Control<MovieColor, MovieColorPersistence> {

    private MovieColorPersistence persistence;

    @Override
    public MovieColorPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null &&
                persistence.getConnectionSource().isOpen(MovieColor.TABLE_NAME))) {
            persistence = new MovieColorPersistence();
        }
        return persistence;
    }

    public List<Movie> get(Collection<Color> cores, User user, Long limit) throws Exception {
        limit = limit == null ? 20 : limit;
        //List<MovieColor> query = getPersistence().queryBuilder().orderBy("frequency", false).limit(limit).orderByRaw("RAND()").query();
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            limit = limit / 2;
            List<Movie> movies = getMovies(cores, user, limit, connectionSource);
            List<Movie> moviesImdb = getMovies(cores, user, limit, movies, connectionSource);
            movies.addAll(moviesImdb);
            return movies;
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return new ArrayList<>();
    }
    private List<Movie> getMovies(Collection<Color> cores, User user, Long limit,List<Movie> nosThisMovies ,ConnectionSource connectionSource) throws SQLException {
        FeedbackControl feedbackControl = new FeedbackControl();
        List<Integer> feedbecados = feedbackControl.consultFeedbecados(user);

        MoviePersistence moviePersistence = new MoviePersistence(connectionSource);
        QueryBuilder<Movie, Integer> movieQueryBuilder = moviePersistence.queryBuilder();
        movieQueryBuilder.where().ge("imdb_rating", 7);

        QueryBuilder<MovieColor, Integer> movieColorQueryBuilder = getPersistence().queryBuilder().orderByRaw("RAND()");
        if (!feedbecados.isEmpty()) {
            movieColorQueryBuilder.where().notIn("movie_id", feedbecados).and();
        }
        if (!nosThisMovies.isEmpty()) {
            movieColorQueryBuilder.where().notIn("movie_id", nosThisMovies);
        }
        movieColorQueryBuilder.distinct();

        QueryBuilder<MovieColor, Integer> join = movieColorQueryBuilder.join(movieQueryBuilder);
        List<MovieColor> query = join.query();
        return getMovies(cores, user, limit, query);
    }

    private List<Movie> getMovies(Collection<Color> cores, User user, Long limit, List<MovieColor> query) {
        ArrayList<Movie> movies = new ArrayList<Movie>();
        for (Color c : cores) {
            java.awt.Color corInBase = new java.awt.Color(c.getR(), c.getG(), c.getB());
            for (MovieColor mc : query) {
                if (!movies.contains(mc.getMovie()) && limit > 0) {
                    java.awt.Color myColor = new java.awt.Color(mc.getR(), mc.getG(), mc.getB());
                    double colorDifference = ColorUtil.getColorDifference(myColor.getRGB(), corInBase.getRGB());
                    if (colorDifference <= 50) {
                        movies.add(mc.getMovie());
                        limit--;
                    }
                }
            }
        }
        RecommendationHistoryControl recommendationHistoryControl = new RecommendationHistoryControl();
        recommendationHistoryControl.insert(movies, user);
        return movies;
    }

    private List<Movie> getMovies(Collection<Color> cores, User user, Long limit, ConnectionSource connectionSource) throws SQLException {
        FeedbackControl feedbackControl = new FeedbackControl();
        List<Integer> feedbecados = feedbackControl.consultFeedbecados(user);

        MoviePersistence moviePersistence = new MoviePersistence(connectionSource);
        QueryBuilder<Movie, Integer> movieQueryBuilder = moviePersistence.queryBuilder();
        movieQueryBuilder.where().ge("year", 2010);

        QueryBuilder<MovieColor, Integer> movieColorQueryBuilder = getPersistence().queryBuilder().orderByRaw("RAND(), frequency DESC");
        if (!feedbecados.isEmpty()) {
            movieColorQueryBuilder.where().notIn("movie_id", feedbecados);
        }

        QueryBuilder<MovieColor, Integer> join = movieColorQueryBuilder.join(movieQueryBuilder);
        List<MovieColor> query = join.query();
        return getMovies(cores, user, limit, query);
    }

    public List<Movie> get(List<Integer> GenericMoods, User user, Long limit) throws Exception {
        limit = limit == null ? 5 : limit;
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            ColorControl colorControl = new ColorControl();
            Collection<Color> colors = colorControl.getByMoods(GenericMoods);
            return get(colors, user, limit);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return new ArrayList<>();
    }

}
