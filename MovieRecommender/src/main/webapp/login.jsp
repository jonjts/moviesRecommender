<%@ page import="br.com.jonjts.tcc.moviesrecommender.oauth.GoogleAuthHelper" %>
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

    <!-- Wide card with share menu button -->
    <style>
        .demo-card-wide.mdl-card {
            width: 512px;
        }

        .demo-card-wide > .mdl-card__title {
            color: #fff;
            height: 176px;
            background: url('images/kites_day.png') center / cover;
        }

        .demo-card-wide > .mdl-card__menu {
            color: #fff;
        }
    </style>

</head>
<body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
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

        </div>
        <div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
            <div class="mdl-snackbar__text"></div>
            <button class="mdl-snackbar__action" type="button"></button>
        </div>
    </header>
    <main class="mdl-layout__content">
        <%
            /*
             * The GoogleAuthHelper handles all the heavy lifting, and contains all "secrets"
             * required for constructing a google login url.
             */
            final GoogleAuthHelper helper = new GoogleAuthHelper();

            if (request.getParameter("code") == null
                    || request.getParameter("state") == null) {

        %>
        <section class="wrapper" style="margin-bottom: 100px;margin-top: 30px;">
            <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Olá</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    Efetue login com sua conta Google para melhorar nossas recomendações.
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
                       href="<%=helper.buildLoginUrl()%>">
                        Login Com Conta Google
                    </a>
                </div>
            </div>
        </section>
        <%
            session.setAttribute("state", helper.getStateToken());

        } else if (request.getParameter("code") != null && request.getParameter("state") != null
                && request.getParameter("state").equals(session.getAttribute("state"))) {

            session.removeAttribute("state");

            String email = helper.getUserEmail(request.getParameter("code"));
            if (email == null) {
        %>
        <div class="mdl-layout__tab-panel is-active" id="overview">
            <section class="wrapper" style="margin-bottom: 100px;margin-top: 30px;">
                <div class="demo-card-square mdl-card mdl-shadow--2dp ">
                    <div class="mdl-card__title mdl-card--expand">
                        <h2 class="mdl-card__title-text">=/</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Nossa. Tivemos algum problema com a sua conta.
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
        } else {
            session.setAttribute("user", email);

        %>
        <script language="JavaScript">
            window.location = "index.jsp";
        </script>
        <%
                }

            }
        %>

        <footer class="mdl-mega-footer">
            <div class="mdl-mega-footer--middle-section">
                <div class="mdl-mega-footer--drop-down-section">
                    <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
                    <h1 class="mdl-mega-footer--heading">Desenvolvedor</h1>
                    <ul class="mdl-mega-footer--link-list">
                        <li><a href="https://twitter.com/jonjts" target="_blank">Jonas Tavares</a></li>
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
<script src="material/material.js"></script>


</body>
</html>
