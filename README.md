# README #

Esse README contem instruções para a execução do projeto TCC apelidado de MoviesRecommender.

### O que contém nesse repositório ###

* Aplicação JAVA capaz de buscar e baixar trailers de filmes no Youtube
* Backup da base de dados para execução da aplicação web 
* Aplicação web para fazer as recomendações de filmes

### O que eu preciso para executar a aplicação de recomendação ###

* [JDK 7](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk7-downloads-1880260.html)
* [MAVEN](https://maven.apache.org/download.cgi)
* [MySQLServer](https://dev.mysql.com/downloads/workbench/)
* [intellij](https://www.jetbrains.com/idea/download/)
* [Tomcat 7](https://tomcat.apache.org/download-70.cgi)
* [Google API](https://console.developers.google.com/apis)

### Por onde começar ###

1. Base de dados

O primeiro passo para executar a aplicação de recomendação é instalar o [MySQLServer](https://dev.mysql.com/downloads/workbench/), criar uma base de dados de nome movie_lens e rodar os scripts de carga que estão em MovieRecommender\etc\mysqlServer\carga .

2. Ambiente para desenvolvimento

Os projetos desse repositório foram desenvolvidos e testados utilizando o [intellij](https://www.jetbrains.com/idea/download/), mas qualquer IDE com suporte ao Tomcat7/8 pode executar a aplicação. Caso não utilize o intellij, recomendo utilizar o NetBeans, ele é bem simples e fácil de configurar.

A instalação e configuração do [Maven ](https://maven.apache.org/)também é importante, sem ele não será possível rodar nada. Você pode usar [esse](https://www.mkyong.com/maven/how-to-install-maven-in-windows/) tutorial para instalação e configuração do Maven.

3. API Google

Para fazer login na aplicação é necessário configurar o CLIENT_ID, o CLIENT_SECRET, e o CALLBACK_URI. Essas constantes estão na classe JAVA MovieRecommender\src\main\java\br\com\jonjts\tcc\moviesrecommender\oauth\GoogleAuthHelper.java. Para ter os dados dessas contantes, deve-se criar uma aplicação no seu [Google Console](https://console.developers.google.com), você pode ler mais sobre isso [aqui](https://developers.google.com/identity/sign-in/web/devconsole-project).

### The end ###

Pronto, após instalar e configurar tudo, abra a IDE que você escolheu, selecione o projeto \MovieRecommender e execute-o utilizando o seu Tomcat.

Caso queira, você pode ver a aplicação em ação [aqui](http://movies-jonjts.rhcloud.com/login.jsp).
