package br.com.jonjts.tcc.moviesrecommender.util;

/**
 * Created by jon_j on 15/10/2016.
 */
public class Util {

    private String imdbAddress = "http://www.omdbapi.com/?";
    private String netflixAddress = "https://www.netflix.com/search/";

    public String searchNetflixUrl(String title) {
        title = fixTitle(title);
        title = removeYear(title);
        title = title.replace(" ", "%2520");
        return netflixAddress + title;
    }

    private String removeYear(String title) {
        if (title.contains("(") && title.contains(")")) {
            int abreParentese = title.lastIndexOf("(");
            int fechaParenteze = title.lastIndexOf(")");
            if ((fechaParenteze - abreParentese) - 1 == 4) {
                String substring = title.substring(abreParentese, fechaParenteze+1);
                return title.replace(substring, "");
            }
        }
        return title;
    }

    private String fixTitle(String title) {
        if (title.contains(",")) {
            String fixed = null;
            int lastIndexOf = title.lastIndexOf(",");
            String inicio = title.substring(0, lastIndexOf);
            String fim = title.substring(lastIndexOf + 1, title.length());
            fixed = fim + inicio;
            return fixed;
        } else {
            return title;
        }
    }

}
