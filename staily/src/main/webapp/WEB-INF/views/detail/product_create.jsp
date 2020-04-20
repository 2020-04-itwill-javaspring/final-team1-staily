<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product_create.css"/>
<script src="${pageContext.request.contextPath}/css/admin/vendor/jquery/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/gu-upload/css/guupload.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/gu-upload/css/guupload2.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/gu-upload/guuploadManager.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/gu-upload/guuploadManager2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>

<!-- Hero -->
<div id="content_hero">
	<a href="#afterHeader" class="anchor"> <img
		src="${pageContext.request.contextPath}/images/scroll-arrow.svg"
		alt="Scroll down" class="scroll" />
	</a>
	
	<iframe class="ww"
			src="https://www.youtube-nocookie.com/embed/obX621oa9RM?autoplay=0&amp;loop=1;&playlist=isls26FGUaA&controls=0&vq=hd1080"
			frameborder="0"	allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen style="position: absolute;left: -0%;width: 100%;height: 100%;top: 0%;"></iframe>
			
	<!-- Content -->
	<div class="container">
		<div class="row blurb scrollme animateme" data-when="exit" data-from="0" data-to="1" data-opacity="0" data-translatey="100">
			<div class="col-md-9">
				<span class="title"></span>
				<h1></h1>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="sceneUp" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">
								이미지 업로드
							</h4> 
						</div>
 						<div class="modal-body" id="body">
 							<form id="sceneUpload" method="post">
	 							<div id="uploadScene" style="width: 100%;"></div>
								<input type="hidden" id="realname1" name="realname1"/>
								<input type="hidden" id="filename1" name="filename1"/>
								<input type="hidden" id="filesize1" name="filesize1"/>
 							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="modal1_click">올리기</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
</div>

<!-- 모달 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="imageUp" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">
								이미지 업로드
							</h4> 
						</div>
 						<div class="modal-body" id="body">
 							<form id="imageUpload" method="post">
	 							<div id="uploadImage" style="width: 100%;"></div>
								<input type="hidden" id="realname2" name="realname2"/>
								<input type="hidden" id="filename2" name="filename2"/>
								<input type="hidden" id="filesize2" name="filesize2"/>
 							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="modal2_click">올리기</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
</div>

<div style="margin:3%;">
	<div class="left">
		<div class="wrap" style="height: auto;">
			<input type="button" class="button_css2" value="작품 검색" onClick="work_search()">
		</div>
		<form name="work" method="post">
			<table class="table table=hover">
				<colgroup>
					<col class="col_wp25">
					<col class="col_auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wName">
								작품명</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								${workOne.getwName()}
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wCategory">
								카테고리</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<c:choose>
									<c:when test="${workOne.getwCategory() eq 'D'}">
										드라마
									</c:when>
									<c:otherwise>
										영화
									</c:otherwise>
								</c:choose>						
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wDate">
								처음 방영(개봉)일</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<fmt:parseDate value="${workOne.getwDate()}" var="dateFormat" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${dateFormat}" pattern="yyyy-MM-dd(E)" type="both"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wTepisode">
								전체 회차</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								${workOne.getwTepisode()}부작
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2" class="bg-light essentia" style="text-align: center;"><label for="wPoster">
								작품 포스터</label></th>
					</tr>
					<tr>
						<th colspan="2" style="text-align: center;">
						<img src='https://image.tmdb.org/t/p/w600_and_h900_bestv2/${workOne.wPoster}' width='280px' height='400px'></th>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	<div class="right">
		<form name="createP" method="post">
			<input type="hidden" id="wNo" name="wNo" value="${workOne.wNo}">
			<table class="table table=hover">
				<colgroup>
					<col class="col_wp25">
					<col class="col_auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="wdEpisode">
								상품이 나온 회차</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<select id="wdEpisode" name="wdEpisode">
									<c:forEach var="i" begin="1" end="${workOne.wTepisode}">
										<option value="${i}">${i}화</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pName">
								상품명 <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pName" id="pName" class="form-control"
									maxlength="20">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pPrice">
								가격 <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pPrice" id="pPrice" class="form-control"
									maxlength="20" placeholder="숫자만 입력 가능합니다">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pUrl">
								쇼핑몰 URL <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pUrl" id="pUrl" class="form-control"
									maxlength="20">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pAddress">
								주소</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<input type="text" name="pAddress" id="pAddress" value="${param.pAddress}"
									onclick="execDaumPostcode()" placeholder="이 곳을 클릭하세요" class="form-control" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pDaddress">
								상세 주소</label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">					
								<input type="text" name="pDaddress" id="pDaddress" class="form-control"
									maxlength="20" placeholder="주소를 먼저 입력하세요" readonly>								
							</div>
						</td>
					</tr>					
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pScene">
								상품이 나온 장면<br>(최대 1장) <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<button id="modal-scene" type="button" class="button_css" 
								data-toggle="modal" data-target="#sceneUp">이미지 업로드</button>
								<div id="uploadedScene" style="padding-top: 7px"></div>
							</div>
						</td>
					</tr>	
					<tr>
						<th scope="row" class="bg-light essentia"><label for="pScene">
								상품 이미지<br>(최대 10장) <span style="color: red;">*</span></label></th>
						<td class="text-left" style="text-align: left;">
							<div class="col">
								<button id="modal-image" type="button" class="button_css" 
								data-toggle="modal" data-target="#imageUp">이미지 업로드</button>
								<div id="uploadedImage" style="padding-top: 7px"></div>
															
							</div>
						</td>
					</tr>	
					<tr>
						<th scope="row" class="bg-light essentia" colspan="2"><label for="pScene">
								<span style="color: red;">*</span>은(는) 필수 항목입니다.</label></th>
					</tr>
				</tbody>		
			</table>
			<c:forEach var="i" begin="1" end="${cnt}" varStatus="status">
				<c:set var="a" value="Image${i}"/>
				<input type="hidden" id="filesize2${i}" name="filesize2" value="${requestScope[a]}"/>
			</c:forEach>
			<div class="wrap" style="height:auto;">
				<button class="button_css" type="button" onClick="productCreate()">작성하기</button>
				<button class="button_css" type="reset">다시 쓰기</button>
			</div>
			
		</form>
	</div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/detail/include_detail_js.jsp"%>
