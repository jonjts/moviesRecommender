/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.persistence.GenericPersistence;
import com.j256.ormlite.support.ConnectionSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jon_j
 */
public abstract class Control<E, T extends GenericPersistence> implements IControl<E, T> {

    protected T persistence;

    @Override
    public E insert(E object) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            getPersistence().create(object);
            return (E) getPersistence().getLast("id");
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return null;
    }

    @Override
    public Collection<E> getAll() throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            return getPersistence().listAll();
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return new ArrayList<>();
    }

    @Override
    public void delete(Number id) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            getPersistence().deleteById(id);
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
    }

    @Override
    public void update(E object) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            getPersistence().update(object);
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
    }

    @Override
    public E get(Number id) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            return (E) getPersistence().findById(id);
        } catch (SQLException sQLException) {
            sQLException.printStackTrace();
        }
        return null;
    }

}
