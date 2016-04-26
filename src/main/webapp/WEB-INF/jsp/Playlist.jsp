<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Play List</title>

<!--##################################################### -->
<!--------------------- Styling ---------------------------->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="Content/footer-distributed-with-address-and-phones.css" rel="stylesheet" />
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
   <section class="row">
      <div class="col-md-8 col-md-offset-1" id="main-content">
               <h1 class="page-header">Your Playlist</h1>
               <div class="well">
                  <table class="table table-striped table-hover">
                     <tr>
                        <th>#</th>
                        <th><a href="#">Track</a></th>
                        <th><a href="#">Artist</a></th>
                        <th><a href="#">Album</a></th>
                        <th><a href="#">Genre</a></th>
                        <th>Operation</th>
                     </tr>

                     <c:forEach items="${modelUser.playlist}" var="track">
                        <tr class="success">
                           <th>${track.number }</th>
                           <td><a href="SongPage.html?trackid=${track.id}">${track.name }</a></td>
                           <td><a href="artist.html?id=${track.album.artist.id}">${track.album.artist.name}</a></td>
                           <td><a href="album.html?id=${track.album.id}">${track.album.name}</a></td>
                           <td><a href="genre.html?genre=${track.album.genre}">${track.album.genre}</a></td>
                           <td><a
                              href="playlistRemove.html?tid=${track.id}&uid=${modelUser.id}">Remove
                                 Track</a></td>
                        </tr>
                     </c:forEach>
                  </table>
                  <br /> <a href="userPage.html"> <i
                     class="fa fa-chevron-circle-left"></i> &nbsp;&nbsp;&nbsp;Back to
                     User Profile
                  </a>
               </div>
            </div>
   </section>
   <!-- ---------------------------------------------------------------------------------- -->

   <!--##############################-->
   <!----------- FOOTER --------------->
   <jsp:include page="MasterFooter.jsp" />
   <!---------------------------------->

   <!--#################################################-->
   <!---------------- JAVASCRIPT ------------------------->
   <script src="Scripts/jquery-1.10.2.min.js"></script>
   <script src="Scripts/bootstrap.min.js"></script>
   <!---------------- JAVASCRIPT ------------------------>
</body>
</html>