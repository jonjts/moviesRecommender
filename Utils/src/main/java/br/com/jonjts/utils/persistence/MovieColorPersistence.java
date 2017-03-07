/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.jonjts.utils.persistence;

import br.com.jonjts.renamevideos.model.MoviesColor;
import java.sql.SQLException;

/**
 *
 * @author jon_j
 */
public class MovieColorPersistence extends GenericPersistence<MoviesColor, Integer>{

    public MovieColorPersistence() throws SQLException {
        super(Persistencia.instance().getConnectionSource(), MoviesColor.class);
    }
    
    
}
