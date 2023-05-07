<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.*"%>
<%@page import="com.entity.Book"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>WELCOME</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

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
</head>

<body>

	<!-- to prevent access before login and to prevent going back after logout-->
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
  <div class="title" style="position:absolute;float:right;margin-left:1230px;margin-top:20px;">

				<form action="Logout" method="post">
					<b>Welcome ${username}</b> <input type="submit"
						class="btn btn-success " value="Logout">
				</form>
			</div>
</div>


			

		<div class="container text-center mt-3">
	<div class="row">
		<div class="col-sm-12">
		<br>
			<h1 class="text-center mb-3" >
				Book Listing
			</h1><br>	
			<!-- table creation -->
			<table class="table table-bordered ">
				<thead>
					<tr>
						<th scope="col">Book Code</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Data Added</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach items="${books}" var="Book">
						<tr>


							<td class="col-3 ">${Book.getBookCode()}</td>
							<td class="col-3 ">${Book.getBookName()}</td>
							<td class="col-2 ">${Book.getAuthor()}</td>
							<td class="col-2 ">${Book.getAddedOn()}</td>
							<td class="col-2 ">
							<div class="row">
							<div class="col-lg-5">
								<form action="Edit" method="post">
									<input type="text" name="bookcode" value="${Book.getBookCode()}" hidden> 
									<input type="text" name="bookname" value="${Book.getBookName()}" hidden>
									 <input type="text" name="author" value="${Book.getAuthor()}" hidden>
									<input type="text" name="addedOn" value="${Book.getAddedOn()}" hidden>
									<button type="submit" id="submit-btn" class="  btn btn-primary ">Edit</button>
								</form>
								</div>
								<div class="col-lg-5">
								<form action="Delete" method="post">
									<input type="text" name="bookCode" value="${Book.getBookCode()}" hidden>
									<button type="submit" id="submit-btn" class="btn btn-danger ">Delete</button>
								</form>
								</div>
								</div>
							</td>
						</tr>
					</c:forEach>


				</tbody>
			</table>
			</div>
			</div>
			</div>
			<div class="container text-center">
			<form action="Add" method="post">
				
			<button type="submit" class=" btn btn-outline-success">AddBook</button>
			</form>
			</div>
</body>
<footer> 
    <div class="container text-center"> 
            <p>Copyright © Library Management. All Rights Reserved|Contact Us: +91-8448444853</p> 
    </div> 
</footer>
</html>