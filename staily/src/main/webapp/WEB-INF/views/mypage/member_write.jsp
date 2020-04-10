<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>
<%@ include file="/WEB-INF/views/mypage/include/include_top.jsp" %>
<html>

<head>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
	<%@ include file="/WEB-INF/views/mypage/include/include_nav.jsp" %>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">


            

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">내가쓴글목록</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">내가쓴글목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>상품화면</th>
                      <th>상품이름</th>
                      <th>상품번호</th>
                      <th>회원번호</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="product" items="${data}">
                  	 <tr>
                  	  <td><input type="checkbox" name="member_write_check" value="${product.pNo}"></td>
                      <td style = "cursor:pointer;" onClick = " location.href='admin/'">
                      <img src="${pageContext.request.contextPath}/${product.pScene}" width="50px" height="50px"></td>
                      <td>${product.pName}</td>
                      <td>${product.pNo}</td>
                      <td>${product.mNo}</td>
                      <td>${product.pDate}</td>
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
                <input type="button" class="btn btn-outline btn-primary pull-right" value="삭제" id="deleteWriteBtn">
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

	<!-- Bootstrap core JavaScript-->
  <script src="../../../${pageContext.request.contextPath}/css/admin/vendor/jquery/jquery.min.js"></script>
  <script src="../../../${pageContext.request.contextPath}/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../../${pageContext.request.contextPath}/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../../${pageContext.request.contextPath}/css/admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../../../${pageContext.request.contextPath}/css/admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../../../${pageContext.request.contextPath}/css/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../../../${pageContext.request.contextPath}/css/admin/js/demo/datatables-demo.js"></script>

<script type="text/javascript">
$(function(){
	$('#deleteWriteBtn').click(function(e){
		var size = document.getElementsByName("member_write_check").length;
		for (var i = 0; i < size; i++) {
			if(document.getElementsByName("member_write_check")[i].checked == true){
				var pNo = document.getElementsByName("member_write_check")[i].value;
				member_write_delete_function(pNo);
			}
			
		}
		
	});
	function member_write_delete_function(pNo){
		$.ajax({
			url : "member_write_delete",
			method : "GET",
			data : 'pNo='+pNo,
			dataType : "text",
			success : function(result){
				location.reload();
			}
		})
	}
	
	
})
</script>
</body>

</html>
