<?php 
	session_start();
	error_reporting(E_PARSE);
	include 'sql_conn.php';
	if (isset($_SESSION['account']) && $_SESSION['user_group']=="admin") { //Kiểm tra có login hay chưa, nếu có thì biết $_SESSION sẽ có giá trị là tài khoản vừa nhập
	  if ($_GET['job']=="Order") 
	    $user_group="order";
	  else 
	  	$user_group="";
	  $add="INSERT INTO employees VALUES(null, '".trim($_GET['fullname'])."', '".trim($_GET['account'])."', '".sha1($_GET['password'])."', '".trim($_GET['id_num'])."', '".trim($_GET['address'])."', '".trim($_GET['phone'])."', '".trim($_GET['job'])."', '".trim($_GET['start'])."', '".$user_group."', '".trim($_GET['shiftsalary'])."')";

	  // $add = "insert into employees values(NULL,'Test Name', 'test','123456','2132332323222','tes EQWE','0123456789','Order','2021','order')";
      $add_query = mysqli_query($conn, $add);
	  header('Location: employee.php');
		// echo $add;
	} else {
		header('Location: login.php'); //Nếu không phải tài khoản admin thì chuyển về trang login.php
	}
 ?>