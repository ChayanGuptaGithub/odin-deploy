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

<body> <!-- FIX -->

<div class="container py-4">

	<h1 class="text-center mb-4">Java - OOPs concept</h1>

	<div class="text-center">
			<button class="btn btn-primary" onclick="loadTopic('classobject')">Classes and Objects</button>
		<button class="btn btn-primary" onclick="loadTopic('constructor')">Constructors</button>
		<button class="btn btn-primary" onclick="loadTopic('inheritance')">Inheritance</button>
		<button class="btn btn-primary" onclick="loadTopic('thisandsuper')">This and Super</button>
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

		}



	if(topic==="thisandsuper"){

		document.getElementById("storyPanel").innerHTML=`

		<h3>this keyword</h3>

		
		<p>
		${username} notices that constructor parameters and instance variables
		sometimes have the same name. To differentiate them,
		the object must refer to its own variables.
		</p>

		<h4>Interview Explanation</h4>
		<p>
		The <b>this</b> keyword refers to the current object.
		It is used to access instance variables.
		</p>

		<h4>Code</h4>
		<pre><code>
		class Phone {

		    String brand;

		    Phone(String brand){
		        this.brand = brand;
		    }
		}
		</code></pre>

		`;
		
			document.getElementById("storyPanel").innerHTML=`

			<h3>super keyword</h3>

			
			<p>
			${username} now wants SmartPhone to initialize brand using
			the constructor defined in Phone.

			Since SmartPhone inherits Phone, it should reuse the parent constructor.
			</p>

			<h4>Interview Explanation</h4>
			<p>
			The <b>super</b> keyword is used to call parent class constructor
			or access parent class members.
			</p>

			<h4>Code</h4>
			<pre><code>
			class Phone {
			    String brand;

			    Phone(String b){
			        brand = b;
			    }
			}

			class SmartPhone extends Phone {

			    SmartPhone(String b){
			        super(b);
			    }
			}
			</code></pre>

			<pre><code>
			SmartPhone sp = new SmartPhone("Samsung");
			</code></pre>

			`;
			}

		

	
	loadTopic("classobject");

</script>

</body>
</html>