<script src="${pageContext.request.contextPath}/js/custom_js/detail.js"></script>
<script>
var guManager = null;
var guManager2 = null;

window.onload = function() {
	
	var option = {
		listtype : "thumbnail",
		fileid : "uploadScene",
		uploadURL : "upload",
		maxFileCount : 1,
		maxFileSize : 3,
		afterFileTransfer : afterFileTransfer
	}
	
	guManager = new guUploadManager(option);
	
	var option2 = {
			listtype : "thumbnail",
			fileid : "uploadImage",
			uploadURL : "upload2",
			maxFileCount : 10,
			maxFileSize : 3,
			afterFileTransfer : afterFileTransfer2
		}
	
	guManager2 = new guUploadManager2(option2);
}

function afterFileTransfer(realname1, filename1, filesize1) {

	var realname9 = document.getElementById('realname1');
	var filename9 = document.getElementById('filename1');
	var filesize9 = document.getElementById('filesize1');

	realname9.value = realname1;
	filename9.value = filename1;
	filesize9.value = filesize1;
	
	$('#sceneUp').hide(function() {
		$("#modal-scene").hide();
		document.getElementById('uploadedScene').innerHTML = $("#filename1").val();
	});
}

$("#modal1_click").on("click", function(e) {
	var check = $('.filerow').val();
	
	if(check == null) {
		swal({
			title: "이미지를 업로드 해주세요",
			icon: "warning" //"info,success,warning,error" 중 택1
		});	
	}
	else {
		guManager.uploadFiles();
	}
		
});

function afterFileTransfer2(realname2, filename2, filesize2) {

	var realname90 = document.getElementById('realname2');
	var filename90 = document.getElementById('filename2');
	var filesize90 = document.getElementById('filesize2');

	realname90.value = realname2;
	filename90.value = filename2;
	filesize90.value = filesize2;
	
	$('#imageUp').hide(function() {
		document.getElementById('uploadedImage').innerHTML = $("#filename2").val();
	});
}

$("#modal2_click").on("click", function(e) {
	var check = $('.filerow').val();
	
	if(check == null) {
		swal({
			title: "이미지를 업로드 해주세요",
			icon: "warning" //"info,success,warning,error" 중 택1
		});	
	}
	else {
		guManager2.uploadFiles();
	}
		
});
</script>
</html>