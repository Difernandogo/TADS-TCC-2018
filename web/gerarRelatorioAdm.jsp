<%-- 
    Document   : cadastrar
    Created on : 25/03/2018, 18:55:52
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
        $("#opEstAdm").addClass("highlight");
    });
</script>

<c:if test="${user.getTipoUsuario()== 3}">
    <div class="col-md-9 col-sm-9 col-xs-9 col-lg-9">
        <form id="formulario" class="form-horizontal" role="form">
            <h2>Estat�sticas de todos os an�ncios do Mercad�o do Aluno.</h2>
            <a href="home.jsp"><i class="fa fa-arrow-circle-left"></i> Voltar</a>
            <hr>    
            </form>
        
                <div class="form-group">
                <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=TodosAdm"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">Todos os an�ncios</button>
            </div>
      </form> <!-- ./form -->
      <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=AprovadosAdm"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">An�ncios Aprovados</button>
            </div>
      </form> <!-- ./form -->
      <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=PendentesAdm"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">An�ncios Pendentes</button>
            </div>
      </form> <!-- ./form -->
            <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=RejeitadosAdm"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">An�ncios Negados</button>
            </div>
      </form> <!-- ./form -->
                  <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=VendidosAdm"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">Itens Vendidos</button>
            </div>
      </form> <!-- ./form -->
 </div>
        
        
        
        
    </div>
    <script type="text/javascript" src="assets\js\validarTrocaSenha.js"></script>
</c:if>

</div> <!-- fim .col-lg-6 -->
</div> <!-- ./row -->
</div> <!-- ./container -->
</body>
</html>   
