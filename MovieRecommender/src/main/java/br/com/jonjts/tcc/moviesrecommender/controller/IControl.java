/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.persistence.GenericPersistence;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author Jonas
 */
public interface IControl<E, T extends GenericPersistence> {
    
    public T getPersistence() throws SQLException ;
    
    public E insert(E object) throws Exception;
    
    public Collection<E> getAll() throws Exception;
    
    public void delete(Number id) throws Exception;
    
    public void update(E object) throws Exception;
    
    public E get(Number id) throws Exception;
}
