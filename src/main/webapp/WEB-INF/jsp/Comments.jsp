<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Comments</title>

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

	<div class="row">

		<!--############################################################################-->
		<!-------------------- Main Content --------------------------------------------->
		<div class="col-md-8 col-md-offset-1" id="main-content">
			<h1 class="page-header">Your feedback</h1>
			<div class="well">
				<table class="table table-striped table-hover">
					<tr>
						<th>Name</th>
						<th>Artist</th>
						<th>Album</th>
						<th>Title</th>
						<th>Comment</th>
						<th>Rating</th>
						<th>Date</th>
						<th>Operation</th>
					</tr>

					<c:forEach items="${comments}" var="comment">
						<tr class="success">
							<td><a href="SongPage.html?trackid=${comment.track.id}">${comment.track.name }</a></td>
							<td><a
								href="artist.html?id=${comment.track.album.artist.id}">${comment.track.album.artist.name}</a></td>
							<td><a href="album.html?id=${comment.track.album.id}">${comment.track.album.name}</a></td>
							<td>${comment.title}</td>
							<td>${comment.comment}</td>
							<td><c:forEach begin="1" end="${comment.rating}"
									varStatus="loop">
									<img
										src="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/256/Actions-rating-icon.png"
										height="25" width="25">
								</c:forEach></td>
							<td><fmt:formatDate value="${comment.commentDate}" /></td>
							<td><a href="commentRemove.html?id=${comment.id}">Delete</a>
						</tr>
					</c:forEach>
				</table>
				<br /> <a href="userPage.html"> <i
					class="fa fa-chevron-circle-left"></i> &nbsp;&nbsp;&nbsp;Back to
					User Profile
				</a>
			</div>
		</div>
	</div>
	<!-------------------- Main Content --------------------------------------------->

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