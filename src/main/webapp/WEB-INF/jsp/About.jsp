<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - About</title>

<!--##################################################### -->
<!--------------------- Styling ---------------------------->
<link href="Content/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link href="Content/footer-distributed-with-address-and-phones.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
<link href="Content/add_styling.css" rel="stylesheet" />
<!--------------------- Styling ---------------------------->

</head>
<body class="container-fluid">

   <!-- ############################## -->
   <!------------ PAGE HEADER ----------->
   <jsp:include page="MasterHeader.jsp" />
   <!------------------------------------>

   <!-- ################################-->
   <!------------ NAV: SIDE --------------->
   <jsp:include page="MasterSideBar.jsp" />
   <!------------------------------------->


   <!--###########################################################################-->
   <!----------------------- MAIN CONTENT ------------------------------------------>
   <section class="row">
      <div class="col-md-8 col-md-offset-1" id="main-content">

         <div class="row">
            <h1 class="page-header">Who We Are</h1>
            <div class="well">
               <div class="list-group">
                  <a href="#" class="list-group-item"> <span
                     class="list-group-item-heading">The Team</span> <br /> <i
                     class="fa fa-reddit-alien"></i>&nbsp;&nbsp; Shay Nguyen- Senior
                     Back-End Engineer <br /> <i class="fa fa-reddit-alien"></i>&nbsp;&nbsp;
                     Hieu Phan- Junior Back-End Engineer <br /> <i
                     class="fa fa-reddit-alien"></i>&nbsp;&nbsp; Steve Shim- Junior
                     Back-End Engineer <br /> <i class="fa fa-reddit-alien"></i>&nbsp;&nbsp;
                     James Sunthonlap- Front-End Engineer<br />
                  </a> <a href="#" class="list-group-item"> <span
                     class="list-group-item-heading">The Goal</span> <br /> <span
                     class="list-group-item-text">We're not pirates. We're
                        realists. The content we provide is as open as the technology
                        that powers this web site.</span>
                  </a>
               </div>
            </div>
         </div>

      </div>
   </section>
   <!---------------------------------------------------------------------------------->


   <!--##############################-->
   <!----------- FOOTER --------------->
   <jsp:include page="MasterFooter.jsp" />
   <!---------------------------------->

   <!--##############################################-->
   <!---------------- JAVASCRIPT ---------------------->
   <script src="Scripts/jquery-1.10.2.min.js"></script>
   <script src="Scripts/bootstrap.min.js"></script>
   <!---------------------- --------------------------->

</body>
</html>