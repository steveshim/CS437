<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Artist</title>

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
      <article class="col-md-8 col-md-offset-1" id="main-content">
         <div class="row">

            <div class="col-lg-12">
               <h1 class="page-header">${artist.name}</h1>
               <h3>Albums</h3>
            </div>

            <c:forEach items="${artist.albums}" var="album">
               <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                  <div class="well">
                     <a class="thumbnail" href="album.html?id=${album.id}"> <img
                        class="img-responsive" src="${album.imgSrc}" alt="">
                     </a> <a href="album.html?id=${album.id }">${album.name}<br /></a> <a
                        href="#">${artist.name}</a>
                  </div>
               </div>
            </c:forEach>

         </div>
      </article>
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