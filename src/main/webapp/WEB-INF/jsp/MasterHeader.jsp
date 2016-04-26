<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<!-- ####################################################### -->
	<!-- ------- Contact Us Special Form (part of NAV bar) ----- -->
	<div class="modal fade" id="contactModal" role="dialog">
		<div class="modal-dialog modal-content">
			<div class="modal-header">
				<h3>We're here for you. Email us today.</h3>
			</div>

			<div class="modal-body">
				<form action="home.html" class="form-horizontal" method="post">
					<input type="hidden" name="userId" value="${sessionUser.id}" />
					<fieldset>
						<div class="form-group">
							<label for="email" class="col-md-2">Email</label>
							<div class="col-md-7">
								<input type="text" class="form-control" id="email" name="email" />
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-md-2">Title</label>
							<div class="col-md-10">
								<input type="text" class="form-control" id="topic" />
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-md-2">Body</label>
							<div class="col-md-10">
								<textarea rows="5" class="form-control" id="emailBody"></textarea>
							</div>
						</div>
					</fieldset>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<input type="submit" class="btn btn-primary" value="Submit Email"
					data-dismiss="modal" />
			</div>

		</div>
	</div>
	<!-- ----------------------------------------------------------- -->


	<!-- ############################################### -->
	<!-- ----------------- Rest Of NAV Bar ------------- -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
					<span class="sr-only">Toggle navigation</span>
				</button>
				<a class="navbar-brand" href="home.html"><i class="fa fa-music"></i>&nbsp;&nbsp;&nbsp;Freebie
					Music Store</a>
			</div>

			<div class="navbar-collapse collapse in"
				id="bs-example-navbar-collapse-1" aria-expanded="true" style="">
				<ul class="nav navbar-nav">
					<li><a href="home.html">Home <span class="sr-only">(current)</span></a></li>
					<li><a href="about.html">About</a></li>

					<li><a href="#" data-toggle="modal"
						data-target="#contactModal">Contact Us</a></li>
				</ul>

				<form method="post" action="home.html"
					class="navbar-form navbar-left" role="search">
					<div class="form-group" id="search-box">
						<input type="text" id="search-box" class="form-control"
							name="searchBar" placeholder="Get your free music" />
					</div>
					<button type="submit" class="btn btn-default" id="search-btn">
						<i class="fa fa-search"></i>&nbsp;&nbsp;Search
					</button>
				</form>

				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${not empty sessionUser.firstName}">
							<li><a href="userPage.html"><i class="fa fa-github-alt"></i>&nbsp;&nbsp;&nbsp;
									Welcome, ${sessionUser.email}</a></li>
							<li><a href="logout.html"><i class="fa fa-github-square"></i>&nbsp;&nbsp;&nbsp;Logout</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="register.html"><i class="fa fa-github-alt"></i>&nbsp;&nbsp;&nbsp;Register</a></li>
							<li><a href="login.html"><i class="fa fa-github-square"></i>&nbsp;&nbsp;&nbsp;Login</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<!-- ------------------------------------------------------ -->
</header>
