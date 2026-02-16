<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome to odin</title>
<link rel="icon" type="image/png" href="shield-halved-solid-full.jpg">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
body {
	background: #000;
	color: white;
}
nav {
  max-width: 960px;
  mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #ffffff 25%, #ffffff 75%, rgba(255, 255, 255, 0) 100%);
  margin: 0 auto;
  padding: 60px 0;
}

nav ul {
  text-align: center;
  background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.2) 25%, rgba(255, 255, 255, 0.2) 75%, rgba(255, 255, 255, 0) 100%);
  box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
}

nav ul li {
  display: inline-block;
}

nav ul li a {
  padding: 18px;
  font-family: "Open Sans";
  text-transform:uppercase;
  color: linear-gradient(90deg, #00c6ff, #0072ff, #00c6ff);;
  font-size: 18px;
  text-decoration: none;
  display: block;
}

nav ul li a:hover {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
  background: rgba(255, 255, 255, 0.1);
  color: rgba(0, 35, 122, 0.7);
}
nav ul li:last-child a {
	color: white;
	background: linear-gradient(90deg, #00c6ff, #0072ff);
	border-radius: 6px;
	padding: 10px 16px;
}

.odin-title {
	font-size: 60px;
	letter-spacing: 6px;
	font-weight: bold;
	background: linear-gradient(90deg, #00c6ff, #0072ff, #00c6ff);
	background-size: 300%;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	animation: slideColors 4s linear infinite;
}

@
keyframes slideColors { 0% {
	background-position: 0%;
}

100
%
{
background-position
:
300%;
}
}
.btn {
	width: 160px;
}

.card:hover {
	transform: translateY(-5px);
	transition: 0.3s;
}


</style>
<link rel="stylesheet" href="logout.css">
</head>
<body>

	<%
	String username = (String) session.getAttribute("username");
	%>
<nav>
  <ul>
    <li>
      <a href="#">Home</a>
    </li>
    <li>
      <a href="#">About</a>
    </li>
    <li>
      <a href="#">Services</a>
    </li>
    <li>
<a href="#" onclick="openLogout(event)">Logout</a>
    </li>
  </ul>
</nav>

	<div class="container py-5">
		<div class="row align-items-center">

			<!-- LEFT SIDE -->
			<div class="col-12 col-lg-4 text-center text-lg-start mb-5 mb-lg-0">
				<h1 class="odin-title">
					<i class="fa-solid fa-shield-halved"></i> Welcome to ODIN
				</h1>

				<h3 class="mt-3">
					<%=username%>, what do you want to learn today?
				</h3>
			</div>

<div class="col-12 col-lg-8">
    <div class="row g-4">

        <div class="col-12 col-md-6 col-xl-4">
            <a href="java.jsp" class="text-decoration-none">
                <div class="card p-4 text-center shadow h-100">Java</div>
            </a>
        </div>

        <div class="col-12 col-md-6 col-xl-4">
            <a href="javascript" class="text-decoration-none">
                <div class="card p-4 text-center shadow h-100">Javascript</div>
            </a>
        </div>

        <div class="col-12 col-md-6 col-xl-4">
            <a href="sql.jsp" class="text-decoration-none">
                <div class="card p-4 text-center shadow h-100">PL/SQL</div>
            </a>
        </div>

        <div class="col-12 col-md-6 col-xl-4">
            <a href="java.jsp" class="text-decoration-none">
                <div class="card p-4 text-center shadow h-100">Advance Java</div>
            </a>
        </div>

        <div class="col-12 col-md-6 col-xl-4">
            <a href="hadoop.jsp" class="text-decoration-none">
                <div class="card p-4 text-center shadow h-100">Hadoop</div>
            </a>
        </div>

        <div class="col-12 col-md-6 col-xl-4">
            <a href="mysql.jsp" class="text-decoration-none">
                <div class="card p-4 text-center shadow h-100">Related Project</div>
            </a>
        </div>

    </div>
</div>


		</div>
	</div>
	<!-- LOGOUT DIALOG -->
<div id="logoutModal" class="logout-modal">
  <div class="logout-box">
    <h4>Do you want to log out?</h4>
    <div class="mt-3">
      <button class="btn btn-danger" onclick="confirmLogout()">Yes, Logout</button>
      <button class="btn btn-secondary" onclick="closeLogout()">Cancel</button>
    </div>
  </div>
</div>

<script>
function openLogout(e) {
  e.preventDefault();
  document.getElementById("logoutModal").classList.add("show");
}

function closeLoWgout() {
  document.getElementById("logoutModal").classList.remove("show");
}

function confirmLogout() {
  window.location.href = "logout";
}
</script>

	
	
</body>
</html>