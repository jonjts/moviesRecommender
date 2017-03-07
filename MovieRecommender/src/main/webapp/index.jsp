<%@page import="br.com.jonjts.tcc.moviesrecommender.controller.*" %>
<%@page import="br.com.jonjts.tcc.moviesrecommender.model.*" %>
<%@ page import="br.com.jonjts.tcc.moviesrecommender.util.Util" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="pt">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Sistema de recomendação de filmes">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Movies Recommender</title>
    <meta name="theme-color" content="#00796B">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Movies Recommender">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <link rel="stylesheet" href="/font-awesome-4.6.3/css/font-awesome.min.css">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">
    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="material/material.min.css">
    <link rel="stylesheet" href="styles.css">


    <script src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="selectfield/mdl-selectfield.css">
    <link rel="stylesheet" href="selectfield/mdl-selectfield.min.css">
    <link rel="stylesheet" href="selectfield/mdl-selectfield.min.css.map">
    <script src="selectfield/selectfield.js"></script>
    <script src="selectfield/mdl-selectfield.min.js"></script>
    <script src="selectfield/mdl-selectfield.min.js.map"></script>

    <style>

        @import url(http://weloveiconfonts.com/api/?family=fontelico);

        /* fontelico */
        [class*="fontelico-"]:before {
            font-family: 'fontelico', sans-serif;
        }

        .demo-card-wide.mdl-card {
            width: 512px;
        }

        .demo-card-wide > .mdl-card__title {
            color: #fff;
            height: 176px;
            background: url('images/kites_day.png') center / cover;
        }

        .demo-card-square.mdl-card {
            width: 320px;
            height: 320px;
        }

        .demo-card-square > .mdl-card__title {
        }

        .max_height_table {
            max-width: 10%;
        }

        .width_100pc {
            width: 100%;
        }

        .demo-card-wide > .mdl-card__menu {
            color: #fff;
        }

        .elemento-a-ser-centralizado {
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }
    </style>

    <style>
        #view-source {
            position: fixed;
            display: block;
            right: 0;
            bottom: 0;
            margin-right: 40px;
            margin-bottom: 40px;
            z-index: 900;
        }

        .img {
            width: 100%;
            height: 100%;
        }

        select {
            font-family: 'FontAwesome', 'sans-serif';
        }

    </style>
</head>
<% boolean showFeedback = false; %>
<body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">


<body onload="checkBrowser()">
<dialog class="mdl-dialog">
    <h4 class="mdl-dialog__title">Ajude com seu feedback :)</h4>
    <div class="mdl-dialog__content">
        <p>
            Selecione como boa recomendação todos os títulos que você acha que representam pelo menos um dos sentimentos
            selecionados.<br/>
            Após isso, é só clicar em 'Envia Feedback'.
        </p>
    </div>
    <div class="mdl-dialog__actions mdl-dialog__actions--full-width">
        <button type="button" class="mdl-button close">Entendi</button>
    </div>
</dialog>
<script>
    var dialog = document.querySelector('dialog');
    if (!dialog.showModal) {
        dialogPolyfill.registerDialog(dialog);
    }

    function showInstrution() {
        dialog.showModal();
    }

    function isMobileBrowser() {
        if (navigator.userAgent.match(/Android/i)
                || navigator.userAgent.match(/webOS/i)
                || navigator.userAgent.match(/iPhone/i)
                || navigator.userAgent.match(/iPad/i)
                || navigator.userAgent.match(/iPod/i)
                || navigator.userAgent.match(/BlackBerry/i)
                || navigator.userAgent.match(/Windows Phone/i)
        ) {
            return true;
        }
        else {
            return false;
        }
    }

    dialog.querySelector('.close').addEventListener('click', function () {
        dialog.close();
        if (isMobileBrowser()) {
            document.querySelector('.mdl-layout__content').style.overflowX = 'auto';
            document.querySelector('.mdl-layout__content').style.overflowX = '';
        }
    });

    function checkBrowser() {
        var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
        if (!isChrome) {
            alert("Essa aplicação é otimizada para o navegador Google Chrome.");
        }
    }
</script>
</body>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
%>
<script language="JavaScript">
    window.location = "login.jsp";
</script>
<%
    }
    UserControl userControl = new UserControl();
    User userNaBase = userControl.get(user);
