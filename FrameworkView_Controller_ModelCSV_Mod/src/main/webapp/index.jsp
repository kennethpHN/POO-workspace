<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="jose.inestroza@unah.edu.hn">
		<meta name="version" content="0.1.0">
		<title>Views</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	</head>
	<body class="bg-dark">
		<div class="text-white">
			<div>
				<ul class="nav text-center justify-content-center">
					<li class="nav-item bg-white"><a class="nav-link active" aria-current="page" href="#">Inicio</a></li>
					<li class="nav-item bg-white"><a class="nav-link active" href="#">Caracteristicas</a></li>
				</ul>
			</div>
			<div class="container">
				<h2>Formulario de Registro</h2>
				<p>Bienvenido estimado estudiante. Favor completar el siguiente formulario para realizar un registro de datos en el sis</p>
				
				<div class="row p-1">
					<div class="col-10">
						<div class="row p-2">
							<div class="col-2">
							    <label for="email" class="form-label">Correo Electronico</label>
							</div>
							<div class="col"> <!-- O tambien podria ponerse "col-10"> -->
								<input id="email" type="email" class="form-control" placeholder="Correo Electronico">
							</div>
						</div>
						<div class="row p-2">
							<div class="col-2">
							    <label for="description" class="form-label">Descripcion</label>
							</div>
							<div class="col"> <!-- O tambien podria ponerse "col-10" -->
								<input id="description" type="text" class="form-control" placeholder="Descripcion">
							</div>
						</div>					
						<div class="row p-2">
							<div class="col-2">
							    
							</div>
							<div class="col"> <!-- O tambien podria ponerse "col-10" -->
								<input id="sendButton" type="button" class="btn btn-primary form-control" value="ENVIAR">
							</div>
						</div>
						<div id="response" class="row p-2">
							
						</div>
					</div>
						
					<div class="col-2">
						<div class="card text-dark">
							<div class="card-header">Inscripcion</div>
							<div class="card-body">
								<h5 class="card-title">Formulario de Registro</h5>
								<p class="card-text">Usando un correo y una descripcion registrese completando toda la
								informacion necesaria.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="assets/js/Validator.js"></script>
	<script src="assets/js/Action.js"></script>
	<script src="assets/js/main.js"></script>
	</body>
</html>