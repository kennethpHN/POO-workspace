<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="author" content="jose.inestroza@uamount.jspconfirm.jspnah.edu.hn">
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
					<h1 class="display-1">3. Confirme su pago</h1>
					<p>Confirma que desea realizar la transaccion?</p>
					<div class="row mt-2">
						<div class="col-6"><a href="../../" class="btn btn-danger form-control">Cancelar</a></div>
						<div class="col-6"><a href="success.jsp" class="btn btn-success form-control">Confirmar</a></div>						
					</div>
				</div>			
			</div>			
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>	
	</body>
</html>