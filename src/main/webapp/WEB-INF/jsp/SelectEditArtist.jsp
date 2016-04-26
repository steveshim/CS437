<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Downloads</title>

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
	<!------------------------------------>


	<!-- ################################-->
	<!------------ Side Bar --------------->
	<jsp:include page="MasterSideBar.jsp" />
	<!------------------------------------->


	<!-- ############################################################################-->
	<!--------------------------  Main Content ---------------------------------------->

	<div class="row">
		<div class="form-group">
			<div class="col-md-6 col-md-offset-1">
				<h1 class="page-header">Welcome to the editor page!</h1>

				<div class="input-group">
					<span class="input-group-addon">Artist</span> <input
						class="form-control" type="text" id="search"
						placeholder="live search"></input>
				</div>

				<br />
				<table id="main-table" class="table table-hover table-striped">
					<tr>
						<th class="text-center">Artist</th>
						<th class="text-center">Albums</th>
						<th class="text-center">Operation</th>
					</tr>
					<c:forEach items="${artistList}" var="artist">
						<tr class="text-center">
							<td><a href="artist.html?id=${artist.id}">${artist.name}</a></td>
							<td>${fn:length(artist.albums)}</td>
							<td><a class="btn btn-xs"
								href="viewEditArtist.html?id=${artist.id}">Edit</a>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<!-- ---------------------------------------------------------------------------------- -->

	<!--##############################-->
	<!----------- FOOTER --------------->
	<jsp:include page="MasterFooter.jsp" />
	<!---------------------------------->

	<!--#################################################-->
	<!---------- JAVASCRIPT ------------------------------->
	<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script>
		$("#search").on("keyup", function() {
			var value = $(this).val().toUpperCase();
			$("#main-table tr").each(function(index) {
				if (index !== 0) {

					$row = $(this);
					var id = $row.find("td:first").text().toUpperCase();

					if (id.indexOf(value) !== 0) {
						$row.hide();
					} else {
						$row.show();
					}
				}
			});
		});
	</script>
	<script>
		$(function() {
			$('#search_input').fastLiveFilter('#search_list');
		});
	</script>
	<!--------------------------------------------------------->
</body>
</html>