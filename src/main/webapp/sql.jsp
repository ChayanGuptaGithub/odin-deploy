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

<title>odin-Learning SQL</title>

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

nav {
	max-width: 960px;
	mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #ffffff
		25%, #ffffff 75%, rgba(255, 255, 255, 0) 100%);
	margin: 0 auto;
	padding: 60px 0;
}

nav ul {
	text-align: center;
	background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%,
		rgba(255, 255, 255, 0.2) 25%, rgba(255, 255, 255, 0.2) 75%,
		rgba(255, 255, 255, 0) 100%);
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px
		rgba(255, 255, 255, 0.6);
}

nav ul li {
	display: inline-block;
}

nav ul li a {
	padding: 18px;
	font-family: "Open Sans";
	text-transform: uppercase;
	color: linear-gradient(90deg, #00c6ff, #0072ff, #00c6ff);;
	font-size: 18px;
	text-decoration: none;
	display: block;
}

nav ul li a:hover {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px
		rgba(255, 255, 255, 0.6);
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

<div class="container-fluid px-3 py-4">

	<h1 class="text-center mb-4">PL/SQL Programming</h1>

	<div class="text-center d-flex flex-wrap justify-content-center gap-2">

		<!-- DATABASE FOUNDATION (MINIMAL) -->
		<button class="btn btn-success" onclick="loadTopic('dbbasics')">Database Basics</button>
		<button class="btn btn-success" onclick="loadTopic('tablesrecords')">Tables & Records</button>
		<button class="btn btn-success" onclick="loadTopic('keys')">Keys</button>

		<!-- PL/SQL FUNDAMENTALS -->
		<button class="btn btn-warning" onclick="loadTopic('plsqlintro')">PL/SQL Introduction</button>
		<button class="btn btn-warning" onclick="loadTopic('plsqlblock')">PL/SQL Block Structure</button>
		<button class="btn btn-warning" onclick="loadTopic('plsqlvariables')">Variables</button>
		<button class="btn btn-warning"onclick="loadTopic('plsqlconstants')" >Constants & Operators</button>
		<!-- CONTROL FLOW -->
		<button class="btn btn-warning" onclick="loadTopic('plsqlif')">
			IF Statement
			</button>
			
			<button class="btn btn-warning" onclick="loadTopic('plsqlcase')">
			CASE Statement
			</button>
			
			<button class="btn btn-warning" onclick="loadTopic('plsqlloops')">
			Loops
			</button>

		<!-- DATA ACCESS -->
		<button class="btn btn-warning" onclick="loadTopic('selectinto')">
SELECT INTO
</button>

<button class="btn btn-warning" onclick="loadTopic('implicitcursor')">
Implicit Cursors
</button>

<button class="btn btn-warning" onclick="loadTopic('explicitcursor')">
Explicit Cursors
</button>

<button class="btn btn-warning" onclick="loadTopic('cursorforloop')">
Cursor FOR Loop
</button>

		<!-- EXCEPTIONS -->
		<button class="btn btn-warning" onclick="loadTopic('plsqlexception')">
Exception Handling
</button>

		<!-- PROGRAM UNITS -->
<button class="btn btn-warning" onclick="loadTopic('procedure')">
Procedures
</button>

<button class="btn btn-warning" onclick="loadTopic('function')">
Functions
</button>

<button class="btn btn-warning" onclick="loadTopic('package')">
Packages
</button>

		<!-- DATABASE PROGRAMMING -->
	<button class="btn btn-warning" onclick="loadTopic('trigger')">
Triggers
</button>

<button class="btn btn-warning" onclick="loadTopic('transaction')">
Transactions in PL/SQL
</button>

	</div>

	<div class="row mt-4">
		<div class="col-12 col-lg-8">
			<div class="panel" id="dbStoryPanel"></div>
		</div>

		<div class="col-12 col-lg-4">
			<div class="panel" id="dbDefinitionPanel"></div>
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

	function closeLogout() {
	  document.getElementById("logoutModal").classList.remove("show");
	}

	function confirmLogout() {
	  window.location.href = "logout";
	}


const username = "<%= username %>";

function loadTopic(topic)
{
	if(topic==="transaction"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>Transactions in PL/SQL</h3>

		<p>
		${username} is updating employee salaries and inserting
		new records. If something goes wrong,
		the database should return to the previous state.

		This is handled using transactions.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A transaction is a sequence of SQL operations
		treated as a single unit of work.
		It ensures data consistency.
		</p>

		<hr>

		<h4>Transaction Control Commands</h4>

		<pre><code>
		COMMIT
		ROLLBACK
		SAVEPOINT
		</code></pre>

		<hr>

		<h4>COMMIT Example</h4>

		<pre><code>
		BEGIN
		   UPDATE employee
		   SET salary = salary + 1000
		   WHERE id = 1;

		   COMMIT;
		END;
		</code></pre>

		<hr>

		<h4>ROLLBACK Example</h4>

		<pre><code>
		BEGIN
		   UPDATE employee
		   SET salary = salary + 1000
		   WHERE id = 1;

		   ROLLBACK;
		END;
		</code></pre>

		<hr>

		<h4>SAVEPOINT Example</h4>

		<pre><code>
		BEGIN
		   SAVEPOINT before_update;

		   UPDATE employee
		   SET salary = salary + 1000
		   WHERE id = 1;

		   ROLLBACK TO before_update;
		END;
		</code></pre>

		<hr>

		<h4>Why Transactions Matter</h4>

		<p>
		Transactions maintain database consistency
		and protect data integrity.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Transaction = unit of work.</p>
		<p>COMMIT saves changes.</p>
		<p>ROLLBACK undoes changes.</p>
		<p>SAVEPOINT marks position.</p>

		`;
		}

	if(topic==="trigger"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Triggers</h3>

		<p>
		${username} wants certain actions to happen automatically
		when database data changes, like logging updates
		or validating inserts.

		PL/SQL triggers allow automatic execution
		when database events occur.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A trigger is a stored PL/SQL block
		that executes automatically when an event occurs
		on a table, such as INSERT, UPDATE, or DELETE.
		</p>

		<hr>

		<h4>Trigger Example</h4>

		<pre><code>
		CREATE OR REPLACE TRIGGER emp_trigger
		BEFORE INSERT ON employee
		FOR EACH ROW
		BEGIN
		   DBMS_OUTPUT.PUT_LINE('Insert happening');
		END;
		</code></pre>

		<hr>

		<h4>Trigger Types</h4>

		<ul>
		<li>BEFORE Trigger</li>
		<li>AFTER Trigger</li>
		<li>ROW Level Trigger</li>
		<li>STATEMENT Level Trigger</li>
		</ul>

		<hr>

		<h4>Why Triggers Matter</h4>

		<p>
		Triggers enforce rules and automate database actions.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Trigger runs automatically.</p>
		<p>Used with INSERT, UPDATE, DELETE.</p>
		<p>BEFORE and AFTER triggers exist.</p>
		<p>FOR EACH ROW defines row-level trigger.</p>

		`;
		}

	if(topic==="package"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Packages</h3>

		<p>
		${username} now has multiple procedures and functions
		for employee management.

		Instead of keeping them separate,
		PL/SQL allows grouping related program units together
		inside a package.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A package is a schema object that groups related
		procedures, functions, variables, and cursors.
		It consists of a specification and a body.
		</p>

		<hr>

		<h4>Package Specification</h4>

		<pre><code>
		CREATE OR REPLACE PACKAGE emp_pkg IS
		   PROCEDURE greet;
		END emp_pkg;
		</code></pre>

		<hr>

		<h4>Package Body</h4>

		<pre><code>
		CREATE OR REPLACE PACKAGE BODY emp_pkg IS

		   PROCEDURE greet IS
		   BEGIN
		      DBMS_OUTPUT.PUT_LINE('Hello from package');
		   END;

		END emp_pkg;
		</code></pre>

		<hr>

		<h4>Calling Package Procedure</h4>

		<pre><code>
		BEGIN
		   emp_pkg.greet;
		END;
		</code></pre>

		<hr>

		<h4>Why Packages Matter</h4>

		<p>
		Packages improve modularity, performance,
		and code organization in PL/SQL applications.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Package groups program units.</p>
		<p>Has specification and body.</p>
		<p>Improves modular design.</p>
		<p>Called using package_name.procedure.</p>

		`;
		}

	if(topic==="function"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Functions</h3>

		<p>
		${username} now needs reusable logic that returns a value,
		such as calculating bonus or tax for an employee.

		PL/SQL functions are used when a program
		must return a result.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A function is a named PL/SQL block
		that returns a value using the RETURN statement.
		</p>

		<hr>

		<h4>Function Syntax</h4>

		<pre><code>
		CREATE OR REPLACE FUNCTION get_bonus
		RETURN NUMBER IS
		BEGIN
		   RETURN 1000;
		END;
		</code></pre>

		<hr>

		<h4>Calling Function</h4>

		<pre><code>
		DECLARE
		   bonus NUMBER;
		BEGIN
		   bonus := get_bonus;
		   DBMS_OUTPUT.PUT_LINE(bonus);
		END;
		</code></pre>

		<hr>

		<h4>Function with Parameter</h4>

		<pre><code>
		CREATE OR REPLACE FUNCTION square_num(n NUMBER)
		RETURN NUMBER IS
		BEGIN
		   RETURN n * n;
		END;
		</code></pre>

		<pre><code>
		BEGIN
		   DBMS_OUTPUT.PUT_LINE(square_num(5));
		END;
		</code></pre>

		<hr>

		<h4>Procedure vs Function</h4>

		<pre><code>
		Procedure → performs action
		Function  → returns value
		</code></pre>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Function returns value.</p>
		<p>Uses RETURN statement.</p>
		<p>Can accept parameters.</p>
		<p>Called inside expressions.</p>

		`;
		}

	if(topic==="function"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Functions</h3>

		<p>
		${username} now needs reusable logic that returns a value,
		such as calculating bonus or tax for an employee.

		PL/SQL functions are used when a program
		must return a result.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A function is a named PL/SQL block
		that returns a value using the RETURN statement.
		</p>

		<hr>

		<h4>Function Syntax</h4>

		<pre><code>
		CREATE OR REPLACE FUNCTION get_bonus
		RETURN NUMBER IS
		BEGIN
		   RETURN 1000;
		END;
		</code></pre>

		<hr>

		<h4>Calling Function</h4>

		<pre><code>
		DECLARE
		   bonus NUMBER;
		BEGIN
		   bonus := get_bonus;
		   DBMS_OUTPUT.PUT_LINE(bonus);
		END;
		</code></pre>

		<hr>

		<h4>Function with Parameter</h4>

		<pre><code>
		CREATE OR REPLACE FUNCTION square_num(n NUMBER)
		RETURN NUMBER IS
		BEGIN
		   RETURN n * n;
		END;
		</code></pre>

		<pre><code>
		BEGIN
		   DBMS_OUTPUT.PUT_LINE(square_num(5));
		END;
		</code></pre>

		<hr>

		<h4>Procedure vs Function</h4>

		<pre><code>
		Procedure → performs action
		Function  → returns value
		</code></pre>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Function returns value.</p>
		<p>Uses RETURN statement.</p>
		<p>Can accept parameters.</p>
		<p>Called inside expressions.</p>

		`;
		}

	if(topic==="procedure"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Procedures</h3>

		<p>
		${username} now wants reusable database programs
		that can perform tasks like updating salaries
		or inserting employee records.

		PL/SQL provides procedures for reusable logic.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A procedure is a named PL/SQL block
		that performs a specific task and can be reused.
		</p>

		<hr>

		<h4>Procedure Syntax</h4>

		<pre><code>
		CREATE OR REPLACE PROCEDURE greet IS
		BEGIN
		   DBMS_OUTPUT.PUT_LINE('Hello');
		END;
		</code></pre>

		<hr>

		<h4>Calling Procedure</h4>

		<pre><code>
		BEGIN
		   greet;
		END;
		</code></pre>

		<hr>

		<h4>Procedure with Parameter</h4>

		<pre><code>
		CREATE OR REPLACE PROCEDURE show_name(
		   emp_name VARCHAR2
		) IS
		BEGIN
		   DBMS_OUTPUT.PUT_LINE(emp_name);
		END;
		</code></pre>

		<pre><code>
		BEGIN
		   show_name('Alex');
		END;
		</code></pre>

		<hr>

		<h4>Why Procedures Matter</h4>

		<p>
		Procedures allow modular and reusable database logic.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Procedure is reusable PL/SQL block.</p>
		<p>Created using CREATE PROCEDURE.</p>
		<p>Can accept parameters.</p>
		<p>Does not return value.</p>

		`;
		}

	if(topic==="plsqlexception"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>User Defined Exception</h3>

		<p>
		${username} now wants the PL/SQL program to raise
		custom errors when business rules are violated,
		like salary being negative or balance going below zero.

		PL/SQL allows creating custom exceptions
		called user defined exceptions.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A user defined exception is declared in the DECLARE section
		and raised using the RAISE keyword.
		</p>

		<hr>

		<h4>User Defined Exception Example</h4>

		<pre><code>
		DECLARE
		   invalid_salary EXCEPTION;
		   sal NUMBER := -100;
		BEGIN
		   IF sal < 0 THEN
		      RAISE invalid_salary;
		   END IF;

		EXCEPTION
		   WHEN invalid_salary THEN
		      DBMS_OUTPUT.PUT_LINE('Salary cannot be negative');
		END;
		</code></pre>

		<hr>

		<h4>Using RAISE_APPLICATION_ERROR</h4>

		<pre><code>
		BEGIN
		   RAISE_APPLICATION_ERROR(-20001,
		   'Custom error message');
		END;
		</code></pre>

		<hr>

		<h4>Why User Exceptions Matter</h4>

		<p>
		They allow business-rule validation inside PL/SQL programs.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>User exceptions are programmer-defined.</p>
		<p>Declared in DECLARE section.</p>
		<p>Raised using RAISE.</p>
		<p>RAISE_APPLICATION_ERROR creates custom errors.</p>

		`;
		}

	if(topic==="cursorforloop"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>Cursor FOR Loop</h3>

		<p>
		${username} realizes that explicit cursors require
		OPEN, FETCH, and CLOSE steps every time.

		PL/SQL provides Cursor FOR Loop to simplify
		processing multiple rows automatically.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Cursor FOR Loop automatically opens, fetches,
		and closes the cursor while iterating through rows.
		</p>

		<hr>

		<h4>Cursor FOR Loop Example</h4>

		<pre><code>
		DECLARE
		   CURSOR emp_cursor IS
		      SELECT name FROM employee;
		BEGIN
		   FOR emp_rec IN emp_cursor LOOP
		      DBMS_OUTPUT.PUT_LINE(emp_rec.name);
		   END LOOP;
		END;
		</code></pre>

		<hr>

		<h4>Using Query Directly</h4>

		<pre><code>
		BEGIN
		   FOR emp_rec IN (SELECT name FROM employee) LOOP
		      DBMS_OUTPUT.PUT_LINE(emp_rec.name);
		   END LOOP;
		END;
		</code></pre>

		<hr>

		<h4>Why Cursor FOR Loop is Useful</h4>

		<p>
		It reduces code complexity and prevents cursor handling mistakes.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Cursor FOR loop handles cursor automatically.</p>
		<p>No need for OPEN, FETCH, CLOSE.</p>
		<p>Used for multi-row processing.</p>

		`;
		}

	if(topic==="explicitcursor"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>Explicit Cursors</h3>

		<p>
		${username} now needs to process multiple rows from a table.
		Since SELECT INTO only retrieves one row,
		PL/SQL provides explicit cursors to handle multiple records.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		An explicit cursor is declared by the programmer
		to retrieve and process multiple rows from a query.
		</p>

		<hr>

		<h4>Cursor Steps</h4>

		<pre><code>
		DECLARE → OPEN → FETCH → CLOSE
		</code></pre>

		<hr>

		<h4>Explicit Cursor Example</h4>

		<pre><code>
		DECLARE
		   CURSOR emp_cursor IS
		      SELECT name FROM employee;

		   emp_name VARCHAR2(50);
		BEGIN
		   OPEN emp_cursor;

		   LOOP
		      FETCH emp_cursor INTO emp_name;
		      EXIT WHEN emp_cursor%NOTFOUND;
		      DBMS_OUTPUT.PUT_LINE(emp_name);
		   END LOOP;

		   CLOSE emp_cursor;
		END;
		</code></pre>

		<hr>

		<h4>Cursor Attributes</h4>

		<pre><code>
		%FOUND
		%NOTFOUND
		%ROWCOUNT
		%ISOPEN
		</code></pre>

		<hr>

		<h4>Why Explicit Cursors Matter</h4>

		<p>
		Explicit cursors allow row-by-row processing of query results.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Explicit cursor is user-defined.</p>
		<p>Used for multiple rows.</p>
		<p>Steps: declare, open, fetch, close.</p>
		<p>%NOTFOUND controls loop exit.</p>

		`;
		}

	if(topic==="implicitcursor"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>Implicit Cursors</h3>

		<p>
		${username} notices that whenever SQL statements like
		INSERT, UPDATE, DELETE, or SELECT INTO run,
		PL/SQL automatically creates a cursor behind the scenes.

		This automatic cursor is called an <b>implicit cursor</b>.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		An implicit cursor is automatically created by Oracle
		for SQL statements executed in PL/SQL.
		Developers do not control it directly.
		</p>

		<hr>

		<h4>Implicit Cursor Example</h4>

		<pre><code>
		BEGIN
		   UPDATE employee
		   SET salary = salary + 1000
		   WHERE id = 1;
		END;
		</code></pre>

		<hr>

		<h4>Cursor Attributes</h4>

		<p>
		Implicit cursors provide attributes to check SQL execution results.
		</p>

		<pre><code>
		SQL%FOUND
		SQL%NOTFOUND
		SQL%ROWCOUNT
		SQL%ISOPEN
		</code></pre>

		<hr>

		<h4>Example Using SQL%ROWCOUNT</h4>

		<pre><code>
		BEGIN
		   UPDATE employee
		   SET salary = salary + 1000
		   WHERE id = 1;

		   DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
		END;
		</code></pre>

		<hr>

		<h4>Why Implicit Cursors Matter</h4>

		<p>
		They simplify handling SQL execution results
		without manually creating cursors.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Implicit cursor is automatic.</p>
		<p>Used for DML and SELECT INTO.</p>
		<p>SQL%ROWCOUNT shows affected rows.</p>
		<p>SQL%FOUND checks success.</p>

		`;
		}

	if(topic==="selectinto"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>SELECT INTO in PL/SQL</h3>

		<p>
		${username} now wants to fetch data from a table
		and store it inside PL/SQL variables.
		This is done using SELECT INTO.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		SELECT INTO retrieves a single row from a table
		and stores the values into variables.
		</p>

		<hr>

		<h4>Example Table</h4>

		<pre><code>
		EMPLOYEE
		ID   NAME    SALARY
		1    Alex    50000
		</code></pre>

		<hr>

		<h4>SELECT INTO Example</h4>

		<pre><code>
		DECLARE
		   emp_name VARCHAR2(50);
		   emp_salary NUMBER;
		BEGIN
		   SELECT name, salary
		   INTO emp_name, emp_salary
		   FROM employee
		   WHERE id = 1;

		   DBMS_OUTPUT.PUT_LINE(emp_name);
		END;
		</code></pre>

		<hr>

		<h4>Important Rule</h4>

		<p>
		SELECT INTO must return exactly one row,
		otherwise an exception occurs.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>SELECT INTO fetches single row.</p>
		<p>Stores values into variables.</p>
		<p>Multiple rows cause exception.</p>

		`;
		}

	if(topic==="plsqlloops"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Loops</h3>

		<p>
		${username} now wants to repeat tasks automatically,
		like printing numbers or processing multiple records.
		Loops allow executing code repeatedly.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Loops execute a block of code multiple times
		until a condition is satisfied.
		PL/SQL supports LOOP, WHILE LOOP, and FOR LOOP.
		</p>

		<hr>

		<h4>Basic LOOP</h4>

		<pre><code>
		DECLARE
		   i NUMBER := 1;
		BEGIN
		   LOOP
		      DBMS_OUTPUT.PUT_LINE(i);
		      i := i + 1;
		      EXIT WHEN i > 3;
		   END LOOP;
		END;
		</code></pre>

		<hr>

		<h4>WHILE LOOP</h4>

		<pre><code>
		DECLARE
		   i NUMBER := 1;
		BEGIN
		   WHILE i <= 3 LOOP
		      DBMS_OUTPUT.PUT_LINE(i);
		      i := i + 1;
		   END LOOP;
		END;
		</code></pre>

		<hr>

		<h4>FOR LOOP</h4>

		<pre><code>
		BEGIN
		   FOR i IN 1..3 LOOP
		      DBMS_OUTPUT.PUT_LINE(i);
		   END LOOP;
		END;
		</code></pre>

		<hr>

		<h4>Why Loops Matter</h4>

		<p>
		Loops automate repetitive tasks in PL/SQL programs.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>LOOP requires EXIT condition.</p>
		<p>WHILE loop uses condition check.</p>
		<p>FOR loop is simplest loop.</p>

		`;
		}

	if(topic==="plsqlcase"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL CASE Statement</h3>

		<p>
		${username} now wants to handle multiple conditions
		in a cleaner way instead of writing many IF statements.
		PL/SQL provides the CASE statement for this purpose.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		The CASE statement allows selecting one block of code
		from multiple conditions.
		It improves readability compared to multiple IF statements.
		</p>

		<hr>

		<h4>Simple CASE Example</h4>

		<pre><code>
		DECLARE
		   grade CHAR := 'B';
		BEGIN
		   CASE grade
		      WHEN 'A' THEN
		         DBMS_OUTPUT.PUT_LINE('Excellent');
		      WHEN 'B' THEN
		         DBMS_OUTPUT.PUT_LINE('Good');
		      WHEN 'C' THEN
		         DBMS_OUTPUT.PUT_LINE('Average');
		      ELSE
		         DBMS_OUTPUT.PUT_LINE('Needs Improvement');
		   END CASE;
		END;
		</code></pre>

		<hr>

		<h4>Searched CASE Example</h4>

		<pre><code>
		DECLARE
		   marks NUMBER := 82;
		BEGIN
		   CASE
		      WHEN marks >= 90 THEN
		         DBMS_OUTPUT.PUT_LINE('Grade A');
		      WHEN marks >= 60 THEN
		         DBMS_OUTPUT.PUT_LINE('Grade B');
		      ELSE
		         DBMS_OUTPUT.PUT_LINE('Grade C');
		   END CASE;
		END;
		</code></pre>

		<hr>

		<h4>Why CASE is Useful</h4>

		<p>
		CASE makes multi-condition logic easier to read and maintain.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>CASE handles multiple conditions.</p>
		<p>Alternative to multiple IF statements.</p>
		<p>Supports simple and searched CASE.</p>

		`;
		}

	if(topic==="plsqlif"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL IF Statement</h3>

		<p>
		${username} now wants the program to make decisions
		based on conditions like salary range or account balance.
		This is done using IF statements in PL/SQL.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		The IF statement is used to execute code conditionally
		based on boolean expressions.
		</p>

		<hr>

		<h4>Simple IF Example</h4>

		<pre><code>
		DECLARE
		   salary NUMBER := 40000;
		BEGIN
		   IF salary > 30000 THEN
		      DBMS_OUTPUT.PUT_LINE('Eligible');
		   END IF;
		END;
		</code></pre>

		<hr>

		<h4>IF-ELSE Example</h4>

		<pre><code>
		DECLARE
		   marks NUMBER := 45;
		BEGIN
		   IF marks >= 50 THEN
		      DBMS_OUTPUT.PUT_LINE('Pass');
		   ELSE
		      DBMS_OUTPUT.PUT_LINE('Fail');
		   END IF;
		END;
		</code></pre>

		<hr>

		<h4>IF-ELSIF Example</h4>

		<pre><code>
		DECLARE
		   marks NUMBER := 75;
		BEGIN
		   IF marks >= 90 THEN
		      DBMS_OUTPUT.PUT_LINE('Grade A');
		   ELSIF marks >= 60 THEN
		      DBMS_OUTPUT.PUT_LINE('Grade B');
		   ELSE
		      DBMS_OUTPUT.PUT_LINE('Grade C');
		   END IF;
		END;
		</code></pre>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>IF controls decision making.</p>
		<p>Supports IF, IF-ELSE, IF-ELSIF.</p>
		<p>Condition must be boolean.</p>

		`;
		}

	if(topic==="plsqlconstants"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Constants and Operators</h3>

		<p>
		${username} now wants some values in the PL/SQL program
		to remain fixed, such as tax percentage or company code.
		For this purpose, constants are used.

		PL/SQL also supports operators to perform calculations
		and comparisons inside programs.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A constant is a variable whose value cannot be changed after assignment.
		Operators perform arithmetic, relational, and logical operations.
		</p>

		<hr>

		<h4>Constant Declaration</h4>

		<pre><code>
		DECLARE
		   tax_rate CONSTANT NUMBER := 18;
		BEGIN
		   DBMS_OUTPUT.PUT_LINE(tax_rate);
		END;
		</code></pre>

		<p>
		Constants must be initialized at declaration time.
		</p>

		<hr>

		<h4>Arithmetic Operators</h4>

		<pre><code>
		DECLARE
		   a NUMBER := 10;
		   b NUMBER := 5;
		BEGIN
		   DBMS_OUTPUT.PUT_LINE(a + b);
		   DBMS_OUTPUT.PUT_LINE(a * b);
		END;
		</code></pre>

		<hr>

		<h4>Relational Operators</h4>

		<pre><code>
		DECLARE
		   salary NUMBER := 50000;
		BEGIN
		   IF salary > 30000 THEN
		      DBMS_OUTPUT.PUT_LINE('High salary');
		   END IF;
		END;
		</code></pre>

		<hr>

		<h4>Logical Operators</h4>

		<pre><code>
		IF salary > 20000 AND salary < 60000 THEN
		   DBMS_OUTPUT.PUT_LINE('Valid range');
		END IF;
		</code></pre>

		<hr>

		<h4>Why Constants and Operators Matter</h4>

		<p>
		Constants protect fixed values, while operators enable
		computation and decision making in PL/SQL programs.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Constant value cannot change.</p>
		<p>Declared using CONSTANT keyword.</p>
		<p>Arithmetic operators perform calculations.</p>
		<p>Relational operators compare values.</p>
		<p>Logical operators combine conditions.</p>

		`;
		}

	if(topic==="dbbasics"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>Database Basics</h3>

		<p>
		${username} is building an application that must store user data,
		orders, and settings permanently.

		Saving everything in memory would lose data when the program stops.
		To store structured data safely, a <b>database</b> is used.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A database is an organized collection of data stored electronically
		so it can be accessed, managed, and updated efficiently.
		</p>

		<hr>

		<h4>DBMS</h4>
		<p>
		A <b>Database Management System (DBMS)</b> is software that allows
		users to create, manage, and manipulate databases.
		</p>

		Examples:
		<ul>
		<li>MySQL</li>
		<li>Oracle</li>
		<li>PostgreSQL</li>
		<li>SQL Server</li>
		</ul>

		<hr>

		<h4>RDBMS</h4>
		<p>
		A <b>Relational Database Management System (RDBMS)</b>
		stores data in tables with rows and columns.
		Tables can be connected using relationships.
		</p>

		<hr>

		<h4>Table Example</h4>

		<pre><code>
		STUDENT
		-------------------------
		ID   NAME     MARKS
		1    Alex     90
		2    Sam      85
		</code></pre>

		<p>
		Each row is a record.
		Each column is a field.
		</p>

		<hr>

		<h4>Why Databases Matter</h4>

		<p>
		Databases provide structured storage,
		data consistency, and fast retrieval.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Database = organized data storage.</p>
		<p>DBMS manages databases.</p>
		<p>RDBMS stores data in tables.</p>
		<p>Row = record.</p>
		<p>Column = field.</p>

		`;
		}
	if(topic==="tablesrecords"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>Tables and Records</h3>

		<p>
		${username} now needs a structured way to store application data.
		Instead of keeping everything in one place, data is organized into tables.

		A table stores related information in rows and columns,
		similar to a spreadsheet.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A table is a collection of related data organized into rows and columns.
		Each row represents a record, and each column represents a field.
		</p>

		<hr>

		<h4>Table Structure Example</h4>

		<pre><code>
		EMPLOYEE
		---------------------------------
		ID    NAME      SALARY
		1     John      50000
		2     Alex      60000
		</code></pre>

		<p>
		Row → Record<br>
		Column → Field
		</p>

		<hr>

		<h4>Creating a Table</h4>

		<pre><code>
		CREATE TABLE employee (
		    id INT,
		    name VARCHAR(50),
		    salary INT
		);
		</code></pre>

		<hr>

		<h4>Inserting Records</h4>

		<pre><code>
		INSERT INTO employee VALUES (1, 'John', 50000);
		INSERT INTO employee VALUES (2, 'Alex', 60000);
		</code></pre>

		<hr>

		<h4>Selecting Records</h4>

		<pre><code>
		SELECT * FROM employee;
		</code></pre>

		<p>
		Tables allow structured storage and retrieval of data.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Table stores related data.</p>
		<p>Row = record.</p>
		<p>Column = field.</p>
		<p>CREATE TABLE creates structure.</p>
		<p>INSERT adds data.</p>
		<p>SELECT retrieves data.</p>

		`;
		}
	if(topic==="keys"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>Keys in Database</h3>

		<p>
		${username} now has tables storing employee and department data.
		To uniquely identify each record and connect related tables,
		keys are used in databases.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		Keys are attributes used to identify records uniquely
		and create relationships between tables.
		</p>

		<hr>

		<h4>Primary Key</h4>

		<p>
		A primary key uniquely identifies each record in a table.
		It cannot contain duplicate or null values.
		</p>

		<pre><code>
		CREATE TABLE employee (
		    id INT PRIMARY KEY,
		    name VARCHAR(50),
		    salary INT
		);
		</code></pre>

		<hr>

		<h4>Foreign Key</h4>

		<p>
		A foreign key connects one table to another table.
		It references the primary key of another table.
		</p>

		<pre><code>
		CREATE TABLE department (
		    dept_id INT PRIMARY KEY,
		    dept_name VARCHAR(50)
		);

		CREATE TABLE employee (
		    id INT PRIMARY KEY,
		    name VARCHAR(50),
		    dept_id INT,
		    FOREIGN KEY (dept_id)
		    REFERENCES department(dept_id)
		);
		</code></pre>

		<hr>

		<h4>Why Keys Matter</h4>

		<p>
		Keys maintain data integrity and allow relationships
		between tables in relational databases.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Primary key uniquely identifies records.</p>
		<p>Primary key cannot be null.</p>
		<p>Foreign key creates table relationships.</p>
		<p>Supports relational database design.</p>

		`;
		}
	if(topic==="plsqlintro"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Introduction</h3>

		<p>
		${username} has been working with database tables using SQL commands.
		However, SQL alone cannot handle complex logic like loops,
		conditions, and reusable programs.

		To add programming capability to SQL,
		Oracle introduced <b>PL/SQL</b>.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		PL/SQL (Procedural Language/SQL) is an extension of SQL
		that adds procedural programming features like variables,
		conditions, loops, and exception handling.
		</p>

		<hr>

		<h4>SQL vs PL/SQL</h4>

		<pre><code>
		SQL   → Data operations (SELECT, INSERT, UPDATE)
		PL/SQL → Programming logic with SQL
		</code></pre>

		<hr>

		<h4>Simple PL/SQL Block</h4>

		<pre><code>
		BEGIN
		   DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
		END;
		</code></pre>

		<hr>

		<h4>Why PL/SQL is Used</h4>

		<p>
		PL/SQL allows combining SQL statements with programming logic,
		making database operations faster and more structured.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>PL/SQL is Oracle's procedural extension of SQL.</p>
		<p>Supports variables, loops, and conditions.</p>
		<p>Executes as a block.</p>
		<p>Used for stored procedures and triggers.</p>

		`;
		}
	if(topic==="plsqlblock"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Block Structure</h3>

		<p>
		${username} now understands that PL/SQL programs run inside blocks.
		A block organizes declarations, executable code, and error handling
		into a single unit.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A PL/SQL block is the basic unit of execution in PL/SQL.
		It consists of three sections:
		DECLARE, BEGIN, and EXCEPTION.
		</p>

		<hr>

		<h4>PL/SQL Block Format</h4>

		<pre><code>
		DECLARE
		   -- variable declarations

		BEGIN
		   -- executable statements

		EXCEPTION
		   -- error handling

		END;
		</code></pre>

		<hr>

		<h4>Example Block</h4>

		<pre><code>
		DECLARE
		   message VARCHAR2(50);

		BEGIN
		   message := 'Welcome to PL/SQL';
		   DBMS_OUTPUT.PUT_LINE(message);
		END;
		</code></pre>

		<hr>

		<h4>Block Sections Explained</h4>

		<ul>
		<li>DECLARE → optional, used for variables</li>
		<li>BEGIN → mandatory, executable code</li>
		<li>EXCEPTION → optional, handles errors</li>
		</ul>

		<hr>

		<h4>Why Blocks Matter</h4>

		<p>
		PL/SQL executes code as a complete block,
		which improves performance and structure.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>PL/SQL executes in blocks.</p>
		<p>DECLARE section is optional.</p>
		<p>BEGIN section is mandatory.</p>
		<p>EXCEPTION handles errors.</p>

		`;
		}
	if(topic==="plsqlvariables"){

		document.getElementById("dbStoryPanel").innerHTML=`

		<h3>PL/SQL Variables</h3>

		<p>
		${username} now wants to store temporary values inside a PL/SQL block,
		such as employee names or salaries fetched from a table.
		For this, variables are used.
		</p>

		<h5>Interview Explanation</h5>
		<p>
		A variable in PL/SQL is a named memory location used to store data
		during program execution.
		Variables must be declared in the DECLARE section.
		</p>

		<hr>

		<h4>Variable Declaration</h4>

		<pre><code>
		DECLARE
		   emp_name VARCHAR2(50);
		   salary NUMBER;
		</code></pre>

		<hr>

		<h4>Assigning Values</h4>

		<pre><code>
		BEGIN
		   emp_name := 'Alex';
		   salary := 50000;
		END;
		</code></pre>

		<hr>

		<h4>Printing Variable</h4>

		<pre><code>
		DECLARE
		   message VARCHAR2(50);
		BEGIN
		   message := 'PL/SQL Variables';
		   DBMS_OUTPUT.PUT_LINE(message);
		END;
		</code></pre>

		<hr>

		<h4>%TYPE Example</h4>

		<p>
		Variables can inherit datatype from table columns using %TYPE.
		</p>

		<pre><code>
		DECLARE
		   emp_salary employee.salary%TYPE;
		</code></pre>

		<hr>

		<h4>Why Variables Matter</h4>

		<p>
		Variables allow temporary storage of data inside PL/SQL programs.
		</p>

		`;

		document.getElementById("dbDefinitionPanel").innerHTML=`

		<h4>Interview Notes</h4>

		<p>Variables store temporary data.</p>
		<p>Declared in DECLARE section.</p>
		<p>Assignment uses := operator.</p>
		<p>%TYPE copies column datatype.</p>

		`;
		}

}	
	loadTopic("dbbasics")

</script>

</body>
</html>