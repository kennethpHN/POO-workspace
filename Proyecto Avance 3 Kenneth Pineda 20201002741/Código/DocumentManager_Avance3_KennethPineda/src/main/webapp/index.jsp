<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="kenneth.pineda@unah.hn">
<meta name="version" content="0.1.3">
<meta name="date" content="2022-12-05">
<title>Sistema de Registro de Documentos</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link href="assets/css/styles.css" rel="stylesheet">


</head>
<body>

	<div class="modal fade" id="infoModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Entrada de documento de tipo X #1: correo@ejemplo.com</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed luctus,
						 augue ultrices faucibus rhoncus, turpis dolor iaculis erat, a rhoncus quam tellus sed dolor. 
						 Nulla placerat sit amet leo et elementum. Nunc auctor est eget maximus gravida. Phasellus interdum 
						 faucibus tincidunt. Sed at mi hendrerit, finibus turpis sit amet, tincidunt tortor. Morbi nisi dui, 
						 pretium a nisi sodales, consequat accumsan dui. In quis eros cursus, euismod quam vel, pellentesque nibh. 
						 Vestibulum elementum felis justo, in vestibulum tellus interdum luctus.

					</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn clmodal-btn"
						data-bs-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="authorModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
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
					<p>Versión: 0.1.3</p>
					<p>Esta aplicación web nos permite visualizar un registro de documentos en el sistema.
					<br />
					en la barra de navegación existen 2 botones: <b>Inicio</b> y <b>Acerca de</b>, en Inicio podemos
					elegir entre Agregar/Extraer un documento y limpiar el registro de datos.
					<br />
					En las ventanas del lateral izquierdo se visualiza información variada de los documentos registrados. 					<br />
					En la ventana del lateral derecho se puede visualizar la lista de documentos junto a un botón para ver
					su descripción.
					
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn clmodal-btn"
						data-bs-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="addDocModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
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
								<label for="emailInput" class="form-label">Correo Electrónico</label>
								<input type="email" class="form-control" id="emailInput" placeholder="nombre@correo.com" name="emailInput">
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
								<label for="operationCode" class="form-label">Entrada o
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
									<textarea class="form-control" id="informationInput" name="informationInput" maxlength="5000"
										rows="3"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn clmodal-btn"
						data-bs-dismiss="modal">Cerrar</button>
					<button type="button" class="btn savemodal-btn" id="send-doc-btn">Guardar
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
						Desea limpiar el registro?</b>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn clmodal-btn"
						data-bs-dismiss="modal">Cancelar</button>
					<button type="button" class="btn savemodal-btn" data-bs-dismiss="modal">Aceptar</button>
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
							<h1>5</h1>
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
				<div class="h-75 doc-list-card card">
					<div class="card-header">Documentos Registrados</div>
					<ul class="list-group list-group-flush overflow-auto" id="docList">
						<li class="list-document-item list-group-item">
						<h4>1. Documento - Revista</h4>
						<div class="row">
							<div class="col"><p>Responsable:</p></div>
							<div class="col"><p>correo@ejemplo.com</p></div>
							<div class="col" id="documentCodeDescriptor" data-name="documentCode" data-code="1"><button class="btn clmodal-btn" id="infoModalWindow">Ver Descripción</button></div>
						</div>
						</li>
					</ul>
				</div>

			</div>
		</div>

	</div>
	<script src="assets/js/Action.js"></script>
	<script src="assets/js/Validator.js"></script>
	<script src="assets/js/DynamicForm.js"></script>
	<script src="assets/js/Main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>