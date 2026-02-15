<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>odin-login</title>

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
}

.login-container {
  width: 100%;
  max-width: 400px;
  border: 1px solid var(--primary);
  padding: 40px 30px;
  background-color: var(--secondary);
  box-shadow: var(--shadow);
  border-radius: 12px;
}

h1 {
  text-align: center;
  margin-bottom: 30px;
}

.input-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 8px;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 12px;
  border: 2px solid var(--primary);
}

button {
  width: 100%;
  padding: 12px;
  background-color: var(--accent);
  color: white;
  border: 2px solid var(--primary);
  font-weight: bold;
  cursor: pointer;
}

.footer {
  text-align: center;
  margin-top: 20px;
}
</style>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<link rel="icon" type="image/png" href="shield-halved-solid-full.jpg">

<body>


<%
String email = request.getParameter("email");
if (email == null) email = "";
%>

<form action="login" method="post" class="login-container">

    <h1>
      LOGIN TO <br>
      <i class="fa-solid fa-shield-halved"></i> odin
    </h1>

    <div class="input-group">
        <label>EMAIL</label>
        <input type="email" name="email" value="<%= email %>" required>
    </div>

    <div class="input-group">
        <label>PASSWORD</label>
        <input type="password" name="password" required>
    </div>

    <button type="submit">LOGIN</button>

    <div class="footer">
        Don't have an account? <a href="register.jsp">Register</a>
    </div>

</form>

</body>
</html>