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

<script>
    function formatar(mascara, documento) {
        var i = documento.value.length;
        var saida = mascara.substring(0, 1);
        var texto = mascara.substring(i)

        if (texto.substring(0, 1) != saida) {
            documento.value += texto.substring(0, 1);
        }

    }

    function numeros(campo)
    {
        if (isNaN(campo.value.substring(campo.value.length - 1)))
            campo.value = campo.value.substr(0, campo.value.length - 1);
    }
</script>
<link href="assets/css/feed-style.css" rel="stylesheet">

<!-- P�gina com foto e as op��es do perfil -->
<%@include file="opcoes.jsp" %>

<!-- Script para dar destaque na op��o navegada -->
<script>
    $(document).ready(function () {
        $("#opPerfil").addClass("highlight");
    });
</script>


<div class="form-group col-md-9 menu-fixed-center">
    <form class="form-horizontal"  action="AnuncioServlet?action=ADDMATERIAL"  method="POST" role="form" enctype="multipart/form-data">
        <h2>Cadastro de An�ncio: Material</h2>
        <a href="escolhaAnuncio.jsp"><i class="fa fa-arrow-circle-left"></i> Voltar</a>
        <hr>
        <div>
            <label for="select" class=" control-label">Selecione a categoria de material</label>
            <c:set var="lista" value="${listaCatMaterial}"/>
            <select class="selectpicker form-control" name="select" id="select" required>
                <option value="" selected disabled>SELECIONE</option>
                <c:forEach var="lista" items="${lista}">
                    <option value="${lista.id}"> ${lista.descricao}</option>
                </c:forEach>
            </select>
        </div>

        <label for=titulo class="control-label">T�tulo:</label>
        <div >
            <input type="text" name="titulo" id="titulo" placeholder="" class="form-control" autofocus required> 
        </div>

        <label for="descricao" class="control-label">Descri��o:</label>
        <div >
            <textarea class="form-control" rows="5" id="descricao" name="descricao" required></textarea>
            <span class="help-block">Descreva seu an�ncio:</span>
        </div><br>

        <label for="valor" class="control-label">Pre�o:</label>
        <div>
            <input type="number" name="valor" id="valor" placeholder="" class="form-control" min="0" step="any" required>
            <span class="help-block">Insira um valor caso deseje:</span>
        </div>    

        <br><label for="rua" class="col-sm-3 control-label">Logradouro:</label>
        <div class="col-sm-9">
            <input type="text" name="rua" id="rua" placeholder="" class="form-control" autofocus required>
        </div>
        <br><label for="num" class="col-sm-3 control-label">N�mero:</label>
        <div class="col-sm-2">
            <input type="number" name="num" id="num" placeholder="" class="form-control" autofocus required>
        </div>
        <br><label for="cep" class="col-sm-3 control-label">CEP:</label>
        <div class="col-sm-9">
            <input type="text" name="cep" id="cep" maxlength="9" placeholder="" class="form-control" onkeyup="numeros(this)" OnKeyPress="formatar('#####-###', this)" required>
        </div>
        <br><label for="cidade" class="col-sm-3 control-label">Cidade:</label>
        <div class="col-sm-9">
            <input type="text" name="cidade" id="cidade" placeholder="" class="form-control" autofocus required>
        </div>
        <br><label for="estado" class="col-sm-3 control-label">Estado:</label>
        <div class="col-sm-2">
            <input type="text" name="estado" id="estado" maxlength="2" placeholder="" class="form-control" autofocus required>
        </div>
        <br><label for="comple" class="col-sm-3 control-label">Complemento:</label>
        <div class="col-sm-9">
            <input type="text" name="comple" id="comple" placeholder="" class="form-control" autofocus>
        </div>

        <br><label for="file" class="control-label">Selecione uma imagem</label>
        <div >
            <input type="file" name="file" id="file" placeholder="" class="form-control" autofocus required>
        </div>

        <div class="form-group" id="1" style="display:none;">
            <label for="file" class="col-sm-3 control-label"></label> 
            <div>
                <input type="file" name="file"  placeholder="" class="form-control" autofocus >
            </div>
        </div>
        <div class="form-group" id="2" style="display:none;">
            <label for="file" class="col-sm-3 control-label"></label> 
            <div >
                <input type="file" name="file"  placeholder="" class="form-control" autofocus >
            </div>
        </div>
        <div class="form-group" id="3" style="display:none;">
            <label for="file" class="col-sm-3 control-label"></label> 
            <div >
                <input type="file" name="file"  placeholder="" class="form-control" autofocus >
            </div>
        </div>
        <div class="form-group" id="4" style="display:none;">
            <label for="file" class="col-sm-3 control-label"></label> 
            <div >
                <input type="file" name="file"  placeholder="" class="form-control" autofocus >
            </div>
        </div>
        <script>
            i = 1;
            function myFunction() {
                var x = document.getElementById(i);
                x.style.display = 'inline'
                i++;
            }
        </script>

        <label for="file" class="control-label"></label>
        <div >
            <button type="button" name="button" id="button" class="btn btn-block btn-dark" onclick="myFunction()">Adicionar Imagem</button>
        </div>
        <div class="col-sm-offset-3">
            <br><button type="submit" class="btn btn-primary btn-block">Cadastrar</button>
        </div>
        <div>
            <br><a href="home.jsp" class="btn btn-primary btn-block" role="button">Cancelar</a>
        </div>

        <br><br><br>
    </form>   <!-- /form -->
</div>
<!-- Rodap� -->
</div>
</div>
</body>
</html>
