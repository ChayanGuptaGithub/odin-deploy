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

<title>odin-Learning Hadoop</title>

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

	<h1 class="text-center mb-4">Hadoop</h1>

	<div class="text-center d-flex flex-wrap justify-content-center gap-2">

	  <button class="btn btn-primary" onclick="loadTopic('intro')">Intro</button>
        <button class="btn btn-primary" onclick="loadTopic('ecosystem')">Ecosystem</button>
        <button class="btn btn-primary" onclick="loadTopic('hdfs')">HDFS</button>
        <button class="btn btn-primary" onclick="loadTopic('mapreduce')">MapReduce</button>
        <button class="btn btn-primary" onclick="loadTopic('yarn')">YARN</button>
        <button class="btn btn-primary" onclick="loadTopic('hive')">Hive</button>
        <button class="btn btn-primary" onclick="loadTopic('spark')">Spark</button>
        <button class="btn btn-primary" onclick="loadTopic('sqoop')">Sqoop</button>

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
		if(topic==="sqoop"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>Sqoop</h3>

			<p>
			${username} needs to move data from a relational database
			like MySQL into Hadoop for analysis.
			Manually exporting and importing large datasets
			would be slow and error-prone.
			</p>

			<p>
			Sqoop is designed to transfer data efficiently
			between relational databases and Hadoop storage.
			</p>

			<hr>

			<h4>What Sqoop Does</h4>

			<p>
			Sqoop (SQL-to-Hadoop) is a tool used for bulk data transfer
			between RDBMS systems and HDFS or Hive.
			</p>

			<ul>
			<li>Imports data from database to HDFS</li>
			<li>Exports data from Hadoop to database</li>
			<li>Uses parallel processing</li>
			<li>Works with MySQL, Oracle, PostgreSQL</li>
			</ul>

			<hr>

			<h4>Import Example</h4>

			<pre><code>
			sqoop import \
			--connect jdbc:mysql://localhost/company \
			--username root \
			--table employee \
			--target-dir /data/employee
			</code></pre>

			<hr>

			<h4>Export Example</h4>

			<pre><code>
			sqoop export \
			--connect jdbc:mysql://localhost/company \
			--username root \
			--table employee \
			--export-dir /data/employee
			</code></pre>

			<hr>

			<h4>Why Sqoop Matters</h4>

			<p>
			Most enterprise data starts in relational databases.
			Sqoop enables Hadoop systems to integrate with
			existing database infrastructure.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>Sqoop = SQL to Hadoop tool</p>
			<p>Imports RDBMS data to HDFS</p>
			<p>Exports Hadoop data to database</p>
			<p>Uses parallel transfer</p>
			<p>Works with Hive and HDFS</p>

			`;
			}

		if(topic==="spark"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>Apache Spark</h3>

			<p>
			${username} notices that MapReduce jobs are slow
			because data is written to disk after each step.
			For large analytics workloads, this becomes inefficient.
			</p>

			<p>
			Apache Spark solves this by processing data in memory,
			making big data computations much faster.
			</p>

			<hr>

			<h4>What Spark Does</h4>

			<p>
			Spark is a distributed data processing engine
			that can run on top of Hadoop clusters.
			</p>

			<ul>
			<li>In-memory processing</li>
			<li>Faster than MapReduce</li>
			<li>Supports batch and streaming</li>
			<li>Works with HDFS</li>
			</ul>

			<hr>

			<h4>Spark Architecture</h4>

			<pre><code>
			Driver Program → Controls execution
			Cluster Manager → Allocates resources
			Executors → Run tasks
			RDD/DataFrame → Data abstraction
			</code></pre>

			<hr>

			<h4>Example (Word Count Concept)</h4>

			<pre><code>
			textFile.flatMap(line → line.split(" "))
			        .map(word → (word, 1))
			        .reduceByKey((a, b) → a + b);
			</code></pre>

			<hr>

			<h4>When Spark is Used</h4>

			<ul>
			<li>Real-time analytics</li>
			<li>Machine learning</li>
			<li>Streaming data</li>
			<li>Interactive queries</li>
			</ul>

			<hr>

			<h4>Why Spark Matters</h4>

			<p>
			Spark can perform many Hadoop tasks faster
			because it minimizes disk I/O by using memory.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>Spark = fast distributed processing engine</p>
			<p>In-memory computation</p>
			<p>Faster than MapReduce</p>
			<p>Runs on Hadoop clusters</p>
			<p>Uses RDD and DataFrame</p>
			<p>Supports streaming and ML</p>

			`;
			}

		if(topic==="hive"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>Hive</h3>

			<p>
			${username} is working with data stored in HDFS.
			Writing MapReduce programs in Java for every query
			is slow and complicated for analysts.
			</p>

			<p>
			Instead, they want to use SQL-like queries to
			analyze big data easily. Hive provides this capability.
			</p>

			<hr>

			<h4>What Hive Does</h4>

			<p>
			Hive is a data warehouse tool built on Hadoop
			that allows querying large datasets using SQL-like syntax.
			</p>

			<ul>
			<li>Uses HiveQL (SQL-like language)</li>
			<li>Converts queries into MapReduce or Spark jobs</li>
			<li>Works on data stored in HDFS</li>
			</ul>

			<hr>

			<h4>Example Query</h4>

			<pre><code>
			SELECT department, COUNT(*)
			FROM employee
			GROUP BY department;
			</code></pre>

			<p>
			Hive converts this query into distributed processing jobs
			behind the scenes.
			</p>

			<hr>

			<h4>Hive Components</h4>

			<pre><code>
			Driver      → Receives query
			Compiler    → Converts query to execution plan
			Metastore   → Stores table metadata
			Execution Engine → Runs job on Hadoop
			</code></pre>

			<hr>

			<h4>When Hive is Used</h4>

			<p>
			Hive is commonly used for batch analytics,
			report generation, and data warehousing tasks.
			</p>

			<hr>

			<h4>Why Hive Matters</h4>

			<p>
			Hive makes big data analysis easier by allowing
			SQL users to work with Hadoop without writing Java code.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>Hive = SQL layer on Hadoop</p>
			<p>HiveQL = SQL-like language</p>
			<p>Works on HDFS data</p>
			<p>Used for batch analytics</p>
			<p>Metastore stores metadata</p>
			<p>Converts queries into MapReduce/Spark jobs</p>

			`;
			}

		if(topic==="yarn"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>YARN (Yet Another Resource Negotiator)</h3>

			<p>
			${username} now has hundreds of MapReduce jobs running
			on a Hadoop cluster with many machines.
			Someone must decide which job gets CPU, memory,
			and which machine runs which task.
			</p>

			<p>
			YARN acts like a cluster manager that distributes
			resources and schedules jobs efficiently.
			</p>

			<hr>

			<h4>Why YARN Exists</h4>

			<p>
			Earlier Hadoop versions used MapReduce for both
			processing and resource management.
			This created scalability problems.
			</p>

			<p>
			YARN separated resource management from processing,
			making Hadoop more flexible and efficient.
			</p>

			<hr>

			<h4>YARN Architecture</h4>

			<pre><code>
			ResourceManager  → Manages cluster resources
			NodeManager      → Runs tasks on each machine
			ApplicationMaster → Controls a specific job
			Container        → Allocated resources
			</code></pre>

			<hr>

			<h4>Execution Flow</h4>

			<ul>
			<li>User submits job</li>
			<li>ResourceManager allocates resources</li>
			<li>ApplicationMaster coordinates job</li>
			<li>NodeManagers execute tasks</li>
			</ul>

			<hr>

			<h4>Real-world Analogy</h4>

			<p>
			Think of YARN as a factory manager assigning workers
			(NodeManagers) to jobs while managing available tools
			(CPU and memory).
			</p>

			<hr>

			<h4>Why YARN Matters</h4>

			<p>
			YARN allows multiple processing frameworks like
			MapReduce and Spark to run on the same Hadoop cluster.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>YARN = resource management layer</p>
			<p>ResourceManager manages cluster</p>
			<p>NodeManager runs tasks</p>
			<p>ApplicationMaster manages job</p>
			<p>Container = allocated resources</p>
			<p>Separates processing from resource management</p>

			`;
			}

		if(topic==="mapreduce"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>MapReduce</h3>

			<p>
			${username} is asked to count how many times each word
			appears in millions of text files stored in HDFS.
			Doing this on one computer would take too long.
			</p>

			<p>
			Instead, Hadoop sends small pieces of the data
			to many machines. Each machine processes its part
			independently, and the results are combined later.
			This is the MapReduce model.
			</p>

			<hr>

			<h4>How MapReduce Works</h4>

			<ul>
			<li>Map phase processes data in parallel</li>
			<li>Shuffle phase groups similar keys</li>
			<li>Reduce phase aggregates results</li>
			</ul>

			<hr>

			<h4>Flow</h4>

			<pre><code>
			Input Data → Map → Shuffle → Reduce → Output
			</code></pre>

			<hr>

			<h4>Word Count Example</h4>

			<p>
			Each mapper reads text and emits:
			</p>

			<pre><code>
			(word, 1)
			</code></pre>

			<p>
			Reducer sums values for each word.
			</p>

			<hr>

			<h4>Java Mapper Example</h4>

			<pre><code>
			public class WordMapper
			extends Mapper&lt;Object, Text, Text, IntWritable&gt; {

			  public void map(Object key, Text value, Context context)
			  throws IOException, InterruptedException {

			    String[] words = value.toString().split(" ");

			    for(String w : words){
			      context.write(new Text(w), new IntWritable(1));
			    }
			  }
			}
			</code></pre>

			<hr>

			<h4>Java Reducer Example</h4>

			<pre><code>
			public class WordReducer
			extends Reducer&lt;Text, IntWritable, Text, IntWritable&gt; {

			  public void reduce(Text key, Iterable&lt;IntWritable&gt; values,
			  Context context) throws IOException, InterruptedException {

			    int sum = 0;

			    for(IntWritable v : values){
			      sum += v.get();
			    }

			    context.write(key, new IntWritable(sum));
			  }
			}
			</code></pre>

			<hr>

			<h4>Why MapReduce Matters</h4>

			<p>
			MapReduce allows large datasets to be processed in parallel
			across clusters efficiently.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>MapReduce = distributed processing model</p>
			<p>Map → transforms data</p>
			<p>Shuffle → groups keys</p>
			<p>Reduce → aggregates results</p>
			<p>Works on HDFS data</p>
			<p>Parallel processing framework</p>

			`;
			}

		if(topic==="hdfs"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>HDFS (Hadoop Distributed File System)</h3>

			<p>
			${username} needs to store a 500GB dataset.
			A single machine cannot reliably store or manage this file.
			</p>

			<p>
			HDFS solves this by splitting the file into smaller blocks
			and distributing them across multiple machines in a cluster.
			Each block is also replicated to prevent data loss.
			</p>

			<hr>

			<h4>How HDFS Works</h4>

			<p>
			Instead of storing a file in one place, HDFS:
			</p>

			<ul>
			<li>Splits file into blocks (default 128MB)</li>
			<li>Stores blocks across DataNodes</li>
			<li>Creates replicas for fault tolerance</li>
			<li>Uses NameNode to manage metadata</li>
			</ul>

			<hr>

			<h4>Architecture</h4>

			<pre><code>
			NameNode   → Metadata manager
			DataNode   → Stores actual data blocks
			Block      → Small piece of file
			Replication → Multiple copies of block
			</code></pre>

			<hr>

			<h4>Example</h4>

			<p>
			If a file is divided into 4 blocks and replication factor is 3,
			HDFS stores 12 block copies across the cluster.
			Even if one machine fails, data remains available.
			</p>

			<hr>

			<h4>Why HDFS Matters</h4>

			<p>
			HDFS provides scalable, fault-tolerant storage
			for very large datasets using commodity hardware.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>HDFS = distributed storage system</p>
			<p>NameNode manages metadata</p>
			<p>DataNode stores blocks</p>
			<p>Default block size = 128MB</p>
			<p>Replication factor = 3</p>
			<p>Fault tolerant storage</p>

			`;
			}

		if(topic==="ecosystem"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>Hadoop Ecosystem</h3>

			<p>
			${username} is working with massive datasets stored in Hadoop.
			Storage alone is not enough — the company also needs tools
			to query data, move data, process data faster, and manage clusters.
			</p>

			<p>
			Instead of one tool doing everything, Hadoop provides
			an ecosystem of components where each tool has a specific job.
			</p>

			<hr>

			<h4>Why Ecosystem Exists</h4>

			<p>
			Big data systems require multiple layers working together:
			</p>

			<ul>
			<li>Storage</li>
			<li>Processing</li>
			<li>Resource management</li>
			<li>Query engines</li>
			<li>Data transfer tools</li>
			</ul>

			<p>
			The Hadoop ecosystem provides all these components.
			</p>

			<hr>

			<h4>Major Hadoop Ecosystem Tools</h4>

			<pre><code>
			HDFS       → Distributed storage
			MapReduce  → Batch processing
			YARN       → Cluster resource manager
			Hive       → SQL on Hadoop
			Spark      → Fast processing engine
			Sqoop      → RDBMS ↔ Hadoop data transfer
			</code></pre>

			<hr>

			<h4>Real-world Example</h4>

			<p>
			A company stores logs in HDFS, uses Hive to query data,
			Spark to analyze patterns, and YARN to manage cluster resources.
			</p>

			<hr>

			<h4>Key Idea</h4>

			<p>
			Hadoop is not just one tool — it is a platform
			made of multiple components working together.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>Hadoop ecosystem = collection of big data tools</p>
			<p>HDFS → storage</p>
			<p>MapReduce → processing</p>
			<p>YARN → resource management</p>
			<p>Hive → SQL interface</p>
			<p>Spark → fast processing</p>
			<p>Sqoop → data transfer</p>

			`;
			}

		if(topic==="intro"){

			document.getElementById("dbStoryPanel").innerHTML=`

			<h3>Introduction to Hadoop</h3>

			<p>
			${username} joins a company where servers generate logs,
			user activity data, and transaction records every second.
			Within days, the data becomes too large for a single system.
			</p>

			<p>
			Instead of upgrading one powerful machine, engineers connect
			many smaller computers together and distribute storage and
			processing across them. This approach is called distributed computing,
			and Hadoop is built on this idea.
			</p>

			<hr>

			<h4>What Hadoop Solves</h4>

			<p>
			Traditional systems struggle with:
			</p>

			<ul>
			<li>Huge data volumes</li>
			<li>Processing speed</li>
			<li>System failures</li>
			<li>Scalability</li>
			</ul>

			<p>
			Hadoop solves these problems by distributing both
			storage and computation across clusters.
			</p>

			<hr>

			<h4>Core Hadoop Components</h4>

			<pre><code>
			HDFS       → Storage
			MapReduce  → Processing
			YARN       → Resource Management
			</code></pre>

			<hr>

			<h4>Example Scenario</h4>

			<p>
			If a 1TB file is stored in Hadoop, it is split into blocks
			and distributed across multiple machines.
			If one machine fails, another replica is used automatically.
			</p>

			<hr>

			<h4>Why Hadoop Matters</h4>

			<p>
			Hadoop allows companies to process big data reliably,
			cheaply, and at scale using commodity hardware.
			</p>

			`;

			document.getElementById("dbDefinitionPanel").innerHTML=`

			<h4>Interview Notes</h4>

			<p>Hadoop = Distributed big data framework</p>
			<p>HDFS = Storage layer</p>
			<p>MapReduce = Processing model</p>
			<p>YARN = Resource manager</p>
			<p>Fault tolerant and scalable</p>

			`;
			}

	}

	loadTopic("intro");
	</script>

</body>
</html>