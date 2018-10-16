<%-- 
    Document   : aprovarAnuncio
    Created on : 05/05/2018, 15:28:04
    Author     : onurb
--%>
<!-- Cabe�alho -->
<%@include file="head.jsp" %>
<c:if test="${(empty(user))}">
    <c:redirect url="index.jsp">
        <c:param name="msg" value="Fa�a login para acessar esta p�gina!"></c:param>
    </c:redirect>
</c:if>

<link href="assets/css/feed-style.css" rel="stylesheet">

<!-- P�gina com foto e as op��es do perfil -->
<%@include file="opcoes.jsp" %>
<c:if test="${user != null}">
            <script src="assets\js\notificacaoPagina.js" type="text/javascript"></script>
        </c:if> 

<input name="idOculta" type="text" value="${user.getId()}" hidden>
<div class="col-8 menu-fixed-center">
    <div class="panel panel-body">             
        <!-- Usu�rio Comum -->
       
            <div class="col-sm-12">
                <h2>Suas notifica��es </h2>
                <a href="home.jsp"><i class="fa fa-arrow-circle-left"></i> Voltar</a>
                
                <hr>
            </div>

            <div class="col-sm-12 list-inline">
                <img class="list-inline-item " src="img\icones\attention.png">
                <img class="list-inline-item" src="img\icones\bell.png">
                <img class="list-inline-item" src="img\icones\newsletter.png">

                <hr>
                <a href="NotificacaoServlet?action=EXCLUIRTODAS" class="btn btn-outline-dark">Excluir todas as notifica��es</a>
            </div>

            <div id="notibody" class="jumbotron col-sm-12" >
                
               
            </div>
        </div> <!-- fim .col-lg-6 -->
    </div> <!-- ./row -->
</div> <!-- ./container -->
</body>
</html>


