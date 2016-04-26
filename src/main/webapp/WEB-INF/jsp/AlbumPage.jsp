<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Album</title>

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

   <!-- ############################## -->
   <!------------ PAGE HEADER ----------->
   <jsp:include page="MasterHeader.jsp" />
   <!------------------------ ----------->

   <!-- ################################-->
   <!------------ NAV: SIDE -------------->
   <jsp:include page="MasterSideBar.jsp" />
   <!------------------------------------->


   <!--############################################################################-->
   <!-------------------- MAIN CONTENT ---------------------------------------------->
   <section class="row">
      <div class="col-md-6 col-md-offset-2" id="main-content">
         <article class="row well page-header">
            <div class="col-md-4">
               <a href="#"><img id="album-pg-img"
                  src="${album.imgSrc}" /></a>
            </div>

            <div class="col-md-4">
               <a href="#">${album.name}<br /></a>
               <h4>
                  <a href="artist.html?id=${album.artist.id}">By
                     ${album.artist.name}</a>
               </h4>
            </div>
         </article>
         <br /> <br />
         
         
         <article class="row well">
            <table class="table table-striped table-hover">
               <tr>
                  <th>Track #</th>
                  <th>Track Name</th>
               </tr>

               <c:forEach items="${album.tracks}" var="track">
                  <tr>
                     <td>${track.number}</td>
                     <td><a href="SongPage.html?trackid=${track.id}">${track.name}</a></td>
                  </tr>
               </c:forEach>
            </table>
         </article>
      </div>
   </section>
   <!--------------------------------------------------------------------------------------->

   <!--##############################-->
   <!----------- Footer --------------->
   <jsp:include page="MasterFooter.jsp" />
   <!---------------------------------->

   <!--#################################################-->
   <!---------- JAVASCRIPT ------------------------------->
   <script src="Scripts/jquery-1.10.2.min.js"></script>
   <script src="Scripts/bootstrap.min.js"></script>
   <!----------------------------------------------------->
</body>
</html>