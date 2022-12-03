<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="kenneth.pineda@unah.hn">
<meta name="version" content="0.1.0">
<meta name="date" content="2022-11-30">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link href="assets/css/styles.css" rel="stylesheet">


</head>
<body>

	<div class="modal fade" id="authorModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Acerca de</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						Sistema de Registro de Documentos creado por <b>Kenneth Pineda</b>
					</p>
					<p>Contacto: kenneth.pineda@unah.hn</p>
					<p>Versión: 0.1.0</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn clmodal-btn"
						data-bs-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="addDocModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Añadir documento</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Añadir documento</p>
					<div class="col">
						<div class="row">
							<div class="mb-3">
								<label for="emailInput" class="form-label">Correo
									Electrónico</label> <input type="email" class="form-control"
									id="emailInput" placeholder="nombre@correo.com">
							</div>
						</div>

						<div class="row">
							<div class="mb-3">
								<label for="documentCode" class="form-label">Tipo de
									Documento</label><select id="documentCode" name="documentCode"
									class="form-control">
									<option value="1">Revista</option>
									<option value="2">Libro</option>
									<option value="3">Texto Plano</option>
									<option value="4">Imagen</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="mb-3">
								<label for="documentCode" class="form-label">Entrada o
									Retiro</label><select id="operationCode" name="operationCode"
									class="form-control">
									<option value="1">Entrada</option>
									<option value="2">Retiro</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="mb-3">
								<div class="mb-3">
									<label for="informationInput" class="form-label">Información
										de Registro</label>
									<textarea class="form-control" id="informationInput" maxlength="5"
										rows="3"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn clmodal-btn"
						data-bs-dismiss="modal">Cerrar</button>
					<button type="button" class="btn savemodal-btn">Guardar
						cambios</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="clearListModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Limpiar registro</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						Limpiar registro</b>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn clmodal-btn"
						data-bs-dismiss="modal">Cerrar</button>
					<button type="button" class="btn savemodal-btn">Guardar
						cambios</button>
				</div>
			</div>
		</div>
	</div>






	<div class="container" style="max-width: 100vw">

		<div>

			<ul class="nav bg-light">
				<li class="nav-item active"><a class="nav-link text-dark"
					href="#">Doc Registry - Kenneth Pineda</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-muted" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown">Inicio</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><button class="dropdown-item" id="addDocModalWindow">Agregar/Extraer
								un Documento</button></li>
						<li><button class="dropdown-item" id="clearListModalWindow">Limpiar
								Modelo de Datos</button></li>
					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-muted" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown">Acerca
						de</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><button class="dropdown-item" id="authorModalWindow">Autor</button></li>
					</ul></li>
			</ul>

		</div>

		<div class="row p-2 mx-2">

			<div class="col">

				<div class="col ">
					<div class="info-card card text-center">
						<div class="card-header">Total de Documentos</div>
						<div class="card-body">
							<p class="card-text">
							<h1>1</h1>
							</p>
						</div>
					</div>
				</div>

				<div class="col mt-3">
					<div class="info-card card">
						<div class="card-header">Información</div>
						<div class="card-body mx-3">
							<p class="card-text">Información del Registro</p>
							<div class="col m-2">
								<div class="col">
									<div class="row">
										<div class="doc-info col border-0 rounded-3 mb-2 py-2">Documentos
											de tipo</div>
									</div>
									<div class="row">
										<div class="doc-info2 col border-0 rounded-3 py-2 mb-2">Documentos
											de tipo</div>
									</div>
									<div class="row">
										<div class="doc-info col border-0 rounded-3 py-2 mb-2">Documentos
											de tipo</div>
									</div>
									<div class="row">
										<div class="doc-info2 col border-0 rounded-3 py-2 mb-2">Documentos
											de tipo</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-9">

				<div class="h-50 doc-list-card card">
					<div class="card-header">Documentos Registrados</div>
					<ul class="list-group list-group-flush overflow-auto">
						<li class="list-document-item list-group-item">An item</li>
						<li class="list-document-item list-group-item">An item</li>
						<li class="list-document-item list-group-item">An item</li>
						<li class="list-document-item list-group-item">An item</li>
						<li class="list-document-item list-group-item">An item</li>

					</ul>
				</div>

			</div>
		</div>

	</div>
	<script src="assets/js/Action.js"></script>
	<script src="assets/js/Main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>