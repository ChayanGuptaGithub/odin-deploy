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

<title>odin-Learning Java</title>

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
.logout-modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: none;
  justify-content: center;
  align-items: center;
  background: rgba(0,0,0,0.7);
  z-index: 9999;
}

.logout-modal.show {
  display: flex;
}

.logout-box {
  background: #111;
  padding: 30px;
  border-radius: 10px;
  text-align: center;
}

</style>

</head>

<body>
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

	<div class="container py-4">

		<h1 class="text-center mb-4">Java - OOPs concept</h1>

		<div class="text-center d-flex flex-wrap justify-content-center gap-2">
			<button class="btn btn-primary" onclick="loadTopic('classobject')">Classes
				and Objects</button>
			<button class="btn btn-primary" onclick="loadTopic('constructor')">Constructors</button>
			<button class="btn btn-primary" onclick="loadTopic('inheritance')">Inheritance</button>
			<button class="btn btn-primary" onclick="loadTopic('thisandsuper')">This
				and Super</button>
                <button class="btn btn-primary" onclick="loadTopic('polymorphism')">
		Polymorphism
	</button>

	<button class="btn btn-primary" onclick="loadTopic('casting')">
		Upcasting / Downcasting
	</button>

	<button class="btn btn-primary" onclick="loadTopic('binding')">
		Early / Late Binding
	</button>

	<button class="btn btn-primary" onclick="loadTopic('methodhiding')">
		Method Hiding
	</button>

	<button class="btn btn-primary" onclick="loadTopic('abstraction')">
		Abstraction
	</button>

	<button class="btn btn-primary" onclick="loadTopic('abstractclass')">
		Abstract Class
	</button>

	<button class="btn btn-primary" onclick="loadTopic('interface')">
		Interface
	</button>

    <button class="btn btn-primary" onclick="loadTopic('encapsulation')">
		Encapsulation
	</button>

    	<!-- ACCESS CONTROL -->
	<button class="btn btn-primary" onclick="loadTopic('accessmodifiers')">Access Modifiers</button>
	<button class="btn btn-primary" onclick="loadTopic('finalkeyword')">final Keyword</button>

	<!-- OBJECT CLASS -->
	<button class="btn btn-primary" onclick="loadTopic('objectclass')">Object Class Methods</button>

	<!-- RELATIONSHIP DESIGN -->
	<button class="btn btn-primary" onclick="loadTopic('composition')">Composition vs Inheritance</button>

	<!-- EXCEPTION HANDLING -->
	<button class="btn btn-primary" onclick="loadTopic('exception1')">Exception Handling - 1</button>
	<button class="btn btn-primary" onclick="loadTopic('exception2')">Exception Handling - 2</button>

	<!-- COLLECTIONS -->
	<button class="btn btn-primary" onclick="loadTopic('collections1')">Collections - List</button>
	<button class="btn btn-primary" onclick="loadTopic('collections2')">Collections - Set</button>
	<button class="btn btn-primary" onclick="loadTopic('collections3')">Collections - Map</button>

	<!-- GENERICS -->
	<button class="btn btn-primary" onclick="loadTopic('generics')">Generics</button>

	<!-- COMPARABLE / COMPARATOR -->
	<button class="btn btn-primary" onclick="loadTopic('comparable')">Comparable</button>
	<button class="btn btn-primary" onclick="loadTopic('comparator')">Comparator</button>

	<!-- FILE HANDLING -->
	<button class="btn btn-primary" onclick="loadTopic('filehandling')">File Handling</button>

	<!-- MULTITHREADING -->
	<button class="btn btn-primary" onclick="loadTopic('thread1')">Multithreading - 1</button>
	<button class="btn btn-primary" onclick="loadTopic('thread2')">Multithreading - 2</button>

	<!-- JAVA 8 -->
	<button class="btn btn-primary" onclick="loadTopic('functionalinterface')">Functional Interface</button>
	<button class="btn btn-primary" onclick="loadTopic('lambda')">Lambda Expression</button>

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
	<span id="usernameHolder" style="display: none;"><%=username%></span>

	<script>

	function openLogout(e) {
	  e.preventDefault();
	  document.getElementById("logoutModal").classList.add("show");
	}

	function closeLogout() {
	  document.getElementById("logoutModal").classList.remove("show");
	}

	function confirmLogout() {
	  window.location.href = "logout";
	}

	const username = "<%= username %>";

