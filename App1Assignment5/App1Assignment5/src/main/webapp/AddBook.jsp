<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.entity.Author"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<style type="text/css">
footer{
    padding: 10px 0;
    background-color: #101010;
    color:#9d9d9d;
    bottom: 0;
    width: 100%;
    position:fixed
    
}
@import url('https://fonts.googleapis.com/css?family=Josefin+Sans:400,400i,600,600i');
html,body{
  margin:0;
  height:100%;
  font-family: 'Josefin Sans', sans-serif;

}
a{
  text-decoration:none
}
.header{
  position:relative;
  overflow:hidden;
  display:flex;
  flex-wrap: wrap;
  height:10vw;
  color:#eee;
}
.header:after{
  content:"";
  width:100%;
  height:100%;
  position:absolute;
  bottom:0;
  left:0;
  z-index:-1;
 background: linear-gradient(to bottom, rgba(0,0,0,0.12) 40%,rgba(27,32,48,1) 100%);
}
.header:before{
  content:"";
  width:100%;
  height:200%;
  position:absolute;
  top:0;
  left:0;
    -webkit-backface-visibility: hidden;
    -webkit-transform: translateZ(0); backface-visibility: hidden;
  scale(1.0, 1.0);
    transform: translateZ(0);
  background:#1B2030 url(https://us.123rf.com/450wm/neirfy/neirfy2210/neirfy221000634/193445773-big-library-interior-sheves-with-books-learning-and-back-to-school-concept.jpg?ver=6) 50% 0 no-repeat;
  background-size:100%;
  background-attachment:fixed;
  animation: grow 360s  linear 10ms infinite;
  transition:all 0.4s ease-in-out;
  z-index:-2
}
.header a{
  color:#eee
}


.info{
  margin-top:50px;
  width:100%;
  text-align:center;
  text-shadow:0 2px 3px rgba(0,0,0,0.2)
}

.meta{
  font-style:italic;
}
@keyframes grow{
  0% { transform: scale(1) translateY(0px)}
  50% { transform: scale(1.2) translateY(-400px)}
}

.btn{
  color:#333;
  border:2px solid;
  border-radius:3px;
  text-decoration:none;
  display:inline-block;
  padding:5px 10px;
  font-weight:600
}

.twtr{
  margin-top:100px
}.btn.twtr:after{content:"\1F426";padding-left:5px}

</style>

<meta charset="ISO-8859-1">
<title></title>

</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("username") == null)
		response.sendRedirect("login.jsp");
	%>
	
<div class="header">

  <div class="info">
    <h1>THE LIBRARY MANAGEMENT SYSTEM</h1>
  </div>
  <div class="title" style="position:absolute;float:right;margin-left:1210px;margin-top:20px;">

				<form action="Logout" method="post">
					<b>Welcome ${username}</b> <input type="submit"
						class="btn btn-success " value="Logout">
				</form>
			</div>
</div>

<div class="container mt-3">
	<div class="row">
		<div class="col-md-6 offset-md-3">
		<br>
			<h1 class="text-center mb-3" >
				Fill the Book detail
			</h1><br>
				<form action="Addbook" method="post">
					<div class="form-group">
						<label for="BookCode" >Book Code</label> <input
							type="text" class="form-control" id="bookCode"
							name="bookCode" onkeypress="return /[0-9]/i.test(event.key)" required>

					</div>
					<div class="form-group">
						<label for="BookName" >Book Name</label> <input
							type="text" class="form-control" id="bookName"
							 name="bookName" required>

					</div>
					<div class="form-group">
						<label for="Author" >Author</label> <select class="form-control"
							class="col-4" name="author" id="author" required>
							<c:forEach items="${Author}" var="Author">
								<option value="${Author.getName()}">${Author.getName()}</option>
							</c:forEach>
						</select>

					</div>
					<div class="form-group">
						<label for="AddedOn" >Added On</label> <input class="form-control"
							type="text" id="addedOn" class="col-4"
							value="${date}" name="addedOn" readonly>


					</div>


					<div class="container text-center">
						<button type="submit" class="btn btn-primary">SAVE</button>
						<button type="submit" class="btn btn-outline-danger"><a href="bookListing.jsp">CANCEL</a></button>

					</div>
				</form>
</div>
	
	</div><br><br><br><br><br><br>

</div>
<footer> 
    <div class="container text-center"> 
            <p>Copyright © Library Management. All Rights Reserved|Contact Us: +91-8448444853</p> 
    </div> 
</footer>
</body>

</html>