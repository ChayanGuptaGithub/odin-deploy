<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="shield-halved-solid-full.jpg">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>odin-Learning Javascript</title>

<%
String username = (String) session.getAttribute("username");
if (username == null)
	username = "Developer";
%>

<style>
body {
	background: #000;
	color: white;
	font-family: Arial;
}
.panel {
	background: #111;
	border-radius: 12px;
	padding: 20px;
	margin-top: 20px;
}
button {
	margin: 5px;
}
code {
	color: #00ffcc;
}
</style>
</head>

<body>

<div class="container py-4">
    <h1 class="text-center mb-4">JavaScript - The Full Spectrum</h1>

    <div class="text-center">
        <div class="mb-3">
            <button class="btn btn-primary" onclick="loadTopic('intro')">JS Intro & Variables</button>
            <button class="btn btn-primary" onclick="loadTopic('templates')">Template Literals</button>
            <button class="btn btn-primary" onclick="loadTopic('destructuring')">Destructuring</button>
            <button class="btn btn-primary" onclick="loadTopic('restspread')">Rest & Spread</button>
        </div>
        <div class="mb-3">
            <button class="btn btn-primary" onclick="loadTopic('hoisting')">Hoisting</button>
            <button class="btn btn-primary" onclick="loadTopic('blockscope')">Block vs Function Scope</button>
            <button class="btn btn-primary" onclick="loadTopic('context')">Execution Context</button>
            <button class="btn btn-primary" onclick="loadTopic('lexical')">Lexical Environment</button>
        </div>
        <div class="mb-3">
            <button class="btn btn-primary" onclick="loadTopic('this')">The 'this' Keyword</button>
            <button class="btn btn-primary" onclick="loadTopic('closures')">Closures</button>
            <button class="btn btn-primary" onclick="loadTopic('prototypes')">Prototypes & Classes</button>
        </div>
        <div>
            <button class="btn btn-primary" onclick="loadTopic('promises')">Async/Await & Promises</button>
            <button class="btn btn-primary" onclick="loadTopic('fetch')">Fetch API</button>
            <button class="btn btn-primary" onclick="loadTopic('modules')">ES6 Modules</button>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-12 col-lg-8">
            <div class="panel" id="storyPanel"></div>
        </div>
        <div class="col-12 col-lg-4">
            <div class="panel" id="definitionPanel"></div>
        </div>
    </div>
</div>

<span id="usernameHolder" style="display:none;"><%= username %></span>
<script>

const username =
	document.getElementById("usernameHolder").textContent.trim();
function loadTopic(topic) {
    if (topic === 'intro') {
        document.getElementById("storyPanel").innerHTML = `
        <h3>The Digital Architect: JS Intro & Structure</h3>
        <p>
        Imagine ${username} is a Digital Architect. Instead of building physical houses, 
        ${username} builds interactive virtual spaces. 
        <br><br>
        In Java, you needed a massive construction crew and strict permits (Main methods and Types) 
        before laying one brick. In JavaScript, you can just start building. It’s an <b>Interpreted</b> 
        language—the browser reads your "blueprints" line by line and executes them immediately.
        </p>

        <hr>

        <h4>1. Variables: The Building Materials</h4>
        <p>
        To build anything, ${username} needs materials. In JS, we have three types of containers:
        <ul>
            <li><b>const:</b> Like a concrete foundation. Once poured, it cannot be changed.</li>
            <li><b>let:</b> Like a room's wallpaper. You can swap it out (re-assign) whenever you like.</li>
            <li><b>var:</b> An old, rusty bucket from the 90s. It’s unpredictable and leaks out of its scope (avoid it!).</li>
        </ul>
        </p>

        <h4>2. Methods & Classes: The Smart House</h4>
        <p>
        Now ${username} wants to create a "Smart House" template. In JS, a <b>Class</b> is a modern 
        blueprint. Inside, we have <b>Methods</b> (the house's automation logic).
        </p>

        <h4>Code Example</h4>
        <pre><code>
// The Blueprint (Class)
class SmartHouse {
    constructor(owner) {
        this.owner = owner; // Property
    }

    // A Method (Behavior)
    unlockDoor() {
        return "Door unlocked for " + this.owner;
    }
}

// Creating an Instance (Object)
const myHome = new SmartHouse("${username}");
console.log(myHome.unlockDoor());
        </code></pre>

        <hr>

        <h4>The "Under the Hood" Structure</h4>
        <p>
        Unlike the strict structure of Java, JS is <b>Multi-paradigm</b>. 
        ${username} can write code in an Object-Oriented way (using Classes), 
        or a Functional way (just writing standalone functions). The browser’s 
        <b>JS Engine</b> handles the memory allocation and execution context automatically.
        </p>
        `;

        document.getElementById("definitionPanel").innerHTML = `
        <h4>JS Fundamentals</h4>
        <p><b>Interpreted:</b> Code is executed line by line, no compilation step needed.</p>
        <p><b>const/let:</b> Modern ways to store data. <code>const</code> is for values that stay, <code>let</code> is for values that change.</p>
        <p><b>Dynamic Typing:</b> You don't declare types (int, String). JS figures it out at runtime.</p>
        <p><b>Class Syntax:</b> Syntactic sugar over JS's prototype-based inheritance.</p>
        `;
    }
    
}
loadTopic("intro");

</script>
</body>
</html>