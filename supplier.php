<!doctype html>
<?php session_start(); 
header('Content-Type: text/html; charset=UTF-8');
?>
<html lang="en">
  <head>
    <title>Hệ thống quản lý</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- Material Kit CSS -->
    <link href="assets/css/material-kit.css?v=2.1.1" rel="stylesheet" />
  </head>
  <body>
    <nav class="navbar navbar-expand-lg bg-primary">
      <div class="container">
        <a class="navbar-brand">HỆ THỐNG QUẢN LÝ</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="sr-only">Toggle navigation</span>
        <span class="navbar-toggler-icon"></span>
        <span class="navbar-toggler-icon"></span>
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="product.php">Sản phẩm</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="#">Nhân viên <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="supplier.php">Nhà cung cấp</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <?php 
                include ('sql_conn.php');
                if (isset($_SESSION['username']) && $_SESSION['username']){ //Kiểm tra session
                       $name = "SELECT firstname, lastname FROM users WHERE username = '".$_SESSION['username']."'";
                       $queryName = mysqli_query($conn, $name); //Thực hiện câu truy vấn
                        if ($queryName->num_rows > 0) { //Kiểm tra số dòng
                         while ($row = mysqli_fetch_assoc($queryName)) { //Nếu có kết quả thì đưa tất cả vào bảng
                          echo "Xin chào ".$row['lastname']." ".$row['firstname']; //Đúng thì cho phép truy cập và hiện xin chào
                        }
                       }        
                     }else{
                    header('Location: login.php'); 
                }
                ?>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="logout.php">Đăng xuất</a>
                </div>
              </li>
          </ul>
        </div>
      </div>
    </nav>
      <main role="main" class="container md">                                  
        <div class="my-3 p-3 bg-white rounded shadow-sm">
          <div class="card card-nav-tabs card-plain">
            <div class="card-header card-header-danger">
                <!-- colors: "header-primary", "header-info", "header-success", "header-warning", "header-danger" -->
                <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                        <ul class="nav nav-tabs" data-tabs="tabs">
                            <li class="nav-item">
                                <a class="nav-link active" href="#employee" data-toggle="tab"><i class="material-icons">face</i>Nhân viên</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#shift" data-toggle="tab"><i class="material-icons">assignment</i>Lịch trực</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#salary" data-toggle="tab"><i class="material-icons">attach_money</i>Lương</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div><div class="card-body ">
                <div class="tab-content text-center">
                    <div class="tab-pane active" id="employee">
                        <section name="addEmployee">
                          <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                              <li class="breadcrumb-item"><a href="#">Nhân viên</a></li>
                              <li class="breadcrumb-item active" aria-current="page">Thên nhân viên</li>
                            </ol>
                          </nav>
                          <form method="POST">
                            <div class="form-row">
                              <div class="col-4">
                                <label class="bmd-label-static">Họ tên*</label>
                                <input type="text" name="fullname" id="fullname" class="form-control" >
                              </div>
                              <div class="col-2">
                                <label class="bmd-label-static">Số điện thoại*</label>
                                <input type="text" name="phone" id="phone" class="form-control" pattern="\d{10,10}">
                              </div>
                              <div class="col">
                                <label class="bmd-label-static">Địa chỉ</label>
                                <input type="text" name="address" id="address" class="form-control" >
                              </div>
                            </div>
                            <div class="form-row">
                              <div class="col-3">
                                <select class="selectpicker show-tick" data-style="select-with-transition" name="job" id="job">
                                  <option disabled selected>Công việc*</option>
                                  <option value="Phục vụ">Phục vụ</option>
                                  <option value="Chế biến">Chế biến</option>
                                  <option value="Kế toán">Kế toán</option>
                                </select>
                              </div>
                              <div class="col-2">
                                <label class="bmd-label-static">Năm vào làm</label>
                                <input type="text" name="start" id="start" class="form-control" pattern="\d{4,4}">
                              </div>
                              <div class="col">
                                <label class="bmd-label-static">Link ảnh</label>
                                <input type="text" name="avatar" id="avatar" class="form-control">
                              </div>
                            </div>
                              <div class="row">
                                <div class="col-auto mr-auto"> </div>
                                <div class="col-auto">
                                <button class="btn btn-success" type="submit" name="addEmp"><i class="material-icons">add</i> THÊM NHÂN VIÊN</button>
                                </div>
                              </div>
                          </form>
                          <?php
                            include('sql_conn.php');
                            error_reporting(0);
                            if (isset($_POST['addEmp'])) {
                              if ($_POST['fullname'] != "" && $_POST['phone'] != "" && $_POST['job'] != "") {
                                $addQuery = "INSERT INTO employees (fullname, address, phone, job, start, avatar)
                                                         value ('".$_POST["fullname"]."', '".$_POST["address"]."', '".$_POST["phone"]."', '".$_POST["job"]."', '".$_POST["start"]."', '".$_POST["avatar"]."')";
                                $query1 = mysqli_query($conn, $addQuery);
                              }else{
                                 echo "<script>alert('Vui lòng điền đủ thông tin các ô có dấu *');</script>";
                              }
                            }
                          ?>
                          <hr>
                        </section>
                        <section name="listEmployee">
                          <nav aria-label="breadcrumb" role="navigation">
                            <ol class="breadcrumb">
                              <li class="breadcrumb-item"><a href="#">Nhân viên</a></li>
                              <li class="breadcrumb-item active" aria-current="page">Danh sách nhân viên</li>
                            </ol>
                          </nav>
                          <div class="row">
                            <div class="col-auto mr-auto" id="numberOfEmployee">
                              <?php
                                include('sql_conn.php');
                                $numberOfEmployee = "SELECT COUNT(id) as total FROM employees";
                                $sqlCount = mysqli_query($conn, $numberOfEmployee); //Thực hiện truy vấn đếm dựa vào id
                                $data = mysqli_fetch_assoc($sqlCount); //Đưa tất cả dữ liệu select được vào mảng
                                echo "<h4>Có tất cả ".$data['total']." nhân viên</h4>";
                              ?>
                            </div>
                            
                            <!-- Bảng hiển thị danh sách nhân viên -->
                            <table class="table table-hover" name="employeeTable">
                              <thead>
                                <tr>
                                  <th>STT</th>
                                  <th>Hình ảnh</th>
                                  <th>Tên nhân viên</th>
                                  <th>Số điện thoại</th>
                                  <th>Địa chỉ</th>
                                  <th>Công việc</th>
                                  <th>Năm vào</th>
                                  <th class="text-right">Thao tác</th>
                                </tr>
                              </thead>
                              <tbody>
                                <?php
                                  include('sql_conn.php');
                                  error_reporting(E_PARSE); //Ẩn lỗi 
                                  $select_query = "SELECT * FROM employees";                   
                                
                                $query0 = mysqli_query($conn, $select_query); //Thực hiện câu truy vấn
                                if ($query0->num_rows > 0) { //Kiểm tra số dòng
                                  while ($row = mysqli_fetch_assoc($query0)) { //Đưa số vòng vào một mảng để hiển thị
                                    echo '<tr>
                                            <td>'.$row["id"].'</td>
                                            <td><img src="'.$row["avatar"].'" width="90" /></td>
                                            <th>'.$row["fullname"].'</th>
                                            <td>'.$row["phone"].'</td>
                                            <td>'.$row["address"].'</td>
                                            <td>'.$row["job"].'</td>
                                            <td>'.$row["start"].'</td>
                                            <td class="td-actions text-right">
                                              <form method="post">
                                                <button type="button" rel="tooltip" class="btn btn-success"data-toggle="modal" data-target="#editModal'.$row["id"].'">
                                                    <i class="material-icons">edit</i>
                                                </button>
                                                <button type="submit" rel="tooltip" class="btn btn-danger" name="delBtn'.$row["id"].'">
                                                    <i class="material-icons">close</i>
                                                </button>
                                              </form>
                                            </td>
                                          </tr>
                                          <!-- Modal chỉnh sửa -->
                                          <div class="modal fade" id="editModal'.$row["id"].'" tabindex="-1" role="">
                                            <div class="modal-dialog" role="document">
                                              <div class="modal-content">
                                                <form method="post" class="needs-validation" novalidate>
                                                <div class="modal-header">
                                                  <h4 class="modal-title" id="addModalTitle">Cập nhật thông tin <strong>'.$row["fullname"].'</strong></h4>
                                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                </div>
                                                <div class="modal-body">
                                                  <div class="form-group bmd-form-group">
                                                  <div class="input-group">
                                                    <div class="input-group-prepend">
                                                      <div class="input-group-text"><i class="material-icons">phone</i></div>
                                                     </div>
                                                     <input type="text" name="empNumber" id="empNumber" class="form-control" placeholder="'.$row["phone"].'" pattern="\d{10,10}" required>
                                                     </div>
                                                  </div>
                                                  <div class="form-group bmd-form-group">
                                                  <div class="input-group">
                                                    <div class="input-group-prepend">
                                                      <div class="input-group-text"><i class="material-icons">location_city</i></div>
                                                     </div>
                                                     <input type="text" name="empAddress" id="empAddress" class="form-control" placeholder="'.$row["address"].'" required>
                                                     </div>
                                                  </div>
                                                  <div class="form-group bmd-form-group">
                                                  <div class="input-group">
                                                    <div class="input-group-prepend"><div class="input-group-text"><i class="material-icons">person_pin</i></div></div>
                                                    <select class="custom-select" name="empJob">
                                                      <option value="Phục vụ" selected>Phục vụ</option>
                                                      <option value="Chế biến">Chế biến</option>
                                                      <option value="Kế toán">Kế Toán</option>
                                                    </select>
                                                  </div>
                                                  <div class="form-group bmd-form-group">
                                                  <div class="input-group">
                                                    <div class="input-group-prepend">
                                                      <div class="input-group-text"><i class="material-icons">insert_photo</i></div>
                                                     </div>
                                                     <input type="text" name="empAvatar" id="empAvatar" class="form-control" placeholder="'.$row["avatar"].'" required>
                                                     </div>
                                                  </div>
                                                </div>
                                                <div class="modal-footer">
                                                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                  <input type="submit" name="ediBtn'.$row["id"].'" class="btn btn-success" value="Cập nhật">
                                                </div>
                                              </form>
                                              </div>
                                            </div>
                                          </div>
                                          ';
                                          $deleteBtn = "delBtn".$row['id'];
                                          if (isset($_POST[$deleteBtn])) { //Kiểm tra nút xóa có được nhấn hay chưa
                                            $del = "DELETE FROM employees WHERE id = '".$row['id']."'";
                                            $del_query = mysqli_query($conn, $del); //Thực thi câu lệnh xóa
                                            echo '<script type="text/javascript">
                                                  window.location.href = "employee.php";
                                                  </script>'; //Dùng JS để load lại page sau khi xóa
                                              }
                                          $editBtn = "ediBtn".$row['id'];
                                          if (isset($_POST[$editBtn])){
                                            $edi = "UPDATE employees SET phone='".$_POST["empNumber"]."', address='".$_POST["empAddress"]."', job='".$_POST["empJob"]."', avatar='".$_POST["empAvatar"]."' WHERE id='".$row["id"]."'";
                                            $edi_query = mysqli_query($conn, $edi); //Thuc thi cau lenh update
                                            echo '<script type="text/javascript">
                                                  window.location.href = "employee.php";
                                                  </script>'; //Dùng JS để load lại page sau khi update
                                          }
                                  }
                                }
                                ?>
                              </tbody>
                            </table>
                        </section>
                    </div>
                    <div class="tab-pane" id="shift">
                      <nav aria-label="breadcrumb" role="navigation">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Nhân viên</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Ca trực</li>
                        </ol>
                      </nav>
                      <hr>
                      <nav aria-label="breadcrumb" role="navigation">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Nhân viên</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Nhân viên trực</li>
                        </ol>
                      </nav>
                    </div>
                    <div class="tab-pane" id="salary">
                      <nav aria-label="breadcrumb" role="navigation">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item"><a href="#">Nhân viên</a></li>
                          <li class="breadcrumb-item active" aria-current="page">Lương nhân viên</li>
                        </ol>
                      </nav>
                    </div>
                </div>
            </div>
          </div>
          
        </div>
      </main>
  </body>
  <footer class="footer footer-default" >
    <div class="container">
      <nav class="float-left">
        <ul>
          <li>
          &copy;
          <script>
              document.write(new Date().getFullYear())
          </script>
          </li>
        </ul>
      </nav>
      <div class="copyright float-right">
          Made with <i class="material-icons">all_inclusive</i> love by
          Giang
      </div>
    </div>
  </footer>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
<script src="assets/js/plugins/moment.min.js"></script>
<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Google Maps Plugin  -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="assets/js/plugins/bootstrap-tagsinput.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="assets/js/plugins/bootstrap-selectpicker.js" type="text/javascript"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="assets/js/plugins/jasny-bootstrap.min.js" type="text/javascript"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
<script src="assets/js/material-kit.js?v=2.1.1" type="text/javascript"></script></body>
</html>