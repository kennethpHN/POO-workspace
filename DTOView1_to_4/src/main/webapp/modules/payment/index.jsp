<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="jose.inestroza@unah.edu.hn">
		<meta name="version" content="0.1.0">
		<title>DTO</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
		
		<style type="text/css">
			#box{
				height: 100vh;	
			}		
		</style>	
	</head>
	<body>		
		<div class="container">
			<div id="box" class="d-flex justify-content-center">
				<div class="align-self-center">
					<h1 class="display-1">1. Seleccione un servicio</h1>
					<p>Seleccione un servicio de la lista siguiente:</p>
					<select id="serviceCode" name="serviceCode" class="form-control">
						<option value="1">Matricula</option>
						<option value="2">Reposicion</option>
						<option value="3">Cambio de Carrera</option>
					</select>
					<div class="row mt-2">
						<div class="col-6"><a href="../../" class="btn btn-danger form-control">Cancelar</a></div>
						<div class="col-6"><button id="nextButton" class="btn btn-success form-control">Siguiente</button></div>			
					</div>
				</div>			
			</div>			
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>	
		
		<script src="assets/js/DynamicForm.js" type="text/javascript"></script>
		<script src="assets/js/Validator.js" type="text/javascript"></script>
		<script type="text/javascript">
			let method="POST";
			let controller="controllers/setService.jsp";	//este es el action destino
			let successRedirect="amount.jsp";
			let failRedirect="fail.jsp";
			let df=new DynamicForm(method,controller,successRedirect,failRedirect);
		
			let nextButton=document.querySelector("button#nextButton");
			nextButton.addEventListener("click", df.send.bind(df));
		</script>
	</body>
</html>