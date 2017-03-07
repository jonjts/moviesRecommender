package br.com.jonjts.tcc.moviesrecommender.controller;

import br.com.jonjts.tcc.moviesrecommender.model.User;
import br.com.jonjts.tcc.moviesrecommender.persistence.UserPersistence;
import com.j256.ormlite.dao.GenericRawResults;
import com.j256.ormlite.support.ConnectionSource;

import java.sql.SQLException;
import java.text.DecimalFormat;

/**
 * Author Jonas [@jonjts] [05/11/2016].
 */
public class UserControl extends Control<User, UserPersistence> {

    @Override
    public UserPersistence getPersistence() throws SQLException {
        if (persistence == null || (persistence != null
                && persistence.getConnectionSource().isOpen(User.TABLE_NAME))) {
            persistence = new UserPersistence();
        }
        return persistence;
    }

    public Number[] consultNumbersRelatorioGeral(User user) {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT (SELECT COUNT(*) FROM recommendation_history WHERE user_id = ?) AS historico, ");
            sql.append("(SELECT COUNT(*) FROM feedbacks WHERE user_id = ? AND rating IS NOT NULL) AS total_feedback, ");
            sql.append("(SELECT COUNT(*) FROM feedbacks WHERE user_id =? AND rating >= 3 AND rating <> 99) AS total_feedback_good, ");
            sql.append("(SELECT COUNT(*) FROM feedbacks WHERE user_id =? AND rating < 3) AS total_feedback_bad, ");
            sql.append("(SELECT COUNT(*) FROM feedbacks WHERE user_id =? AND rating = 99) AS total_feedback_nao_assistir, ");
            sql.append("(SELECT COUNT(*) FROM feedbacks WHERE user_id =? AND rating IS NULL) AS total_feedback_empty ");
            sql.append("FROM movie_lens.users AS us WHERE id = ?;");

            GenericRawResults<String[]> results = persistence.queryRaw(sql.toString(), new String[]{user.getId() + "", user.getId() + "",
                    user.getId() + "", user.getId() + "", user.getId() + "", user.getId() + "", user.getId() + ""});

            Number[] numbers = new Number[10];
            String[] result = results.getFirstResult();
            if (result != null) {
                String[] firstResult = result;
                Double historico = Double.parseDouble(firstResult[0]);
                Double totalFeedback = Double.parseDouble((firstResult[1]));
                Double totalFeedback_good = Double.parseDouble(firstResult[2]);
                Double totalFeedback_bad = Double.parseDouble(firstResult[3]);
                Double totalFeedback_nao_assistir = Double.parseDouble(firstResult[4]);
                Double totalFeedback_empty = Double.parseDouble(firstResult[5]);
                double perctFeedGood = (totalFeedback_good / totalFeedback) * 100;
                double perctFeedBad = (totalFeedback_bad / totalFeedback) * 100;
                double perctFeedNaoAssistir = (totalFeedback_nao_assistir / totalFeedback) * 100;
                double perctFeedEmpty = (totalFeedback_empty / totalFeedback) * 100;

                numbers[0] = historico;
                numbers[1] = totalFeedback;
                numbers[2] = totalFeedback_good;
                numbers[3] = totalFeedback_bad;
                numbers[4] = totalFeedback_nao_assistir;
                numbers[5] = totalFeedback_empty;
                numbers[6] = perctFeedGood;
                numbers[7] = perctFeedBad;
                numbers[8] = perctFeedNaoAssistir;
                numbers[9] = perctFeedEmpty;
            }
            return numbers;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Number[]{};
    }

    public String consultRelatorioGeral(User user) {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            DecimalFormat decimalFormat = new DecimalFormat("#,##");
            Number[] numbers = consultNumbersRelatorioGeral(user);

            StringBuilder msg = new StringBuilder();
            msg.append("Recomendações feitas para mim: <b>").append(numbers[0]).append("</b><br/>");
            msg.append("Recomendações que eu evaliei: <b>").append(numbers[1]).append("</b><br/>");
            msg.append("Recomendações que eu gostei: <b>").append(decimalFormat.format(numbers[4])).append("%</b><br/>");
            msg.append("Recomendações que eu não gostei: <b>").append(decimalFormat.format(numbers[5])).append("%</b><br/>");
            return msg.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    @Override
    public User insert(User object) throws Exception {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            User user = persistence.queryBuilder().where().eq("email", object.getEmail()).queryForFirst();
            if (user != null && user.getId() != null) {
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return super.insert(object);
    }

    public User get(String email) {
        try (ConnectionSource connectionSource = getPersistence().getConnectionSource();) {
            User user = persistence.queryBuilder().where().eq("email", email).queryForFirst();
            if (user != null && user.getId() != null) {
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new User();
    }
}

