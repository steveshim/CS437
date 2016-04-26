<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Freebie Music Store - Downloads</title>

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
   <!------------------------------------->


   <!-- #################################-->
   <!------------ NAV: SIDE --------------->
   <jsp:include page="MasterSideBar.jsp" />
   <!-------------------------------------->
   

   <!-- ################################################################################ -->
   <!-- -------------------------- MAIN CONTENT ---------------------------------------- -->
   <section class="row">
      <div class="col-md-8 col-md-offset-1" id="main-content">
            <h1 class="page-header">Others Enjoying Free Music</h1>
            <div class="well">
               <table class="table table-striped table-hover">
                  <tr>
                     <th>First Name</th>
                     <th>Last Name</th>
                     <th>Email</th>
                     <th></th>
                  </tr>
                  <c:forEach items="${users}" var="user">
                     <tr class="success">
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td><a href="profileView.html?id=${user.id}">View
                              Profile</a></td>
                     </tr>
                  </c:forEach>
               </table>
               <br /> <a href="home.html"> <i class="fa fa-chevron-circle-left"></i>
                  &nbsp;&nbsp;&nbsp;Back to Home Page
               </a>
            </div>
         </div>
   </section>
   <!-- --------------------------------------------------------------------------------- -->

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