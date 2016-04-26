<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<title>Freebie Music Store - Home</title>

<!--##################################################### -->
<!--------------------- Styling ---------------------------->
<link href="Content/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link href="Content/footer-distributed-with-address-and-phones.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
<link href="Content/add_styling.css" rel="stylesheet" />
<link href="Content/animate.css" rel="stylesheet" />
<!--------------------- Styling ---------------------------->

</head>
<body class="container-fluid">

   <!-- ############################### -->
   <!-- --------- NAV: HEADER --------- -->
   <jsp:include page="MasterHeader.jsp" />
   <!-- ------------------------------ -->


   <!-- ############################### -->
   <!-- --------- NAV: SIDE ----------- -->
   <jsp:include page="MasterSideBar.jsp" />
   <!-- ------------------------------- -->

   <!-- ################################################################################ -->
   <!-- -------------------------- MAIN CONTENT ---------------------------------------- -->
   <div class="row">
      <div class="col-md-offset-1 col-md-8 cols" id="main-content">
         <c:choose>
            <c:when test="${searchBar != null }">
               <!-- ###############################  -->
               <!-- ---------- SEARCH RESULTS ------ -->
               <jsp:include page="Search.jsp" />
               <!-- -------------------------------- -->
            </c:when>
            <c:otherwise>
               <!-- ############################################  -->
               <!-- ------------ FEATURED TRACKS ---------------- -->
               <section class="col-md-12" id="featured-songs">
                  <h1 class="page-header">FEATURED TRACKS</h1>
                  <div class="well" style="height: 100%;">
                     <ul class="bxslider">
                        <c:forEach items="${features}" var="track">
                           <li><a class="thumbnail img-responsive"
                              href="SongPage.html?trackid=${track.id}"><img
                                 title="${track.name}" src="${track.album.imgSrc}" /></a></li>
                        </c:forEach>
                     </ul>
                     <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-info"
                           style="width: 100%"></div>
                     </div>
                  </div>
               </section>
               <!-- -------------------------------------------- -->


               <!-- ############################################  -->
               <!-- ------------ RANDOM GENRE TRACKS ------------ -->
               <section>
                  <!-- display genres -->
                  <c:forEach items="${genreMap}" var="entry">
                     <div class="col-md-12">
                        <h1 class="page-header col-md-2">${entry.key}</h1>
                        <br /> <br /> <a href="genre.html?genre=${entry.key}"
                           class="btn btn-info col-md-2 col-md-offset-8 see-more"><i
                           class="fa fa-plus-circle">&nbsp;&nbsp;</i>See more </a>
                     </div>
                     <!-- display 4 tracks for each genre -->
                     <c:forEach items="${entry.value}" begin="0" end="3" var="track">
                        <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                           <div class="well">
                              <a class="thumbnail"
                                 href="SongPage.html?trackid=${track.id}"> <img
                                 class="img-responsive" src="${track.album.imgSrc}"
                                 alt="" />

                              </a> <a href="SongPage.html?trackid=${track.id}">${track.name}<br /></a>
                              <a href="album.html?id=${track.id }">${track.album.name}<br /></a>
                              <a href="SongPage.html?trackid=${track.id}"
                                 class="btn btn-primary"><i
                                 class="fa fa-download"></i>&nbsp;&nbsp;Download</a>
                           </div>
                        </div>
                     </c:forEach>
                  </c:forEach>
               </section>
               <!-- ---------------------------------------------- -->
            </c:otherwise>
         </c:choose>
      </div>
   </div>
   <!-- -------------------------------------------------------------------------------------------------- -->


   <!-- ############################### -->
   <!------------ FOOTER -------------- -->
   <jsp:include page="MasterFooter.jsp" />
   <!--------------------------------- -->


   <!--#################################################-->
   <!---------- JAVASCRIPT ------------------------------->
   <script src="Scripts/jquery-1.10.2.min.js"></script>
   <script src="Scripts/jquery.bxslider.min.js"></script>
   <script src="Scripts/bootstrap.min.js"></script>
   <script>
				$(document).ready(function() {
					$('.bxslider').bxSlider({
						mode : 'horizontal',
						auto : true,
						controls : true,
						captions : true,
						minSlides : 5,
						maxSlides : 5,
						slideWidth : 312,
						slideMargin : 1,
						captions : true
					});

					$("#featured-songs").addClass("animated tada");

					$('.img-responsive').each(function() {
						animationHover(this, 'pulse');
					});
				});

				function animationHover(element, animation) {
					element = $(element);
					element.hover(function() {
						element.addClass('animated ' + animation);
					}, function() {
						//wait for animation to finish before removing classes
						window.setTimeout(function() {
							element.removeClass('animated ' + animation);
						}, 2000);
					});
				}
			</script>
   <!--------------------------------------------------------------->
</body>
</html>