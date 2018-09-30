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

<!-- Script para dar destaque na op��o navegada -->
<script>  
    $(document).ready(function () {
  $("#opAmigo").addClass("highlight");
});
</script>

<div class="col-8 menu-fixed-center">
    <div class="panel panel-body">             
        <!-- Usu�rio Comum -->
        <c:if test="${user.getTipoUsuario()== 2}">
            <div class="col-sm-12">
                <h2>Solicita��es de Amizade: </h2>
                <a href="escolhaAmigo.jsp"><i class="fa fa-arrow-circle-left"></i> Voltar</a>
                <hr>
            </div>

            <div class="col-sm-12 list-inline">
                <img class="list-inline-item " src="img\icones\add-friend.png">
                <img class="list-inline-item" src="img\icones\add-frid.png">
                <img class="list-inline-item" src="img\icones\frien.png">

                <hr>
            </div>
            <div class="jumbotron col-sm-12" >
                <c:set var="listaPendentes" value="${amigosPendentes}"/>   
                <c:choose> 
                    <c:when test="${not empty listaPendentes}">
                        <c:forEach var="listaPendentes" items="${amigosPendentes}">                                               
                            <div class="card">   

                                <div class="card-body">
                                    <div class="d-inline-block">
                                        <img src="${listaPendentes.foto}"  class="img-thumbnail" width="50" height="50">
                                    </div>
                                    <div class="d-inline-block">
                                        <h5 class="card-title center">${listaPendentes.nome}</h5>
                                    </div>
                                    <div>
                                        <a href="UserServlet?action=PERFIL&idUser=${listaPendentes.id}" class="btn btn-outline-dark">Ver perfil</a> 
                                        <a href="UserServlet?action=AMIZADE&idSolicitante=${user.getId()}&idSolicitado=${listaPendentes.id}&acao=ACEITAR" class="btn btn-outline-dark">Aceitar Amizade</a>
                                        <a href="UserServlet?action=AMIZADE&acao=REJEITAR&idSessao=${user.getId()}&idSolicitante=${listaPendentes.id}" class="btn btn-outline-dark">Rejeitar</a> 
                                        <a href="UserServlet?action=AMIZADE&acao=REJEITAREBLOQUEAR&idSessao=${user.getId()}&idSolicitante=${listaPendentes.id}" class="btn btn-outline-dark">Rejeitar & Bloquear</a> 
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="card">   
                            <div class="card-body">
                                <h4 class="card-title">Voc� n�o tem solicita��es de amizade ):</h4>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>                                  
            </c:if>    
        </div>
    </div> <!-- fim .col-lg-6 -->
</div> <!-- ./row -->
</div> <!-- ./container -->
</body>
</html>
