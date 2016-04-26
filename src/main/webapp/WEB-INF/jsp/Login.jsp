<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Login</title>

<!--##################################################### -->
<!--------------------- Styling ---------------------------->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="Content/footer-distributed-with-address-and-phones.css"
	rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
<link href="Content/add_styling.css" rel="stylesheet" />
<link href="Content/animate.css" rel="stylesheet" />
<!--------------------- Styling ---------------------------->

</head>
<body class="container-fluid">

	<!-- ############################### -->
	<!------------ Page Header ----------->
	<jsp:include page="MasterHeader.jsp" />
	<!------------ Page Header ----------->

	<!-- ################################-->
	<!------------ Side Bar --------------->
	<jsp:include page="MasterSideBar.jsp" />
	<!------------ Side Bar --------------->

	<section class="row">
	
			<!-- MAIN CONTENT DIV -->
			<div class="col-md-6 col-md-offset-2" id="main-content">
						<div class="animated bounceInDown">
							<h1>
								<br /> <br />
							</h1>
							<div class="well text-center">
								<h1>Login</h1>
								<hr />
								<p class="lead">Earn points and access free music.</p>
								<form:form modelAttribute="user">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-user"></i>
											</div>
											<form:input class="form-control" type="text" path="email"
												placeholder="Enter your email" />
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-lock"></i>
											</div>
											<form:input class="form-control" type="text" path="password"
												placeholder="Enter your password" />
										</div>
									</div>
									<input type="submit" class="btn btn-info btn-block btn-md"
										value="Login" />
									<br />
									<!-- TESTING START button so we don't have to log in each time. -->
									<a href="loginZoe.html" class="btn btn-success btn-block">Login as Zoe (Demo)</a>
                                    <a href="loginHomer.html" class="btn btn-success btn-block">Login as Homer (Demo)</a>
									<!-- TESTING END -->
								</form:form>
							</div>
						</div>
					</div>
			<!-------------------- Main Content --------------------------------------------->
	</section>

	<!--##############################-->
	<!----------- Footer --------------->
	<jsp:include page="MasterFooter.jsp" />
	<!----------- Footer --------------->

	<!--#################################################-->
	<!---------- JAVASCRIPT ------------------------------->
	<script src="Scripts/jquery-1.10.2.min.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>
	<!---------- JAVASCRIPT ------------------------------->

</body>
</html>