<%-- 
    Document   : editarPerfil
    Created on : 09/07/2018, 19:39:31
    Author     : onurb
--%>

<%@include file="head.jsp" %>
<c:if test="${(empty(user))}">
    <c:set var="msg" value="Fa�a login para acessar esta p�gina!" scope="request"/>
    <c:redirect url="index.jsp" />
</c:if>

<link href="assets/css/feed-style.css" rel="stylesheet">

<!-- P�gina com foto e as op��es do perfil -->
<%@include file="opcoes.jsp" %>

<!-- Script para dar destaque na op��o navegada -->
<script>
    $(document).ready(function () {
        $("#opAprovMod").addClass("highlight");
    });
</script>

<div class="col-6 menu-fixed-center">
    <!-- Mensagema  ser exibida no titulo de acordo com a a��o -->
    <h2>${mensagemAcao}</h2>
    <hr>
    <!-- De acordo com o tipo de mensagem ser�o mostrados diferentes links de ''voltar'' -->
    <!-- 1 = amizade -->
    <c:if test="${mensagemAcaoTipo == 1}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="escolhaAmigo.jsp">Voltar para as op��es de Amizade</a>
    </c:if>
    <!-- 2 = cadastro de mod -->
    <c:if test="${mensagemAcaoTipo == 2}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="cadastrarModerador.jsp">Cadastrar mais um Moderador</a>
    </c:if>
    <!-- 3 = cadastro de mod -->
    <c:if test="${mensagemAcaoTipo == 3}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="cadastrarAdm.jsp">Cadastrar mais um Administrador</a>
    </c:if>
    <!-- 4 = troca de senha -->
    <c:if test="${mensagemAcaoTipo == 4}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="escolhaPreferencias.jsp">Voltar para as Prefer�ncias</a>
    </c:if>
    <!-- 5 = Cadasrto de �movel -->
    <c:if test="${mensagemAcaoTipo == 5}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="cadastroImovel.jsp">Cadastrar mais um Imovel</a>
    </c:if>
    <!-- 6 = Cadasrto de Movel -->
    <c:if test="${mensagemAcaoTipo == 6}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="cadastroMovel.jsp">Cadastrar mais um Movel</a>
    </c:if>
    <!-- 7 = Cadasrto de Material -->
    <c:if test="${mensagemAcaoTipo == 7}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="cadastroMaterial.jsp">Cadastrar mais um Material</a>
    </c:if>
    <!-- 8 = aprovar ou rejeitar an�ncios -->
    <c:if test="${mensagemAcaoTipo == 8}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="escolhaPendente.jsp">Ir para op��es de an�ncios</a>
    </c:if>
    <!-- 9 = excluir alterar an�ncio -->
    <c:if test="${mensagemAcaoTipo == 9}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="escolhaMeusAnuncios.jsp">Ir para op��es dos seus an�ncios</a>
    </c:if>
    <!-- 10 = notifica��o -->
    <c:if test="${mensagemAcaoTipo == 10}">
        <a href="home.jsp">Voltar para o Home</a> ou <a href="notificacoes.jsp">voltar paraNotifica��es</a>
    </c:if>
    
    <div class="panel panel-body">
        <div class="container">
            <div class="jumbotron">
                <hr>
                <div class="col-6">
                    <img src="img\logos\logo400.jpg">
                </div>
                <hr>
            </div>    
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>