%>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
            <h3>Movie Feeling</h3>

        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">
            <a href="#overview" class="mdl-layout__tab is-active" selected>Buscar Filmes</a>
            <a href="#eu" class="mdl-layout__tab" onclick="loadCharts()"><%=userNaBase.getName()%>
            </a>
            <a href="#sobre" class="mdl-layout__tab">Sobre</a>
        </div>
        <div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
            <div class="mdl-snackbar__text"></div>
            <button class="mdl-snackbar__action" type="button"></button>
        </div>

    </header>

    <main class="mdl-layout__content">

        <%
            try {
                Util util = new Util();
                boolean showThanks = false;
                List<Movie> movies = null;


                GenericMoodControl genericMoodControl = new GenericMoodControl();
                Collection<GenericMood> moods = genericMoodControl.getAll();

                String[] getMoods = request.getParameterValues("moods");
                String[] allFeeds = request.getParameterValues("feed");
                String[] moviesByMoods = request.getParameterValues("movies");

                if (getMoods != null && moviesByMoods != null) {

                    HashMap<Integer, Integer> feedMap = new HashMap<Integer, Integer>();
                    for (String s : allFeeds) {
                        if (s != null && !s.isEmpty()) {
                            String[] ids = s.split("-");
                            int idMovie = Integer.parseInt(ids[0]);
                            int idOption = Integer.parseInt(ids[1]);
                            feedMap.put(idMovie, idOption);
                        }
                    }

                    showThanks = true;
                    List<Feedback> feedbacks = new ArrayList<Feedback>();
                    for (String movieId : moviesByMoods) {
                        Feedback f = new Feedback();
                        int idMovie = Integer.parseInt(movieId);
                        f.setMovie(new Movie(idMovie));
                        f.setRating(feedMap.get(idMovie));
                        f.setUser(userNaBase);
                        feedbacks.add(f);
                    }

                    List<GenericMood> feedMods = new ArrayList<GenericMood>();
                    for (String m : getMoods) {
                        GenericMood genericMood = new GenericMood(Integer.parseInt(m));
                        feedMods.add(genericMood);
                    }
                    try {
                        FeedbackControl feedbackControl = new FeedbackControl();
                        feedbackControl.insert(feedbacks, feedMods);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
        %>

        <form method="post" style="margin-top: 30px;margin-left: 10px;margin-right: 10px" id="formSaveFeedBack">
            <div class="mdl-layout__tab-panel is-active" id="overview">
                <% if (showThanks) {%>
                <section class="wrapper" style="margin-bottom: 100px;">
                    <div class="demo-card-wide mdl-card mdl-shadow--2dp ">
                        <div class="mdl-card__title">
                            <h2 class="mdl-card__title-text">Obrigado</h2>
                        </div>
                        <div class="mdl-card__actions mdl-card--border">
                            <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
                               href="index.jsp">
                                Buscar mais Filmes
                            </a>
                        </div>
                    </div>
                </section>
                <% } else { %>
                <%
                    if (getMoods != null) {
                        showFeedback = true;
                %>

                <script>window.setTimeout(showInstrution, 5500);</script>

                <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp" id="tags">
                    <div class=" mdl-cell mdl-cell--12-col" style="background-color: #FFFFFF;">
                        <div class="mdl-card__supporting-text" width="20px">

                            <h4>Como se sente?</h4>
                            <% for (GenericMood m : moods) {
                                if (getMoods != null) {
                                    for (String sMood : getMoods) {
                                        if (sMood.equals(m.getId() + "")) {

                            %>
                            <span class="mdl-chip  mdl-chip--contact">
                                <span class="mdl-chip__contact mdl-color--teal mdl-color-text--white"> <%= m.getName().charAt(0) %></span>
                                    <span class="mdl-chip__text"><%=m.getName()%></span>
                                    <input type="hidden" value="<%=m.getId()%>" name="moods" class="mdl-switch__input">
                                </span>

                            <%
                                                break;
                                            }
                                        }
                                    }
                                }%>
                        </div>
                    </div>
                    <%
                        ArrayList<Integer> idMoods = new ArrayList<Integer>();
                        for (String sMood : getMoods) {
                            idMoods.add(Integer.parseInt(sMood));
                        }
                        MovieColorControl movieColorControl = new MovieColorControl();
                        movies = movieColorControl.get(idMoods, userNaBase, 20l);

                    %>
                </section>
                <%
                    //TODO: CARREGAR LINK DAS IMAGENS ANTES DESSE FOR
                    for (Movie mv : movies) {
                        ImdbControl control = new ImdbControl();
                        ImdbMovie imdb = control.getPoster(mv);
                %>
                <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
                    <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
                        <% if (imdb.getPoster() != null) {%>
                        <img src="<%= imdb.getPoster()%>" class="img"/>
                        <%} else {%>
                        <i class="material-icons">image</i>
                        <%}%>
                    </header>
                    <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                        <div class="mdl-card__supporting-text">
                            <h4><a href="http://www.imdb.com/title/tt<%= mv.getImdbId()%>" target="_blank"
                                   style="color: #009688;"><%=mv.getTitle()%>
                            </a>
                                <button type="button" id="accbtn-<%= mv.getId() %>"
                                        class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                                    <i class="material-icons" role="presentation">arrow_drop_down</i>
                                    <span class="visuallyhidden">Accounts</span>
                                </button>
                                <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                                    for="accbtn-<%= mv.getId() %>">
                                    <li class="mdl-menu__item"
                                        onclick="openInNewTab('<%=util.searchNetflixUrl(mv.getTitle()) %>')"> Netflix
                                    </li>
                                    <li class="mdl-menu__item"
                                        onclick="openInNewTab('http://www.imdb.com/title/tt<%=mv.getImdbId()%>')">
                                        IMDB
                                    </li>
                                </ul>
                            </h4>
                            <% if (imdb.getPlot() != null) {%>
                            <%= imdb.getPlot()%>
                            <%}%>
                        </div>
                        <div class="mdl-card__actions">
                            <div class="mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label"
                                 style="width: 496px;">
                                <input type="hidden" value="<%=mv.getId()%>" name="movies" class="mdl-switch__input">
                                <select id="myselect" name="feed" class="mdl-selectfield__select">
                                    <option value=""></option>
                                    <option value="<%=mv.getId()%>-1">
                                        &#9734;
                                    </option>
                                    <option value="<%=mv.getId()%>-2">
                                        &#9734;&#9734;
                                    </option>
                                    <option value="<%=mv.getId()%>-3">
                                        &#9734;&#9734;&#9734;
                                    </option>
                                    <option value="<%=mv.getId()%>-4">
                                        &#9734;&#9734;&#9734;&#9734;
                                    </option>
                                    <option value="<%=mv.getId()%>-5">
                                        &#9734;&#9734;&#9734;&#9734;&#9734;
                                    </option>
                                    <option value="<%=mv.getId()%>-99">
                                        Não assisti
                                    </option>
                                </select>
                                <label for="myselect" class="mdl-selectfield__label" style="color: #00796B;">O quanto
                                    esse filme representa o sentimento que você selecionou?</label>
                                <span class="mdl-textfield__error">Informe seu feedback</span>
                            </div>
                        </div>
                    </div>
                </section>
                <%
                    }
                } else {
                %>
                <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">


                    <div class="mdl-card mdl-cell mdl-cell--12-col">
                        <!-- Deletable Contact Chip -->
                        <form method="post">
                            <div class="mdl-card__supporting-text" width="20px">
                                <h4>Como se sente?</h4>
                                <% for (GenericMood m : moods) {
                                    String check = "";
                                    if (getMoods != null) {
                                        for (String sMood : getMoods) {
                                            if (sMood.equals(m.getId() + "")) {
                                                check = "checked";
                                                break;
                                            }
                                        }
                                    }
                                    String emmoticonMood = "";
                                    switch (m.getId()) {
                                        case 1:
                                            emmoticonMood = "fontelico-emo-angry";
                                            break;
                                        case 2:
                                            emmoticonMood = "fontelico-emo-laugh";
                                            break;
                                        case 4:
                                            emmoticonMood = "fontelico-emo-unhappy";
                                            break;
                                        case 5://confiante
                                            emmoticonMood = "fontelico-emo-thumbsup";
                                            break;
                                        case 6: //calmo
                                            emmoticonMood = "fontelico-emo-squint";
                                            break;
                                    }
                                %>

                                <div class="my-checkbox-position">
                                    <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
                                           for="checkbox-<%=m.getId()%>">
                                        <!-- Large Tooltip -->
                                        <div id="tt3-<%=m.getId()%>"><h4><span class="<%=emmoticonMood%>"></span></h4>
                                        </div>
                                        <div class="mdl-tooltip mdl-tooltip--large" for="tt3-<%=m.getId()%>">
                                            <%=m.getName()%>
                                        </div>
                                        <input type="checkbox" name="moods" id="checkbox-<%=m.getId()%>"
                                               value="<%=m.getId()%>" class="mdl-checkbox__input" <%=check%> >
                                    </label>
                                </div>
                                <% }%>

                            </div>
                            <div class="mdl-card__actions">
                                <button class="mdl-button mdl-js-button mdl-button--primary" type="submit">
                                    Buscar Filmes
                                </button>
                            </div>
                        </form>
                    </div>
                </section>
                <%}%>
                <section class="section--footer mdl-color--white mdl-grid">

                </section>

                <% }%>
            </div>
        </form>
        <%
        } catch (Exception e) {
            Logger.getLogger("Index.jsp").log(Level.SEVERE, null, e);
        %>
        <div class="mdl-layout__tab-panel is-active" id="overview">
            <section class="wrapper" style="margin-bottom: 100px;margin-top: 30px;">
                <div class="demo-card-square mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text">=/</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Não foi possível carregar dados.<br/>
                        Tente novamente mais tarde.
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" href="index.jsp">
                            Atualizar
                        </a>
                    </div>
                </div>
            </section>
        </div>
        <%
            }
        %>


        <div class="mdl-layout__tab-panel" id="eu" style="background-color: whitesmoke;padding-top: 0px;">
            <div class="demo-charts mdl-color--white mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid">

                <div class="class=demo-chart mdl-cell mdl-cell--9-col mdl-cell--4-col-desktop">
                    <div class="mdl-card__title mdl-card--expand" viewBox="0 0 1 1">
                        <div id="feedbackChart" style="text-align: center;"></div>
                    </div>
                    <div class="mdl-card__supporting-text" style="height: 51px;text-align: center;">
                        Estimativa das recomendações das quais avaliei
                    </div>
                </div>

                <div class="class=demo-chart mdl-cell mdl-cell--9-col mdl-cell--4-col-desktop">
                    <div class="mdl-card__title mdl-card--expand" viewBox="0 0 1 1">
                        <div id="recomendacaoChart"></div>
                    </div>
                    <div class="mdl-card__supporting-text" style="height: 51px;text-align: center;">
                        Estimativa das minhas recomendações
                    </div>
                </div>

                <% RecommendationHistoryControl recommendationHistoryControl = new RecommendationHistoryControl();
                    List<RecommendationHistory> recommendationHistories = recommendationHistoryControl.lastRecommendation(userNaBase);
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                %>

                <table class="mdl-data-table mdl-js-data-table mdl-data-table max_height_table">
                    <thead>
                    <tr>
                        <th class="mdl-data-table__cell">Últimas Reomendações</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (RecommendationHistory recommendationHistory : recommendationHistories) { %>
                    <tr>
                        <td class="mdl-data-table__cell--non-numeric"><%= recommendationHistory.getMovie().getTitle() %>
                        </td>
                        <td><%= simpleDateFormat.format(recommendationHistory.getTime())%>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>


            </div>


        </div>

        <div class="mdl-layout__tab-panel" id="sobre" style="background-color: whitesmoke;">
            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
                <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
                    <i class="material-icons">dvr</i>
                </header>
                <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                    <div class="mdl-card__supporting-text">
                        <h4>O Projeto</h4>
                        Esse é um projeto desenvolvido com fins acadêmicos.<br/>
                        As recomendações e feedbacks feitos contribuem paras os resultados práticos e estatísticos da
                        pesquisa.
                    </div>
                </div>
            </section>

            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
                <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
                    <i class="material-icons">memory</i>
                </header>
                <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                    <div class="mdl-card__supporting-text">
                        <h4>Como Funciona?</h4>
                        Essa aplicação é um sistema de recomendação de filmes no qual recomenda títulos através dos
                        sentimentos que os mesmos despertam.<br/>
                        A extração de sentimentos dos filmes é feita com a paleta de cores de cada filme.<br/>
                        As cores são capazes de despertar varias relações afetivas nos seres humanos, com base nisso o
                        projeto foi desenvolvido afim de apresentar um sistema de recomendação fora do usual.
                    </div>
                </div>
            </section>

            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
                <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
                    <i class="material-icons">launch</i>
                </header>
                <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                    <div class="mdl-card__supporting-text">
                        <h4>Por Que Enviar um Feedback?</h4>
                        O sistema consegue oferecer recomendações de títulos, porém, é preciso saber se a recomendação
                        oferecida é realmente uma boa recomendação, para tal é preciso alimentar a base de dados com
                        feedbacks sobre boas e más recomendações para aprimorar o algorítimo.
                    </div>
                </div>
            </section>
        </div>
        <footer class="mdl-mega-footer">
            <div class="mdl-mega-footer--middle-section">
                <div class="mdl-mega-footer--drop-down-section">
                    <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
                    <h1 class="mdl-mega-footer--heading">Desenvolvedor</h1>
                    <ul class="mdl-mega-footer--link-list">
                        <li><a href="https://twitter.com/jonjts" target="_blank">Jonas Tavares</a></li>
                    </ul>
                </div>
                <div class="mdl-mega-footer--drop-down-section">
                    <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
                    <h1 class="mdl-mega-footer--heading"><%= user%>
                    </h1>
                    <ul class="mdl-mega-footer--link-list">
                        <li><a href="removeLogin.jsp">Sair</a></li>
                    </ul>
                </div>
            </div>
            <div class="mdl-mega-footer--bottom-section">
                <div class="mdl-logo">
                    Este é um projeto desenvolvido para fins acadêmicos.<br/>
                </div>
                <div id="tt2" style="float: right;"><label>Aplicação otimizada para o navegador Google Chrome</label>
                </div>
                <div class="mdl-tooltip mdl-tooltip" for="tt2">
                    Aplicação otimizada para o navegador Google Chrome
                </div>
            </div>
            <br/>
        </footer>


    </main>
</div>
<%if (showFeedback) {%>
<a style="background-color: #009688;" onclick="submitSaveFeedBack()" id="view-source"
   class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast">Enviar
    Feedback</a>
<%}%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="material/material.js"></script>
<script type="text/javascript">

    function redirectToLogin() {
        window.location = "login.jsp";
    }

    var submitSaveFeedBack = function () {
        document.getElementById("formSaveFeedBack").submit();
    }

    var reload = function () {
        location.href = "index.jsp";
    }

    function clearUser() {
        window.location = "removeLogin.jsp";
    }

    function openInNewTab(url) {
        var win = window.open(url, '_blank');
        win.focus();
    }


    <% Number[] numbers = userControl.consultNumbersRelatorioGeral(userNaBase); %>
    google.charts.load('current', {packages: ['corechart', 'bar']});


    function loadCharts() {
        google.charts.setOnLoadCallback(drawChartRecomendacao());
        google.charts.setOnLoadCallback(drawChartFeedBack);
    }

    function drawChartRecomendacao() {

        var data = google.visualization.arrayToDataTable([
            ['', ''],
            ['Filmes que recebi', <%=numbers[0]%>],
            ['Filmes que avaliei', <%=numbers[1]%>]
        ]);

        var options = {
            title: '',
            width: 300,
            height: 260,
            colors: ['#009688', '#00796B', '#004537', '#f3b49f', '#f6c7b6'],
            chartArea: {left: '15%', width: "100%", height: "100%"},
            backgroundColor: {fill: 'transparent'},
            pieSliceText: 'value',
            bars: 'vertical',
            legend: {position: 'none'},
            hAxis: {textColor: '#ffffff'},
            bar: {groupWidth: "5%"},
        };


        var material = new google.charts.Bar(document.getElementById('recomendacaoChart'));
        material.draw(data, options);
    }

    function drawChartFeedBack() {

        var data = google.visualization.arrayToDataTable([
            ['Feedbacks', 'Sim/Não'],
            ['Gostei', <%=numbers[2]%>],
            ['Não Gostei', <%=numbers[3]%>],
            ['Não Assisti o Filme', <%=numbers[4]%>]
        ]);

        var options = {
            title: '',
            pieHole: 0.4,
            width: 410,
            height: 260,
            colors: ['#009688', '#00796B', '#005E53', '#f3b49f', '#f6c7b6'],
            chartArea: {left: '15%', width: "100%", height: "100%"},
            backgroundColor: {fill: 'transparent'},
        };

        var chart = new google.visualization.PieChart(document.getElementById('feedbackChart'));

        chart.draw(data, options);
    }

</script>


</body>
</html>
