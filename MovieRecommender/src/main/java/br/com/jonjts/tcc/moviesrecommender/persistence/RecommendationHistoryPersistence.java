package br.com.jonjts.tcc.moviesrecommender.persistence;

import br.com.jonjts.tcc.moviesrecommender.model.RecommendationHistory;

import java.sql.SQLException;
import java.util.List;

/**
 * Author Jonas [@jonjts] [05/11/2016].
 */
public class RecommendationHistoryPersistence extends GenericPersistence<RecommendationHistory, Integer> {

    public RecommendationHistoryPersistence() throws SQLException {
        super(Persistence.instance().getConnectionSource(), RecommendationHistory.class);
    }
}
