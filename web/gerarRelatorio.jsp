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
        $("#opEst").addClass("highlight");
    });
</script>

<c:if test="${user.getTipoUsuario()== 2}">
    <div class="col-md-9 col-sm-9 col-xs-9 col-lg-9">
        <form id="formulario" class="form-horizontal"  action="UserServlet?action=ALTSENHA"  method="POST" role="form">
            <h2>Gerar estat�sticas dos seus an�ncios.</h2>
            <a href="home.jsp"><i class="fa fa-arrow-circle-left"></i> Voltar</a>
            <hr>         
            <div class="col-sm-9 col-sm-offset-3">
                <a class="btn btn-outline-dark" href="#"> Gerar </a> 
            </div>          
            <hr>
        </form><!-- ./form -->
        
                        <div class="form-group">
                <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=TodosUser"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">Todos os an�ncios</button>
            </div>
      </form> <!-- ./form -->
      <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=AprovadosUser"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">An�ncios Aprovados</button>
            </div>
      </form> <!-- ./form -->
      <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=PendentesUser"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">An�ncios Pendentes</button>
            </div>
      </form> <!-- ./form -->
            <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=RejeitadosUser"  method="POST" role="form">
            <div class="col-sm-9 col-sm-offset-3">
                <button type="submit" style="width:200px" class="btn btn-outline-dark">An�ncios Negados</button>
            </div>
      </form> <!-- ./form -->
                  <form id="formulario" class="form-horizontal"  action="GeradorRelatorio?action=VendidosUser"  method="POST" role="form">
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