function loadTopic(topic){
	if(topic==="classobject"){

		document.getElementById("storyPanel").innerHTML=`

		<h3>Classes, Objects, Variables, Methods</h3>
		<p>
		${username} wants to build a smartphone. Before assembling circuits and hardware,
		${username} first designs a blueprint describing battery capacity, brand,
		and phone features.

		This specific blueprint in Object-Oriented Programming is called a <b>Class</b>.
		The different components of the phone, like brand and battery capacity,
		are called <b>Variables</b> because they store data.

		The actions a phone can perform, such as calling or playing music,
		are called <b>Methods</b>. When a method is called, it executes that behavior.
		</p>

		<h4>Interview Explanation </h4>
		<p>
		A <b>class</b> is a blueprint or template used to define properties and
		behavior of objects. It does not occupy memory until an object is created.
		A class groups related variables and methods together.
		</p>

		<p>
		<b>Variables</b> represent the data of an object.
		For a phone, brand and battery level are examples of variables.
		They store state information.
		</p>
		<p>
		<b>Methods</b> represent behavior.
		Calling, charging, or playing music are functionalities of a phone.
		Methods define what an object can do.
		</p>

		<h4>Code</h4>
		<pre><code>
		class Phone {

		    String brand;
		    int battery;

		    void call(){
		        System.out.println("Calling...");
		    }
		}
		</code></pre>

		<hr>

		<p>
		After preparing the blueprint, ${username} starts manufacturing real phones
		using that design. Each phone created from the blueprint becomes a real,
		usable device with its own battery value and brand.

		In Object-Oriented Programming, these real phones created from a class
		are called <b>Objects</b>. An object is the actual implementation of the blueprint
		and holds real values for variables.

		Each phone created from the same blueprint is still independent.
		</p>


		<h4>Interview Explanation </h4>
		<p>
		An <b>object</b> is an instance of a class.
		It occupies memory and holds actual values for variables.
		Multiple objects can be created from the same class.
		</p>

		<h4>Code</h4>
		<pre><code>
		Phone p1 = new Phone();
		p1.brand = "Samsung";
		p1.call();
		</code></pre>

		<hr>
		<p>
		${username} observes that some properties of phones are common for every
		device created from the blueprint. For example, all phones belong to the
		category "Smartphone".

		This shared information does not change from object to object.
		In Object-Oriented Programming, such shared data is called a <b>Static Variable</b>.

		However, properties like battery level and brand differ for every phone.
		These object-specific values are called <b>Non-Static Variables</b>
		(or instance variables).

		Now that the blueprint and objects are ready, the next step is understanding
		how objects are initialized when they are created — this leads to the
		<b>Constructor</b> concept.
		</p>


		<h4>Code </h4>
		<pre><code>
		class Phone {

		    String brand;              // non-static
		    int battery;               // non-static

		    static String type="Smartphone"; // static
		}
		</code></pre>

		`
		;
		

		document.getElementById("definitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p><b>Class:</b> Blueprint for objects.</p>
		<p><b>Object:</b> Instance of class.</p>
		<p><b>Variable:</b> Stores object data.</p>
		<p><b>Method:</b> Defines behavior.</p>
		<p><b>Static Variable:</b> Shared across objects.</p>
		<p><b>Instance Variable:</b> Unique per object.</p>
		

		`;
		}

	if(topic==="constructor"){

		document.getElementById("storyPanel").innerHTML=`

		<h3>Constructors</h3>

		<p>
		After creating the phone blueprint, ${username} realizes that every phone
		must be initialized with some default setup when it is manufactured.
		For example, the battery should start at 100%, and the brand should be assigned.
		</p>

		<h4>Interview Explanation</h4>
		<p>
		A constructor is a special method used to initialize objects.
		It has the same name as the class and does not have a return type.
		It executes automatically when an object is created.
		</p>

		<h4>Default Constructor</h4>

		<p>
		${username} manufactures a phone without specifying any configuration.
		The system automatically assigns default initialization.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A default constructor is a constructor without parameters.
		If no constructor is defined, Java provides one automatically.
		</p>

		<pre><code>
		class Phone {

		    Phone(){
		        System.out.println("Default constructor");
		    }
		}
		</code></pre>


		<hr>
		<h4>Parameterized Constructor</h4>

		<p>
		${username} now wants each phone to be created with a specific brand
		during manufacturing instead of assigning it later.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A parameterized constructor allows passing values to initialize
		object variables at the time of object creation.
		</p>

		<pre><code>
		class Phone {
		    String brand;

		    Phone(String b){
		        brand = b;
		    }
		}
		</code></pre>

		<pre><code>
		Phone p1 = new Phone("Samsung");
		</code></pre>

		class Phone {
		    String brand;

		    Phone(String b){
		        brand = b;
		    }
		}
		</code></pre>

		<pre><code>
		Phone p1 = new Phone("Samsung");
		</code></pre>

		<h4>Constructor Overloading</h4>

		<p>
		${username} wants flexibility in phone creation —
		sometimes with default values and sometimes with custom values.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Constructor overloading means defining multiple constructors
		with different parameter lists in the same class.
		</p>

		<pre><code>
		class Phone {

		    Phone(){}

		    Phone(String brand){}
		}
		</code></pre>

		class Phone {

		    Phone(){}

		    Phone(String b){}
		}
		</code></pre>

		<hr>

		<h4>Constructor Chaining using this()</h4>

		<p>
		${username} notices that multiple constructors repeat initialization logic.
		To reuse initialization code, one constructor can call another constructor.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		The <b>this()</b> keyword is used to call another constructor
		within the same class.
		</p>

		<pre><code>
		class Phone {

		    Phone(){
		        this("Unknown");
		    }

		    Phone(String brand){
		        System.out.println(brand);
		    }
		}
		</code></pre>


		<hr>

		<h4>Constructor Chaining using super()</h4>

		<p>
		${username} builds SmartPhone using Phone as base.
		When SmartPhone is created, Phone must be initialized first.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		The <b>super()</b> keyword calls the parent class constructor.
		It ensures parent initialization happens first.
		</p>

		<pre><code>
		class Phone {
		    Phone(){
		        System.out.println("Phone constructor");
		    }
		}

		class SmartPhone extends Phone {
		    SmartPhone(){
		        super();
		    }
		}
		</code></pre>

		class Phone {
		    Phone(){
		        System.out.println("Parent constructor");
		    }
		}

		class SmartPhone extends Phone {
		    SmartPhone(){
		        super();
		    }
		}
		</code></pre>

		<hr>
		<h4>Copy Constructor</h4>

		<p>
		${username} wants to create a new phone using the configuration
		of an existing phone.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Java does not provide built-in copy constructors,
		but a constructor can accept an object of the same class
		to copy its values.
		</p>

		<pre><code>
		class Phone {
		    String brand;

		    Phone(Phone p){
		        this.brand = p.brand;
		    }
		}
		</code></pre>


		<hr>

		<h4>Constructor vs Method</h4>

		<p>
		${username} initializes the phone using a constructor,
		but calling functionality is done using methods.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Constructors initialize objects automatically.
		Methods define behavior and must be called explicitly.
		</p>

		<pre><code>
		class Phone {

		    Phone(){
		        System.out.println("Constructor");
		    }

		    void show(){
		        System.out.println("Method");
		    }
		}
		</code></pre>

		<hr>

		<h4>Private Constructor</h4>

		<p>
		${username} wants to prevent direct phone creation
		and control object creation internally.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A private constructor restricts object creation from outside the class.
		It is commonly used in Singleton design pattern.
		</p>

		<pre><code>
		class Phone {

		    private Phone(){}

		}
		</code></pre>

		class Phone {
		    private Phone(){}
		}
		</code></pre>

		<hr>

		<h4>Static Block vs Constructor</h4>

		<p>
		${username} loads phone configuration once when the blueprint loads,
		and initializes each phone when it is created.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Static blocks execute once when the class loads.
		Constructors execute when an object is created.
		</p>

		<pre><code>
		class Phone {

		    static {
		        System.out.println("Static block");
		    }

		    Phone(){
		        System.out.println("Constructor");
		    }
		}
		</code></pre>

		class Phone {

		    static {
		        System.out.println("Static block");
		    }

		    Phone(){
		        System.out.println("Constructor");
		    }
		}
		</code></pre>

		<hr>

		<h4>Execution Order</h4>

		<p>
		${username} observes the order in which initialization happens.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Execution order in Java object creation:
		</p>

		<pre><code>
		Static block → Constructor → Method call
		</code></pre>


		`;

		document.getElementById("definitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Constructor initializes objects.</p>
		<p>Default constructor has no parameters.</p>
		<p>Parameterized constructor accepts values.</p>
		<p>Constructor overloading uses multiple constructors.</p>
		<p>this() calls constructor in same class.</p>
		<p>super() calls parent constructor.</p>
		<p>Constructors have no return type.</p>
		<p>Private constructors restrict object creation.</p>
		<p>Static block executes once per class load.</p>

		`;
		}

	if(topic==="inheritance"){

		document.getElementById("storyPanel").innerHTML=`

		<h3>Inheritance</h3>

		<h4>Inheritance</h4>
		<p>
		${username} created a Phone blueprint. Now ${username} wants to build
		a SmartPhone that can also call, without rewriting the Phone code.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Inheritance allows one class to acquire properties and methods
		from another class using the <b>extends</b> keyword.
		</p>

		<pre><code>
		class Phone {
		    void call(){
		        System.out.println("Calling...");
		    }
		}

		class SmartPhone extends Phone {}
		</code></pre>

		<hr>

		<h4>Parent and Child Class</h4>
		<p>
		${username} uses Phone as the base design and SmartPhone as an extended version.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		The base class is called the <b>superclass</b>.
		The derived class is called the <b>subclass</b>.
		</p>

		<pre><code>
		class Phone {}
		class SmartPhone extends Phone {}
		</code></pre>

		<hr>

		<h4>Single Inheritance</h4>
		<p>
		${username} creates SmartPhone from Phone using one parent class.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Single inheritance occurs when one class inherits from one parent class.
		</p>

		<pre><code>
		class Phone {}
		class SmartPhone extends Phone {}
		</code></pre>

		<hr>

		<h4>Multilevel Inheritance</h4>
		<p>
		${username} builds GamingPhone from SmartPhone,
		which already inherited from Phone.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Multilevel inheritance occurs when a class inherits from another derived class.
		</p>

		<pre><code>
		class Phone {}
		class SmartPhone extends Phone {}
		class GamingPhone extends SmartPhone {}
		</code></pre>

		<hr>

		<h4>Hierarchical Inheritance</h4>
		<p>
		${username} creates multiple phone types from the same Phone blueprint.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Hierarchical inheritance occurs when multiple classes inherit from one parent class.
		</p>

		<pre><code>
		class Phone {}
		class SmartPhone extends Phone {}
		class FeaturePhone extends Phone {}
		</code></pre>

		<hr>

		<h4>Multiple Inheritance (Interface)</h4>
		<p>
		${username} wants SmartPhone to support camera and music features together.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Java does not support multiple inheritance using classes,
		but supports it using interfaces.
		</p>

		<pre><code>
		interface Camera {
		    void click();
		}

		interface Music {
		    void play();
		}

		class SmartPhone implements Camera, Music {
		    public void click(){}
		    public void play(){}
		}
		</code></pre>

		<hr>

		<h4>super Keyword</h4>
		<p>
		When SmartPhone object is created, Phone must be initialized first.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		The <b>super()</b> keyword is used to call the parent class constructor.
		</p>

		<pre><code>
		class Phone {
		    Phone(){
		        System.out.println("Phone constructor");
		    }
		}

		class SmartPhone extends Phone {
		    SmartPhone(){
		        super();
		    }
		}
		</code></pre>

		<hr>

		<h4>Constructor Chaining in Inheritance</h4>
		<p>
		${username} observes the order in which constructors execute
		during object creation.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		In inheritance, parent constructor executes before child constructor.
		</p>

		<pre><code>
		class Phone {
		    Phone(){
		        System.out.println("Phone");
		    }
		}

		class SmartPhone extends Phone {
		    SmartPhone(){
		        System.out.println("SmartPhone");
		    }
		}
		</code></pre>

		`;

		document.getElementById("definitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Inheritance enables code reuse.</p>
		<p>Superclass is parent class.</p>
		<p>Subclass is child class.</p>
		<p>extends keyword is used for inheritance.</p>
		<p>super() calls parent constructor.</p>

		`;
		}

       if(topic==="thissuper"){

document.getElementById("storyPanel").innerHTML=`

<h3>this and super</h3>

<p>
${username} builds SmartPhone from Phone.
Some actions belong to the phone being created,
while some belong to the original Phone design.

To refer to the current phone object, Java uses <b>this</b>.
To refer to the parent Phone design, Java uses <b>super</b>.
</p>

<h5>Interview Explanation</h5>
<p>
this refers to the current object.
super refers to the parent class object.
</p>

<hr>

<h4>Using this</h4>
<p>
Used when object variables and constructor parameters have same name.
</p>

<pre><code>
class Phone {
    String brand;

    Phone(String brand){
        this.brand = brand;
    }
}
</code></pre>

<hr>

<h4>Using super</h4>
<p>
Used to call parent constructor when child object is created.
</p>

<pre><code>
class Phone {
    Phone(){
        System.out.println("Phone constructor");
    }
}

class SmartPhone extends Phone {
    SmartPhone(){
        super();
    }
}
</code></pre>

<hr>

<h4>Constructor chaining</h4>
<p>
this() calls constructor in same class.
super() calls constructor in parent class.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`
<h4>Interview Notes</h4>
<p>this refers to current object.</p>
<p>super refers to parent object.</p>
<p>this() calls constructor in same class.</p>
<p>super() calls parent constructor.</p>
`;
}

if(topic==="polymorphism"){

document.getElementById("storyPanel").innerHTML=`

<h3>Polymorphism</h3>

<p>
${username} now has different types of phones — Phone, SmartPhone,
and GamingPhone. All of them can perform a call, but the way they call
can be different.

A basic Phone makes a voice call.
A SmartPhone can make a video call.
A GamingPhone may add streaming features.

Even though the behavior changes, the method name remains the same.
This ability to perform different actions using the same method name
is called <b>polymorphism</b>.
</p>

<h5>Interview Explanation</h5>
<p>
Polymorphism means "many forms".
It allows methods to behave differently depending on the object.
There are two types:
</p>

<ul>
<li>Compile-time polymorphism (method overloading)</li>
<li>Runtime polymorphism (method overriding)</li>
</ul>

<hr>

<h4>Method Overloading (Compile-time Polymorphism)</h4>

<p>
${username} allows calling with different inputs —
a number call and a video call with contact name.
</p>

<h5>Interview Explanation</h5>
<p>
Method overloading occurs when multiple methods have the same name
but different parameter lists.
</p>

<pre><code>
class Phone {

    void call(){
        System.out.println("Voice call");
    }

    void call(String contact){
        System.out.println("Calling " + contact);
    }
}
</code></pre>

<hr>

<h4>Method Overriding (Runtime Polymorphism)</h4>

<p>
SmartPhone changes the calling behavior inherited from Phone.
</p>

<h5>Interview Explanation</h5>
<p>
Method overriding occurs when a subclass provides
its own implementation of a parent class method.
</p>

<pre><code>
class Phone {
    void call(){
        System.out.println("Voice call");
    }
}

class SmartPhone extends Phone {
    void call(){
        System.out.println("Video call");
    }
}
</code></pre>

<hr>

<h4>Dynamic Method Dispatch</h4>

<p>
${username} uses a Phone reference to control a SmartPhone object.
Java decides which call() method to run during execution.
</p>

<h5>Interview Explanation</h5>
<p>
Dynamic method dispatch is the mechanism by which
overridden methods are resolved at runtime.
</p>

<pre><code>
Phone p = new SmartPhone();
p.call();
</code></pre>

<p>Output:</p>

<pre><code>
Video call
</code></pre>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Polymorphism means many forms.</p>
<p>Method overloading → compile-time polymorphism.</p>
<p>Method overriding → runtime polymorphism.</p>
<p>Dynamic method dispatch occurs at runtime.</p>

`;
}
if(topic==="casting"){

document.getElementById("storyPanel").innerHTML=`

<h3>Upcasting and Downcasting</h3>

<p>
${username} now manages different devices in a mobile ecosystem —
basic phones, smartphones, and gaming phones.
All devices share some common abilities like calling and sending messages,
but smartphones add camera, apps, GPS, and internet features.
</p>

<p>
Instead of writing separate code for every device type,
${username} stores all devices using the Phone reference.
This makes the system flexible and easier to manage.
</p>

<h5>Interview Explanation</h5>
<p>
Casting in inheritance allows converting references between
parent and child types.
</p>

<hr>

<h4>Upcasting</h4>

<p>
Upcasting happens when a SmartPhone object is treated as a Phone.
This allows the program to focus only on common functionality.
</p>

<p>
For example, a telecom system only cares about calling capability,
not whether the device has a camera.
</p>

<h5>Interview Explanation</h5>
<p>
Upcasting converts a subclass object into a superclass reference.
It is automatic and safe because every SmartPhone is a Phone.
</p>

<pre><code>
class Phone {
    void call(){
        System.out.println("Voice calling");
    }
}

class SmartPhone extends Phone {
    void openCamera(){
        System.out.println("Camera opened");
    }
}

Phone device = new SmartPhone();
device.call();
</code></pre>

<p>
Even though the reference is Phone, the object is still SmartPhone.
Java remembers the real object type.
</p>

<hr>

<h4>Runtime Behavior (Dynamic Dispatch)</h4>

<p>
If SmartPhone overrides a method, Java executes
the SmartPhone version at runtime.
</p>

<pre><code>
class Phone {
    void call(){
        System.out.println("Basic calling");
    }
}

class SmartPhone extends Phone {
    void call(){
        System.out.println("Internet calling");
    }
}

Phone device = new SmartPhone();
device.call();
</code></pre>

<p>Output:</p>

<pre><code>
Internet calling
</code></pre>

<p>
This happens because Java uses runtime polymorphism.
</p>

<hr>

<h4>Downcasting</h4>

<p>
Later, ${username} wants to use SmartPhone-only features
like camera, GPS, or installing apps.
The Phone reference must be converted back to SmartPhone.
</p>

<h5>Interview Explanation</h5>
<p>
Downcasting converts a superclass reference into a subclass reference.
It must be done explicitly.
</p>

<pre><code>
Phone device = new SmartPhone();
SmartPhone sp = (SmartPhone) device;
sp.openCamera();
</code></pre>

<hr>

<h4>Why Downcasting Can Be Dangerous</h4>

<p>
If the object is not actually a SmartPhone,
downcasting causes a runtime error.
</p>

<pre><code>
Phone device = new Phone();
SmartPhone sp = (SmartPhone) device; // runtime error
</code></pre>

<hr>

<h4>instanceof Check</h4>

<p>
To prevent errors, ${username} checks the object type first.
</p>

<h5>Interview Explanation</h5>
<p>
instanceof ensures safe downcasting.
</p>

<pre><code>
if(device instanceof SmartPhone){
    SmartPhone sp = (SmartPhone) device;
}
</code></pre>

<hr>

<h4>Real-world Understanding</h4>

<p>
Upcasting allows writing generic code for all devices.
Downcasting allows accessing specialized device features when needed.
Together, they enable flexible and reusable system design.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Upcasting = subclass object stored in superclass reference.</p>
<p>Downcasting = superclass reference converted to subclass.</p>
<p>Upcasting is implicit and safe.</p>
<p>Downcasting is explicit and risky.</p>
<p>Runtime polymorphism works with upcasting.</p>
<p>instanceof prevents ClassCastException.</p>

`;
}
if(topic==="binding"){

document.getElementById("storyPanel").innerHTML=`

<h3>Early Binding and Late Binding</h3>

<p>
${username} notices that some phone actions are decided immediately
when the code is compiled, while others are decided only when the program runs.

For example, dialing a number from a basic phone is fixed and predictable.
But calling behavior in SmartPhone depends on which device is actually used
during execution.
</p>

<h5>Interview Explanation</h5>
<p>
Binding means connecting a method call to its implementation.
Java performs binding in two ways:
</p>

<ul>
<li>Early Binding (compile-time binding)</li>
<li>Late Binding (runtime binding)</li>
</ul>

<hr>

<h4>Early Binding</h4>

<p>
When ${username} calls methods that Java can resolve during compilation,
the decision is made early.
Examples include method overloading and static methods.
</p>

<h5>Interview Explanation</h5>
<p>
Early binding occurs at compile time.
It is used for static, private, and overloaded methods.
</p>

<pre><code>
class Phone {

    void call(){
        System.out.println("Calling");
    }

    void call(String name){
        System.out.println("Calling " + name);
    }
}
</code></pre>

<p>
The compiler decides which method to execute.
</p>

<hr>

<h4>Late Binding</h4>

<p>
When ${username} uses a Phone reference for a SmartPhone object,
Java decides which method to run during execution.
</p>

<h5>Interview Explanation</h5>
<p>
Late binding occurs at runtime.
It happens in method overriding.
</p>

<pre><code>
class Phone {
    void call(){
        System.out.println("Voice call");
    }
}

class SmartPhone extends Phone {
    void call(){
        System.out.println("Video call");
    }
}

Phone device = new SmartPhone();
device.call();
</code></pre>

<p>Output:</p>

<pre><code>
Video call
</code></pre>

<hr>

<h4>Why Late Binding Matters</h4>

<p>
Late binding allows flexible systems where behavior depends
on the actual object, not the reference type.
This makes polymorphism possible.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Binding = linking method call to implementation.</p>
<p>Early binding happens at compile time.</p>
<p>Late binding happens at runtime.</p>
<p>Method overloading uses early binding.</p>
<p>Method overriding uses late binding.</p>

`;
}
if(topic==="methodhiding"){

document.getElementById("storyPanel").innerHTML=`

<h3>Method Hiding</h3>

<p>
${username} creates a Phone system where both Phone and SmartPhone
have a static utility method to display device information.

Since static methods belong to the class and not the object,
the child method does not override the parent method —
it hides it.
</p>

<h5>Interview Explanation</h5>
<p>
Method hiding occurs when a subclass defines a static method
with the same signature as a static method in the parent class.
The method executed depends on the reference type.
</p>

<hr>

<h4>Method Hiding Example</h4>

<pre><code>
class Phone {

    static void info(){
        System.out.println("Phone info");
    }
}

class SmartPhone extends Phone {

    static void info(){
        System.out.println("SmartPhone info");
    }
}
</code></pre>

<hr>

<h4>Calling Static Methods</h4>

<pre><code>
Phone device = new SmartPhone();

Phone.info();
SmartPhone.info();
device.info();
</code></pre>

<p>Output:</p>

<pre><code>
Phone info
SmartPhone info
Phone info
</code></pre>

<hr>

<h4>Understanding the Behavior</h4>

<p>
Static methods are resolved using early binding.
Java decides which method to call based on the reference type,
not the object type.
</p>

<p>
That is why device.info() calls Phone.info(),
even though the object is SmartPhone.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Method hiding applies to static methods.</p>
<p>Static methods cannot be overridden.</p>
<p>Resolved using reference type.</p>
<p>Uses early binding.</p>
<p>Different from method overriding.</p>

`;
}
if(topic==="abstraction"){

document.getElementById("storyPanel").innerHTML=`

<h3>Abstraction</h3>

<p>
${username} uses a smartphone every day to make calls,
take photos, and use apps. The phone performs complex internal
operations, but ${username} does not need to know how the hardware
or software actually works.

Only the necessary functionality is visible to the user,
while the internal implementation remains hidden.
This concept is called <b>abstraction</b>.
</p>

<h5>Interview Explanation</h5>
<p>
Abstraction is the process of hiding implementation details
and showing only essential functionality to the user.
</p>

<hr>

<h4>Abstraction Example</h4>

<p>
A Phone defines what operations should exist,
but not how they are implemented.
</p>

<pre><code>
abstract class Phone {

    abstract void call();
}
</code></pre>

<hr>

<h4>Implementation by SmartPhone</h4>

<p>
SmartPhone provides the actual implementation.
</p>

<pre><code>
class SmartPhone extends Phone {

    void call(){
        System.out.println("Video calling");
    }
}
</code></pre>

<hr>

<h4>Using Abstraction</h4>

<pre><code>
Phone device = new SmartPhone();
device.call();
</code></pre>

<p>
The user interacts with Phone,
while SmartPhone handles the implementation.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Abstraction hides implementation details.</p>
<p>Shows only essential functionality.</p>
<p>Achieved using abstract classes and interfaces.</p>
<p>Supports loose coupling.</p>

`;
}
if(topic==="abstractclass"){

document.getElementById("storyPanel").innerHTML=`

<h3>Abstract Class</h3>

<p>
${username} wants to define a general Phone blueprint that cannot
exist on its own. A Phone must always be either a SmartPhone,
GamingPhone, or FeaturePhone.

So the Phone class is made incomplete and used only as a base design.
This type of class is called an <b>abstract class</b>.
</p>

<h5>Interview Explanation</h5>
<p>
An abstract class is a class declared with the <b>abstract</b> keyword.
It cannot be instantiated and may contain abstract methods.
</p>

<hr>

<h4>Abstract Class Example</h4>

<pre><code>
abstract class Phone {

    abstract void call();
}
</code></pre>

<hr>

<h4>Child Class Implementation</h4>

<p>
SmartPhone provides the implementation for the abstract method.
</p>

<pre><code>
class SmartPhone extends Phone {

    void call(){
        System.out.println("Video calling");
    }
}
</code></pre>

<hr>

<h4>Using Abstract Class</h4>

<pre><code>
Phone device = new SmartPhone();
device.call();
</code></pre>

<hr>

<h4>Abstract Class with Normal Method</h4>

<p>
Abstract classes can also contain regular methods.
</p>

<pre><code>
abstract class Phone {

    void powerOn(){
        System.out.println("Phone starting");
    }

    abstract void call();
}
</code></pre>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Abstract class cannot be instantiated.</p>
<p>Can contain abstract and non-abstract methods.</p>
<p>Used for partial abstraction.</p>
<p>Declared using abstract keyword.</p>

`;
}
if(topic==="interface"){

document.getElementById("storyPanel").innerHTML=`

<h3>Interface</h3>

<p>
${username} notices something interesting about ATMs.
If someone has an account in Bank B,
they cannot walk into Bank A’s office and use their account directly.

But they can use Bank A’s ATM machine with a Bank B card.

The ATM acts as a <b>common mediator</b> between the customer
and different banks. It defines what operations must exist —
withdraw, check balance, deposit — but each bank implements
these operations differently.

In Java, this mediator design is called an <b>interface</b>.
</p>

<h5>Interview Explanation</h5>
<p>
An interface is a reference type that defines a contract of methods
that implementing classes must provide.
It supports abstraction and multiple inheritance.
</p>

<hr>

<h4>Interface Example</h4>

<pre><code>
interface ATM {

    void withdraw();
    void checkBalance();
}
</code></pre>

<hr>

<h4>Bank Implementation</h4>

<p>
Different banks implement ATM operations in their own way.
</p>

<pre><code>
class BankA implements ATM {

    public void withdraw(){
        System.out.println("BankA withdrawal");
    }

    public void checkBalance(){
        System.out.println("BankA balance");
    }
}

class BankB implements ATM {

    public void withdraw(){
        System.out.println("BankB withdrawal");
    }

    public void checkBalance(){
        System.out.println("BankB balance");
    }
}
</code></pre>

<hr>

<h4>Using Interface</h4>

<pre><code>
ATM machine = new BankB();
machine.withdraw();
</code></pre>

<p>
The user interacts with the ATM interface,
while the bank provides the implementation.
</p>

<hr>

<h4>Multiple Inheritance using Interface</h4>

<p>
Interfaces allow combining multiple capabilities.
</p>

<pre><code>
interface Camera {
    void click();
}

interface Music {
    void play();
}

class SmartPhone implements Camera, Music {

    public void click(){
        System.out.println("Photo taken");
    }

    public void play(){
        System.out.println("Music playing");
    }
}
</code></pre>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Interface defines a contract.</p>
<p>Methods are public and abstract by default.</p>
<p>Implements keyword is used.</p>
<p>Supports multiple inheritance.</p>
<p>Provides full abstraction.</p>

`;
}
if(topic==="encapsulation"){

document.getElementById("storyPanel").innerHTML=`

<h3>Encapsulation</h3>

<p>
${username} is building a phone system where sensitive data
like battery level and system settings should not be modified directly
by users.

Instead of allowing direct access to variables,
the phone provides controlled methods to update them.

This protection of data is called <b>encapsulation</b>.
</p>

<h5>Interview Explanation</h5>
<p>
Encapsulation is the process of binding data and methods together
and restricting direct access using access modifiers.
It is achieved using private variables and public getter/setter methods.
</p>

<hr>

<h4>Encapsulation Example</h4>

<pre><code>
class Phone {

    private int battery;

    public void setBattery(int b){
        if(b >= 0 && b <= 100){
            battery = b;
        }
    }

    public int getBattery(){
        return battery;
    }
}
</code></pre>

<hr>

<h4>Using Encapsulation</h4>

<pre><code>
Phone p = new Phone();
p.setBattery(80);
System.out.println(p.getBattery());
</code></pre>

<p>
Direct access is prevented, but controlled access is allowed.
</p>

<hr>

<h4>Why Encapsulation Matters</h4>

<p>
Encapsulation protects object data, prevents invalid values,
and keeps the internal state secure.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Encapsulation binds data and methods together.</p>
<p>Variables are private.</p>
<p>Access through getters and setters.</p>
<p>Improves data security.</p>
<p>Supports data hiding.</p>

`;
}
if(topic==="accessmodifiers"){

document.getElementById("storyPanel").innerHTML=`

<h3>Access Modifiers</h3>

<p>
${username} is building a phone system where some data should be visible
everywhere, some only inside the phone, and some only to related devices.

Java provides access modifiers to control visibility of classes,
variables, and methods.
</p>

<h5>Interview Explanation</h5>
<p>
Access modifiers define the scope of accessibility of variables,
methods, and classes.
</p>

<hr>

<h4>Types of Access Modifiers</h4>

<ul>
<li>public</li>
<li>private</li>
<li>protected</li>
<li>default (package-private)</li>
</ul>

<hr>

<h4>Private Example</h4>

<p>
Only accessible within the same class.
</p>

<pre><code>
class Phone {

    private int battery;

    void setBattery(int b){
        battery = b;
    }
}
</code></pre>

<hr>

<h4>Public Example</h4>

<p>
Accessible from anywhere.
</p>

<pre><code>
class Phone {

    public void call(){
        System.out.println("Calling...");
    }
}
</code></pre>

<hr>

<h4>Protected Example</h4>

<p>
Accessible within the package and child classes.
</p>

<pre><code>
class Phone {

    protected String brand;
}
</code></pre>

<hr>

<h4>Default Access</h4>

<p>
Accessible only within the same package.
</p>

<pre><code>
class Phone {

    void powerOn(){
        System.out.println("Starting");
    }
}
</code></pre>

<hr>

<h4>Visibility Summary</h4>

<pre><code>
Modifier     Class   Package   Subclass   World
-----------------------------------------------
public       ✔       ✔         ✔          ✔
protected    ✔       ✔         ✔          ✘
default      ✔       ✔         ✘          ✘
private      ✔       ✘         ✘          ✘
</code></pre>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>public → accessible everywhere</p>
<p>private → accessible only inside class</p>
<p>protected → accessible in subclass and package</p>
<p>default → accessible within package</p>

`;
}
if(topic==="finalkeyword"){

document.getElementById("storyPanel").innerHTML=`

<h3>final Keyword</h3>

<p>
${username} wants certain parts of the phone system to remain unchanged.
For example, a phone’s serial number should never change,
and some methods should not be overridden by child classes.

Java provides the <b>final</b> keyword to prevent modification.
</p>

<h5>Interview Explanation</h5>
<p>
The final keyword is used to restrict modification.
It can be applied to variables, methods, and classes.
</p>

<hr>

<h4>Final Variable</h4>

<p>
A final variable cannot be reassigned after initialization.
</p>

<pre><code>
class Phone {

    final int MAX_BATTERY = 100;
}
</code></pre>

<hr>

<h4>Final Method</h4>

<p>
A final method cannot be overridden in child classes.
</p>

<pre><code>
class Phone {

    final void powerOn(){
        System.out.println("Phone starting");
    }
}
</code></pre>

<hr>

<h4>Final Class</h4>

<p>
A final class cannot be inherited.
</p>

<pre><code>
final class Phone {}
</code></pre>

<hr>

<h4>Why final is Useful</h4>

<p>
It protects constants, prevents unwanted inheritance,
and preserves method behavior.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>final variable = constant.</p>
<p>final method = cannot override.</p>
<p>final class = cannot inherit.</p>
<p>Used for immutability and safety.</p>

`;
}
if(topic==="objectclass"){

document.getElementById("storyPanel").innerHTML=`

<h3>Object Class Methods</h3>

<p>
${username} realizes that every device class created in Java
automatically inherits from the Object class.

This means all classes already have common methods
like toString(), equals(), and hashCode().
</p>

<h5>Interview Explanation</h5>
<p>
The Object class is the root class of the Java hierarchy.
All classes implicitly extend Object.
</p>

<hr>

<h4>toString()</h4>

<p>
Used to represent an object as a string.
</p>

<pre><code>
class Phone {

    String brand;

    Phone(String b){
        brand = b;
    }

    public String toString(){
        return "Phone: " + brand;
    }
}
</code></pre>

<pre><code>
Phone p = new Phone("Samsung");
System.out.println(p);
</code></pre>

<hr>

<h4>equals()</h4>

<p>
Used to compare objects logically.
</p>

<pre><code>
class Phone {

    String brand;

    Phone(String b){
        brand = b;
    }

    public boolean equals(Object obj){
        Phone p = (Phone) obj;
        return this.brand.equals(p.brand);
    }
}
</code></pre>

<hr>

<h4>hashCode()</h4>

<p>
Used in collections like HashMap and HashSet.
Objects that are equal should have the same hashCode.
</p>

<pre><code>
public int hashCode(){
    return brand.hashCode();
}
</code></pre>

<hr>

<h4>Default Object Behavior</h4>

<pre><code>
Phone p = new Phone("Samsung");
System.out.println(p.toString());
</code></pre>

<p>
If toString() is not overridden,
Java prints the object memory reference.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Object is parent of all classes.</p>
<p>toString() returns object representation.</p>
<p>equals() compares objects logically.</p>
<p>hashCode() supports hashing collections.</p>

`;
}
if(topic==="composition"){

document.getElementById("storyPanel").innerHTML=`

<h3>Composition vs Inheritance</h3>

<p>
${username} is designing a SmartPhone system.
A SmartPhone is a Phone, so inheritance makes sense.

But a SmartPhone also contains components like
Battery, Camera, and Screen.
These are not "types of SmartPhone",
they are parts of SmartPhone.

Instead of inheritance, Java uses composition
to build objects using other objects.
</p>

<h5>Interview Explanation</h5>
<p>
Inheritance represents an <b>IS-A</b> relationship.
Composition represents a <b>HAS-A</b> relationship.
</p>

<hr>

<h4>Inheritance Example (IS-A)</h4>

<pre><code>
class Phone {}

class SmartPhone extends Phone {}
</code></pre>

<p>
SmartPhone IS-A Phone.
</p>

<hr>

<h4>Composition Example (HAS-A)</h4>

<pre><code>
class Battery {

    void charge(){
        System.out.println("Charging...");
    }
}

class SmartPhone {

    Battery battery = new Battery();
}
</code></pre>

<p>
SmartPhone HAS-A Battery.
</p>

<hr>

<h4>Using Composition</h4>

<pre><code>
SmartPhone sp = new SmartPhone();
sp.battery.charge();
</code></pre>

<hr>

<h4>Why Composition is Preferred</h4>

<p>
Composition creates flexible designs because components
can be changed without affecting the entire class hierarchy.
Inheritance creates strong coupling between classes.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Inheritance = IS-A relationship.</p>
<p>Composition = HAS-A relationship.</p>
<p>Composition is more flexible.</p>
<p>Inheritance promotes reuse through hierarchy.</p>

`;
}
if(topic==="exception1"){

document.getElementById("storyPanel").innerHTML=`

<h3>Exception Handling - Part 1</h3>

<p>
${username} is testing a phone application where users enter numbers
to divide battery usage between apps. Sometimes users enter zero,
which causes the program to crash.

Instead of letting the program stop unexpectedly,
${username} decides to handle such situations safely.
This is called <b>exception handling</b>.
</p>

<h5>Interview Explanation</h5>
<p>
An exception is an event that disrupts the normal flow of a program.
Exception handling allows programs to continue running safely.
</p>

<hr>

<h4>try and catch</h4>

<p>
Code that may cause an error is placed inside try,
and the error is handled in catch.
</p>

<pre><code>
try {
    int x = 10 / 0;
} catch(Exception e) {
    System.out.println("Error occurred");
}
</code></pre>

<hr>

<h4>Common Exception Example</h4>

<pre><code>
int arr[] = new int[2];
arr[5] = 10;
</code></pre>

<p>
This causes ArrayIndexOutOfBoundsException.
</p>

<hr>

<h4>finally Block</h4>

<p>
finally always executes, whether exception occurs or not.
</p>

<pre><code>
try {
    System.out.println("Running...");
} finally {
    System.out.println("Cleanup done");
}
</code></pre>

<hr>

<h4>Why Exception Handling Matters</h4>

<p>
It prevents program crashes and improves reliability.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Exception disrupts program flow.</p>
<p>try contains risky code.</p>
<p>catch handles exception.</p>
<p>finally always executes.</p>

`;
}
if(topic==="exception2"){

document.getElementById("storyPanel").innerHTML=`

<h3>Exception Handling - Part 2</h3>

<p>
${username} now wants the phone system to detect invalid operations,
like negative battery levels or unsupported actions.

Instead of waiting for Java to throw errors automatically,
${username} can generate exceptions manually.
</p>

<h5>Interview Explanation</h5>
<p>
Java exceptions are divided into:
</p>

<ul>
<li>Checked exceptions (compile-time)</li>
<li>Unchecked exceptions (runtime)</li>
</ul>

<hr>

<h4>Checked Exception Example</h4>

<pre><code>
import java.io.*;

FileReader f = new FileReader("file.txt");
</code></pre>

<p>
The compiler forces handling of checked exceptions.
</p>

<hr>

<h4>Unchecked Exception Example</h4>

<pre><code>
int x = 10 / 0;
</code></pre>

<p>
Occurs at runtime.
</p>

<hr>

<h4>throw Keyword</h4>

<p>
${username} throws an exception when battery becomes invalid.
</p>

<pre><code>
if(battery < 0){
    throw new RuntimeException("Invalid battery");
}
</code></pre>

<hr>

<h4>throws Keyword</h4>

<p>
Used to declare exceptions in method signature.
</p>

<pre><code>
void readFile() throws IOException {
}
</code></pre>

<hr>

<h4>Custom Exception</h4>

<p>
${username} creates a custom exception for phone errors.
</p>

<pre><code>
class BatteryException extends Exception {

    BatteryException(String msg){
        super(msg);
    }
}
</code></pre>

<pre><code>
if(battery < 0){
    throw new BatteryException("Battery invalid");
}
</code></pre>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Checked exceptions occur at compile time.</p>
<p>Unchecked exceptions occur at runtime.</p>
<p>throw creates exception manually.</p>
<p>throws declares exception.</p>
<p>Custom exceptions extend Exception class.</p>

`;
}
if(topic==="collections1"){

document.getElementById("storyPanel").innerHTML=`

<h3>Collections - List</h3>

<p>
${username} is building a phone contact system.
Instead of storing contacts in fixed-size arrays,
${username} needs a dynamic structure that can grow and shrink.

Java provides List collections to store ordered data.
</p>

<h5>Interview Explanation</h5>
<p>
A List is an ordered collection that allows duplicate elements.
Common implementations include ArrayList and LinkedList.
</p>

<hr>

<h4>ArrayList Example</h4>

<pre><code>
import java.util.*;

ArrayList<String> contacts = new ArrayList<>();

contacts.add("Alice");
contacts.add("Bob");
contacts.add("Charlie");

System.out.println(contacts);
</code></pre>

<hr>

<h4>Accessing Elements</h4>

<pre><code>
System.out.println(contacts.get(0));
</code></pre>

<hr>

<h4>Removing Elements</h4>

<pre><code>
contacts.remove("Bob");
</code></pre>

<hr>

<h4>LinkedList Example</h4>

<pre><code>
LinkedList<String> logs = new LinkedList<>();

logs.add("Call log");
logs.add("Message log");
</code></pre>

<hr>

<h4>Difference Between ArrayList and LinkedList</h4>

<pre><code>
ArrayList  → faster access
LinkedList → faster insertion/deletion
</code></pre>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>List is ordered collection.</p>
<p>Allows duplicates.</p>
<p>ArrayList uses dynamic array.</p>
<p>LinkedList uses nodes.</p>

`;
}
if(topic==="collections2"){

document.getElementById("storyPanel").innerHTML=`

<h3>Collections - Set</h3>

<p>
${username} is storing installed apps on a phone.
An app should not appear twice in the system.

To prevent duplicates, ${username} uses a Set collection.
</p>

<h5>Interview Explanation</h5>
<p>
A Set is a collection that does not allow duplicate elements.
HashSet is the most commonly used implementation.
</p>

<hr>

<h4>HashSet Example</h4>

<pre><code>
import java.util.*;

HashSet<String> apps = new HashSet<>();

apps.add("Camera");
apps.add("Maps");
apps.add("Camera");

System.out.println(apps);
</code></pre>

<p>
Duplicate values are ignored.
</p>

<hr>

<h4>Checking Elements</h4>

<pre><code>
System.out.println(apps.contains("Maps"));
</code></pre>

<hr>

<h4>Removing Elements</h4>

<pre><code>
apps.remove("Camera");
</code></pre>

<hr>

<h4>Why Set is Useful</h4>

<p>
Set is useful when uniqueness of data must be maintained.
Examples include installed apps, user IDs, and permissions.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Set does not allow duplicates.</p>
<p>HashSet uses hashing.</p>
<p>Elements are unordered.</p>
<p>Common operations: add, remove, contains.</p>

`;
}
if(topic==="collections3"){

document.getElementById("storyPanel").innerHTML=`

<h3>Collections - Map</h3>

<p>
${username} is building a phone contact system where
each contact name is linked to a phone number.

Instead of storing data in a list,
${username} stores it as key-value pairs.
This is done using a Map.
</p>

<h5>Interview Explanation</h5>
<p>
A Map stores data in key-value pairs.
Keys must be unique, but values can be duplicated.
HashMap is the most commonly used implementation.
</p>

<hr>

<h4>HashMap Example</h4>

<pre><code>
import java.util.*;

HashMap<String, String> contacts = new HashMap<>();

contacts.put("Alice", "9876543210");
contacts.put("Bob", "9123456780");

System.out.println(contacts);
</code></pre>

<hr>

<h4>Accessing Values</h4>

<pre><code>
System.out.println(contacts.get("Alice"));
</code></pre>

<hr>

<h4>Removing Entries</h4>

<pre><code>
contacts.remove("Bob");
</code></pre>

<hr>

<h4>Iterating Map</h4>

<pre><code>
for(String name : contacts.keySet()){
    System.out.println(name + " " + contacts.get(name));
}
</code></pre>

<hr>

<h4>Why Map is Useful</h4>

<p>
Maps are used when data must be retrieved using a key,
such as contacts, configuration settings, or user sessions.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Map stores key-value pairs.</p>
<p>Keys are unique.</p>
<p>HashMap is unordered.</p>
<p>Common methods: put(), get(), remove().</p>

`;
}
if(topic==="generics"){

document.getElementById("storyPanel").innerHTML=`

<h3>Generics</h3>

<p>
${username} is storing contacts in a list.
Without specifying a type, any object could be added,
which may cause runtime errors.

To ensure type safety, Java allows specifying
the type of data a collection can store.
This feature is called <b>generics</b>.
</p>

<h5>Interview Explanation</h5>
<p>
Generics allow classes and methods to operate on specific types.
They provide compile-time type safety.
</p>

<hr>

<h4>Without Generics</h4>

<pre><code>
ArrayList list = new ArrayList();

list.add("Phone");
list.add(10);
</code></pre>

<p>
Different types can be added, which is unsafe.
</p>

<hr>

<h4>With Generics</h4>

<pre><code>
ArrayList<String> list = new ArrayList<>();

list.add("Phone");
</code></pre>

<p>
Now only String values are allowed.
</p>

<hr>

<h4>Generic Class Example</h4>

<pre><code>
class Box<T> {

    T value;

    void set(T v){
        value = v;
    }

    T get(){
        return value;
    }
}
</code></pre>

<pre><code>
Box<String> b = new Box<>();
b.set("SmartPhone");
</code></pre>

<hr>

<h4>Why Generics Matter</h4>

<p>
Generics remove the need for type casting
and prevent runtime ClassCastException.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Generics provide type safety.</p>
<p>Used with collections.</p>
<p>Defined using &lt;T&gt;.</p>
<p>Prevents ClassCastException.</p>

`;
}
if(topic==="comparable"){

document.getElementById("storyPanel").innerHTML=`

<h3>Comparable</h3>

<p>
${username} is building a phone contact system
where contacts must be sorted alphabetically.

To define the natural ordering of objects,
Java uses the Comparable interface.
</p>

<h5>Interview Explanation</h5>
<p>
Comparable is used to define natural sorting order
inside the class itself using compareTo().
</p>

<hr>

<h4>Comparable Example</h4>

<pre><code>
class Contact implements Comparable<Contact> {

    String name;

    Contact(String n){
        name = n;
    }

    public int compareTo(Contact c){
        return this.name.compareTo(c.name);
    }
}
</code></pre>

<hr>

<h4>Sorting List</h4>

<pre><code>
import java.util.*;

ArrayList<Contact> list = new ArrayList<>();

list.add(new Contact("Bob"));
list.add(new Contact("Alice"));

Collections.sort(list);
</code></pre>

<hr>

<h4>Why Comparable is Used</h4>

<p>
Comparable defines a default sorting rule for objects.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Comparable defines natural ordering.</p>
<p>Uses compareTo() method.</p>
<p>Implemented inside class.</p>

`;
}
if(topic==="comparator"){

document.getElementById("storyPanel").innerHTML=`

<h3>Comparator</h3>

<p>
${username} now wants to sort phones
based on battery level instead of name.

Instead of changing the Phone class,
a separate sorting rule can be defined.
This is done using Comparator.
</p>

<h5>Interview Explanation</h5>
<p>
Comparator allows custom sorting logic
outside the class definition.
</p>

<hr>

<h4>Comparator Example</h4>

<pre><code>
import java.util.*;

class Phone {
    int battery;

    Phone(int b){
        battery = b;
    }
}
</code></pre>

<pre><code>
ArrayList<Phone> list = new ArrayList<>();

list.add(new Phone(80));
list.add(new Phone(50));

Collections.sort(list, (a, b) -> a.battery - b.battery);
</code></pre>

<hr>

<h4>Why Comparator is Used</h4>

<p>
Comparator allows multiple sorting strategies
for the same class.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Comparator defines custom sorting.</p>
<p>Implemented outside class.</p>
<p>Used with Collections.sort().</p>

`;
}
if(topic==="comparator"){

document.getElementById("storyPanel").innerHTML=`

<h3>Comparator</h3>

<p>
${username} now wants to sort phones
based on battery level instead of name.

Instead of modifying the Phone class,
a separate sorting rule can be created.
This is done using Comparator.
</p>

<h5>Interview Explanation</h5>
<p>
Comparator is used to define custom sorting logic
outside the class definition.
It uses the compare() method.
</p>

<hr>

<h4>Phone Class</h4>

<pre><code>
class Phone {

    int battery;

    Phone(int b){
        battery = b;
    }
}
</code></pre>

<hr>

<h4>Comparator Implementation</h4>

<pre><code>
import java.util.*;

class BatteryComparator implements Comparator<Phone> {

    public int compare(Phone a, Phone b){
        return a.battery - b.battery;
    }
}
</code></pre>

<hr>

<h4>Sorting Example</h4>

<pre><code>
ArrayList<Phone> list = new ArrayList<>();

list.add(new Phone(80));
list.add(new Phone(50));

Collections.sort(list, new BatteryComparator());
</code></pre>

<hr>

<h4>Why Comparator is Useful</h4>

<p>
Comparator allows multiple sorting strategies
for the same class without modifying the class itself.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Comparator defines custom sorting.</p>
<p>Uses compare() method.</p>
<p>Implemented outside class.</p>
<p>Supports multiple sorting logic.</p>

`;
}
if(topic==="filehandling"){

document.getElementById("storyPanel").innerHTML=`

<h3>File Handling</h3>

<p>
${username} wants to save phone settings and contact data
so they remain available even after the application closes.

To store and retrieve data from files,
Java provides file handling classes.
</p>

<h5>Interview Explanation</h5>
<p>
File handling allows programs to read from and write to files
using classes from the java.io package.
</p>

<hr>

<h4>Creating a File</h4>

<pre><code>
import java.io.*;

File f = new File("data.txt");
f.createNewFile();
</code></pre>

<hr>

<h4>Writing to File</h4>

<pre><code>
FileWriter fw = new FileWriter("data.txt");
fw.write("Phone data");
fw.close();
</code></pre>

<hr>

<h4>Reading from File</h4>

<pre><code>
FileReader fr = new FileReader("data.txt");
int i;

while((i = fr.read()) != -1){
    System.out.print((char)i);
}

fr.close();
</code></pre>

<hr>

<h4>BufferedReader Example</h4>

<pre><code>
BufferedReader br =
new BufferedReader(new FileReader("data.txt"));

System.out.println(br.readLine());
br.close();
</code></pre>

<hr>

<h4>Why File Handling Matters</h4>

<p>
It allows persistent storage of application data.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>File class represents file path.</p>
<p>FileWriter writes to file.</p>
<p>FileReader reads file.</p>
<p>BufferedReader improves reading efficiency.</p>

`;
}
if(topic==="thread1"){

document.getElementById("storyPanel").innerHTML=`

<h3>Multithreading - Part 1</h3>

<p>
${username} is building a phone application where music plays
while messages are downloaded in the background.

Instead of running tasks one after another,
Java allows multiple tasks to run simultaneously.
This is called <b>multithreading</b>.
</p>

<h5>Interview Explanation</h5>
<p>
A thread is a lightweight unit of execution inside a program.
Multithreading allows concurrent execution of tasks.
</p>

<hr>

<h4>Creating Thread using Thread class</h4>

<pre><code>
class MusicThread extends Thread {

    public void run(){
        System.out.println("Playing music");
    }
}
</code></pre>

<pre><code>
MusicThread t = new MusicThread();
t.start();
</code></pre>

<hr>

<h4>Creating Thread using Runnable</h4>

<pre><code>
class DownloadTask implements Runnable {

    public void run(){
        System.out.println("Downloading file");
    }
}
</code></pre>

<pre><code>
Thread t = new Thread(new DownloadTask());
t.start();
</code></pre>

<hr>

<h4>Thread Lifecycle</h4>

<pre><code>
New → Runnable → Running → Terminated
</code></pre>

<hr>

<h4>Why Multithreading Matters</h4>

<p>
It improves performance and responsiveness of applications.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Thread is lightweight process.</p>
<p>start() begins execution.</p>
<p>run() contains thread logic.</p>
<p>Runnable is preferred over Thread class.</p>

`;
}
if(topic==="thread2"){

document.getElementById("storyPanel").innerHTML=`

<h3>Multithreading - Part 2</h3>

<p>
${username} now runs multiple phone tasks at the same time —
music playback, downloading updates, and saving files.

Sometimes threads must wait for each other,
and sometimes shared data must be protected.
</p>

<h5>Interview Explanation</h5>
<p>
Thread coordination and synchronization ensure
safe execution of concurrent tasks.
</p>

<hr>

<h4>sleep()</h4>

<p>
Pauses thread execution for a specified time.
</p>

<pre><code>
try {
    Thread.sleep(1000);
} catch(Exception e){}
</code></pre>

<hr>

<h4>join()</h4>

<p>
Makes one thread wait for another to finish.
</p>

<pre><code>
Thread t1 = new Thread();
t1.start();
t1.join();
</code></pre>

<hr>

<h4>Race Condition</h4>

<p>
When multiple threads modify shared data simultaneously,
unexpected results may occur.
</p>

<pre><code>
class Counter {

    int count = 0;

    void increment(){
        count++;
    }
}
</code></pre>

<hr>

<h4>Synchronization</h4>

<p>
Synchronization prevents multiple threads
from accessing critical code simultaneously.
</p>

<pre><code>
synchronized void increment(){
    count++;
}
</code></pre>

<hr>

<h4>Why Synchronization Matters</h4>

<p>
It ensures data consistency in multithreaded programs.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>sleep() pauses thread.</p>
<p>join() waits for thread completion.</p>
<p>Race condition occurs with shared data.</p>
<p>synchronized prevents conflicts.</p>

`;
}
if(topic==="functionalinterface"){

document.getElementById("storyPanel").innerHTML=`

<h3>Functional Interface</h3>

<p>
${username} notices that some interfaces in Java
contain only one method, like Runnable.

These interfaces are designed to represent
a single action or behavior.
Such interfaces are called <b>functional interfaces</b>.
</p>

<h5>Interview Explanation</h5>
<p>
A functional interface is an interface with exactly
one abstract method.
It is used with lambda expressions in Java 8.
</p>

<hr>

<h4>Functional Interface Example</h4>

<pre><code>
interface Task {

    void execute();
}
</code></pre>

<hr>

<h4>Implementation</h4>

<pre><code>
class DownloadTask implements Task {

    public void execute(){
        System.out.println("Downloading...");
    }
}
</code></pre>

<hr>

<h4>@FunctionalInterface Annotation</h4>

<p>
This annotation ensures only one abstract method exists.
</p>

<pre><code>
@FunctionalInterface
interface Task {
    void execute();
}
</code></pre>

<hr>

<h4>Common Functional Interfaces</h4>

<ul>
<li>Runnable</li>
<li>Comparator</li>
<li>Callable</li>
</ul>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Functional interface has one abstract method.</p>
<p>Used with lambda expressions.</p>
<p>@FunctionalInterface is optional.</p>

`;
}
if(topic==="lambda"){

document.getElementById("storyPanel").innerHTML=`

<h3>Lambda Expression</h3>

<p>
${username} notices that writing small classes
just to implement one method is repetitive.

Java 8 introduced lambda expressions to write
short implementations of functional interfaces.
This makes code cleaner and easier to read.
</p>

<h5>Interview Explanation</h5>
<p>
A lambda expression is a concise way to implement
a functional interface using an expression.
</p>

<hr>

<h4>Without Lambda (Runnable)</h4>

<pre><code>
Runnable r = new Runnable() {
    public void run(){
        System.out.println("Task running");
    }
};
</code></pre>

<hr>

<h4>With Lambda</h4>

<pre><code>
Runnable r = () -> {
    System.out.println("Task running");
};
</code></pre>

<hr>

<h4>Lambda with Parameters</h4>

<pre><code>
interface Calculator {
    int add(int a, int b);
}

Calculator c = (a, b) -> a + b;
System.out.println(c.add(2,3));
</code></pre>

<hr>

<h4>Why Lambda Expressions Matter</h4>

<p>
They reduce boilerplate code and are widely used
in collections, streams, and multithreading.
</p>

`;

document.getElementById("definitionPanel").innerHTML=`

<h4>Interview Notes</h4>

<p>Lambda implements functional interfaces.</p>
<p>Introduced in Java 8.</p>
<p>Reduces anonymous class code.</p>
<p>Syntax: (parameters) -> expression</p>

`;
}

    }
	
	loadTopic("classobject");

</script>

</body>
</html>