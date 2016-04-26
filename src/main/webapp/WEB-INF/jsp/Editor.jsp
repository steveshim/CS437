<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Freebie Music Store - Editor</title>

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
   <!------------ Page Header ----------->

   <!-- ################################-->
   <!------------ Side Bar --------------->
   <jsp:include page="MasterSideBar.jsp" />
   <!------------ Side Bar --------------->


   <!--SideBar and MAIN CONTENT -->
   <div class="row">
      <!--############################################################################-->

      <div class="col-md-4 col-md-offset-1" id="main-content">

         <h1 class="page-header">Welcome to the editor page!</h1>
         <form class="form-horizontal" action="editor.html" method="post">
            <div class="form-group">
               <label class="control-label">Feature tracks by Artist Or Track</label><br />
               <div class="input-group">
                  <span class="input-group-addon">Search</span> <input
                     class="form-control" type="text" id="search"
                     placeholder="live search"></input> <span class="input-group-btn">
                     <input class="btn btn-primary btn-block" type="submit"
                     value="Submit" />
                  </span>
               </div>
            </div>
            <br />

            <table id="main-table" class="table table-striped table-hover">
               <tr>
                  <th class="text-center">Artist</th>
                  <th class="text-center">Track</th>
                  <th class="text-center">Album</th>
                  <th class="text-center">Feature</th>
               </tr>
               <c:forEach items="${tracks}" var="track">
                  <tr class="text-center">
                     <td>${track.album.artist.name}</td>
                     <td class="hover-this"><a
                        href="SongPage.html?trackid=${track.id}">${track.name}</a></td>
                     <td>${track.album.name}</td>
                     <c:choose>
                        <c:when test="${track.feature}">
                           <td><input type="checkbox" name="special"
                              value="${track.id}" checked="checked" /></td>
                        </c:when>
                        <c:otherwise>
                           <td><input type="checkbox" name="special"
                              value="${track.id}" /></td>
                        </c:otherwise>
                     </c:choose>
                  </tr>
               </c:forEach>
            </table>
         </form>
      </div>
      <div class="col-md-4">
         <h3 class="page-header text-center">
            <br /> <br /> <br />Currently Featured Songs
         </h3>
         <form class="form-horizontal" action="Editor" method="post">
            <div class="well">
               <table class="table table-striped table-hover">
                  <tr>
                     <th class="text-center">#</th>
                     <th class="text-center">Artist</th>
                     <th class="text-center">Track</th>
                     <th class="text-center">Album</th>
                  </tr>

                  <c:forEach items="${features}" var="track" varStatus="i">
                     <tr class="text-center">
                        <td><strong>${i.index + 1}</strong></td>
                        <td>${track.album.artist.name}</td>
                        <td>${track.name}</td>
                        <td>${track.album.name}</td>
                     </tr>
                  </c:forEach>
               </table>
            </div>
         </form>

      </div>

      <!-------------------- Main Content --------------------------------------------->
   </div>


   <!--##############################
   <!----------- Footer --------------->
   <jsp:include page="MasterFooter.jsp" />
   <!----------- Footer --------------->

   <!--#################################################-->
   <!---------- JAVASCRIPT ------------------------------->
   <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
   <script src="Scripts/bootstrap.min.js"></script>
   <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
   <script>
      $("#search").on("keyup", function() {
      			var value = $(this).val().toUpperCase();
      			$("#main-table tr").each(
      				function(index) {
      					if (index !== 0) {
      
      						$row = $(this);
      						var artist = $row.find("td").eq(0).text().toUpperCase();
      						var track  = $row.find("td").eq(1).text().toUpperCase();
      
      						if (artist.indexOf(value) !== 0 && track.indexOf(value) !== 0) {
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
   <!---------- JAVASCRIPT ------------------------------->
</body>
</html>

