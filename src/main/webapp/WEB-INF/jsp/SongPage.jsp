<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Song</title>

<!--##################################################### -->
<!--------------------- Styling ---------------------------->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="Content/footer-distributed-with-address-and-phones.css"
	rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
<link href="Content/add_styling.css" rel="stylesheet" />
<link href="Content/animate.css" rel="stylesheet" />
<link href="Content/jquery.rating.css" rel="stylesheet" />
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

	<!--SideBar and MAIN CONTENT -->
	<section class="row">
		<div class="col-md-8 col-md-offset-1" id="main-content">
			<!-- track info field -->
			<article class="row">
				<div class="modal fade" id="videoModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<iframe width="100%" height="480px"
									src="https://www.youtube.com/embed/nfWlot6h_JM"></iframe>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<h1 class="page-header">${track.name}</h1>
					<div class="well">
						<img class="song-img" title="name" src="${track.album.imgSrc}" />
						<h3>Genre</h3>
						<a href="genre.html?genre=${track.album.genre }">${track.album.genre}<br /></a>
						<h3>Album</h3>
						<a href="album.html?id=${track.album.id }">${track.album.name}<br /></a>
						<h3>Artist</h3>
						<a href="artist.html?id=${track.album.artist.id }">${track.album.artist.name}<br /></a>
						<br />
						<form action="download.html" method="get">
							<input type="hidden" id="trackid" name="trackid"
								value="${track.id}" /><a class="btn btn-primary" href="#"
								data-toggle="modal" data-target="#videoModal">Preview </a>&nbsp;&nbsp;
							<input type="submit" class="btn btn-success" name="buttonpressed"
								value="Download" /> &nbsp;&nbsp; <input id="playlist"
								type="button" class="btn btn-info" name="buttonpressed"
								value="Playlist" />
						</form>
						<br /> <b><i id="status-msg"></i></b>
					</div>
				</div>
			</article>

			<!-- lyric field -->
			<ul class="nav nav-tabs">
				<li><a href="#lyric" data-toggle="tab">Lyrics</a></li>
				<li><a href="#reviews" data-toggle="tab">User Reviews</a></li>
				<li><a href="#write-review" data-toggle="tab">Write a
						Review</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade active in" id="lyric">
					<div class="row">
						<div class="col-md-8">
							<h2 class="page-header">Know the Words</h2>
							<div class="well">
								<form class="form-horiztonal">
									<fieldset>
										<i><p id="currentLyrics">${track.lyric.trackLyric }</p></i>
										<div class="row">
											<div class="form-group">
												<h6>
													&nbsp;&nbsp;&nbsp;&nbsp;<b><i>Last Upload Date: <fmt:formatDate
																value="${track.lyric.lyricDate}" pattern="M/d/yyyy" />
													</i></b>
												</h6>

												<div class="col-md-12">
													<textarea class="form-control" rows="7" id="lyrics"
														name="lyrics"></textarea>
												</div>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="form-group">
												&nbsp;&nbsp;&nbsp;&nbsp; <input id="lyric-edit"
													type="button" class="btn btn-success" value="Submit Edit" />&nbsp;&nbsp;<input
													id="cancel" type="button" class="btn btn-danger"
													value="Cancel" />
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- current track reviews field -->
				<div class="tab-pane fade" id="reviews">
					<div class="row">
						<div class="col-md-8 cols">
							<h2 class="page-header">See What Others Have to Say</h2>
							<div class="well">
								<c:choose>
									<c:when test="${not empty reviews}">
										<c:forEach items="${reviews}" var="review">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title">
														<h6>
															<i class="fa fa-user-plus"></i>&nbsp;&nbsp;User ID:
															${review.user.id}
														</h6>
													</h3>
												</div>
												<div class="panel-body">

													Review Date:
													<fmt:formatDate value="${review.commentDate}"
														pattern="M/d/yyyy" />
													<br /> Rating:&nbsp;&nbsp;
													<c:forEach begin="1" end="${review.rating}"
														varStatus="loop">
														<img
															src="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/256/Actions-rating-icon.png"
															height="17" width="17">
													</c:forEach>
													<br /> <br /> <b><i>"${review.title}"</i></b>
													<p>${review.comment}</p>
												</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<h4>
											<i>There are no reviews yet. Be the first to review this
												track.</i>
										</h4>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>

				<!-- write review for current track field -->
				<div class="tab-pane fade" id="write-review">
					<div class="row">
						<div class="col-md-8 cols">
							<h2 class="page-header">Share your Experience</h2>
							<div class="well">

								<!-- form begin here -->
								<form class="form-horizontal" action="commentAdd.html"
									method="post" style="margin-left: -50px;">
									<input type="hidden" name="trackid" value="${track.id}">
									<fieldset>

										<!-- comment title input -->
										<div class="form-group">
											<label for="reviewTitle" class="col-lg-2 control-label">Title</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="reviewTitle"
													name="reviewTitle" placeholder="Title">
											</div>
										</div>

										<!-- comment comment(body) input -->
										<div class="form-group">
											<label for="reviewBody" class="col-lg-2 control-label">Review</label>
											<div class="col-lg-10">
												<textarea class="form-control" rows="7" id="reviewBody"
													name="reviewBody"></textarea>
											</div>
										</div>

										<!-- comment rating input -->
										<div class="form-group">
											<label class="col-lg-2 control-label">Rating</label>
											<div class="col-lg-5">
												<div class="radio">
													<input type="radio" name="rating" id="optionsRadios2"
														value="1" class="star" checked="checked"> <input type="radio"
														name="rating" id="optionsRadios2" value="2" class="star">
													<input type="radio" name="rating" id="optionsRadios2"
														value="3" class="star"> <input type="radio"
														name="rating" id="optionsRadios2" value="4" class="star">
													<input type="radio" name="rating" id="optionsRadios2"
														value="5" class="star">
												</div>
											</div>
										</div>

										<!-- comment form submit -->
										<div class="form-group">
											<div class="col-lg-10 col-lg-offset-2">
												<button type="submit" class="btn btn-success">Submit</button>
												&nbsp;
												<button type="reset" class="btn btn-danger">Cancel</button>
											</div>
										</div>

									</fieldset>
								</form>
								<!-- form end -->
							</div>
						</div>
					</div>
				</div>
				<!-- -------------------------- write review end -------------------------- -->
			</div>
		</div>
	</section>

	<!--##############################-->
	<!----------- Footer --------------->
	<jsp:include page="MasterFooter.jsp" />
	<!----------- Footer --------------->

	<!--#################################################-->
	<!---------- JAVASCRIPT ------------------------------->
	<script src="Scripts/jquery-1.10.2.min.js"></script>
	<script src="Scripts/jquery.rating.js"></script>
	<script src="Scripts/bootstrap.min.js"></script>

	<script>
		var trackIdInput = $('#trackid').val();
		var lyricsInput = $('#lyrics').val();
		var currentLyrics = $('#currentLyrics').html();

		$('#lyrics').val($("#currentLyrics").html());

		$(document).ready(function() {
			$('#lyric-edit').click(function(event) {

				var lyricsInput = $('#lyrics').val();

				$.post('lyricEdit.html', {
					trackid : trackIdInput,
					lyrics : lyricsInput
				}, function(responseText) {
					$("#currentLyrics").html(lyricsInput);
					currentLyrics = lyricsInput;
				});
			});

			$('#playlist').click(function(event) {

				$.post('playlistAdd.html', {
					trackid : trackIdInput
				}, function(responseText) {
					$('#status-msg').text("Added to playlist.");
					setTimeout(function() {
						$("#status-msg").empty();
					}, 2000);
				});
			});

			$('#cancel').click(function(event) {
				$("#lyrics").val(currentLyrics);
			});
		});
	</script>
	<!---------- JAVASCRIPT ------------------------------->

</body>
</html>