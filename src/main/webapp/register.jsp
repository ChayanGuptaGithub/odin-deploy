<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>odin-register</title>
<link rel="icon" type="image/png" href="shield-halved-solid-full.jpg">

<style>
:root { 
	--primary: #000000;
	--secondary: #FFFFFF;
	--accent: #FF5E5B;
	--shadow: 8px 8px 0px var(--primary);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Courier New', monospace;
}

body {
	background-color: var(--secondary);
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 20px;
}

.login-container {
	width: 100%;
	max-width: 400px;
	border: 1px solid var(--primary);
	padding: 40px 30px;
	background-color: var(--secondary);
	box-shadow: var(--shadow);
	position: relative;
	border-radius: 12px;
}

.login-container::before {
	content: '';
	position: absolute;
	top: 6px;
	left: 6px;
	right: -6px;
	bottom: -6px;
	border: 1px solid var(--primary);
	z-index: -1;
	border-radius: 12px;
}

h1 {
	color: var(--primary);
	margin-bottom: 30px;
	font-size: 28px;
	font-weight: 700;
	text-align: center;
}

.input-group {
	margin-bottom: 20px;
	position: relative;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: var(--primary);
}

input {
	width: 100%;
	padding: 12px 15px;
	border: 2px solid var(--primary);
	background-color: var(--secondary);
	font-size: 16px;
	outline: none;
	transition: all 0.3s;
}

input:focus {
	box-shadow: 4px 4px 0px var(--primary);
}

button {
	width: 100%;
	padding: 12px;
	background-color: var(--accent);
	color: var(- -secondary);
	border: 2px solid var(--primary);
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	margin-top: 10px;
	transition: all 0.3s;
}

button:hover {
	box-shadow: 4px 4px 0px var(--primary);
	transform: translate(-2px, -2px);
}

.divider {
	display: flex;
	align-items: center;
	margin: 25px 0;
	color: var(--primary);
	font-weight: bold;
}

.divider::before, .divider::after {
	content: "";
	flex: 1;
	border-bottom: 2px solid var(--primary);
	margin: 0 10px;
}

.social-login {
	display: flex;
	justify-content: center;
	gap: 15px;
}

.social-btn {
	width: 50px;
	height: 50px;
	border: 2px solid var(--primary);
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	transition: all 0.3s;
}

.social-btn:hover {
	box-shadow: 4px 4px 0px var(--primary);
	transform: translate(-2px, -2px);
}

.footer {
	text-align: center;
	margin-top: 20px;
	color: var(--primary);
}

.footer a {
	color: var(--primary);
	font-weight: bold;
	text-decoration: underline;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
	<form action="register" method="post" class="login-container">
		<h1>
			REGISTER AT <br> <i class="fa-solid fa-shield-halved"></i><span
				style="padding-right: 5px;"></span>odin
		</h1>

		<div class="input-group">
			<label for="name">NAME</label> <input type="text" id="name"
				placeholder="your name" name="name">
		</div>

		<div class="input-group">
			<label for="state">STATE</label style="margin-right: 5px;">
			 <select id="state" name="state"
				required>
				<option value="">Select State</option>

				<option>Andhra Pradesh</option>
				<option>Arunachal Pradesh</option>
				<option>Assam</option>
				<option>Bihar</option>
				<option>Chhattisgarh</option>
				<option>Goa</option>
				<option>Gujarat</option>
				<option>Haryana</option>
				<option>Himachal Pradesh</option>
				<option>Jharkhand</option>
				<option>Karnataka</option>
				<option>Kerala</option>
				<option>Madhya Pradesh</option>
				<option>Maharashtra</option>
				<option>Manipur</option>
				<option>Meghalaya</option>
				<option>Mizoram</option>
				<option>Nagaland</option>
				<option>Odisha</option>
				<option>Punjab</option>
				<option>Rajasthan</option>
				<option>Sikkim</option>
				<option>Tamil Nadu</option>
				<option>Telangana</option>
				<option>Tripura</option>
				<option>Uttar Pradesh</option>
				<option>Uttarakhand</option>
				<option>West Bengal</option>
			</select>
		</div>

		<div class="input-group">
			<label for="email">EMAIL</label> <input type="email" id="email"
				placeholder="your@email.com" name="email">
		</div>

		<div class="input-group">
			<label for="password">PASSWORD</label> <input type="password"
				id="password" placeholder="........" name="password">
		</div>

		<button type="submit">SIGN UP</button>

		<div class="footer">
			Already have an account? <a href="login.jsp">Sign in</a>
		</div>
	</form>
</body>
</html>