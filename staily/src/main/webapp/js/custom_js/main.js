$(document).ready(function(){
	$('.slick-carousel.newIn').not('.slick-initialized').slick({
		autoplay: false,
		autoplaySpeed: 3000,
		slidesToShow: 4,
		centerPadding: '60px',
		prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
		nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
		responsive: [
		    {
		      breakpoint: 768,
		      settings: {
		        slidesToShow: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1
		      }
		    }
		  ]
	});
});
$(function(){
	//worklist 회차 출력
	$('#workEpisode').change(function(e){
		var contextPath = $("option:selected").attr("contextPath");
		var wNo = $("option:selected").attr("wNo");
		var wdEpisode = $("option:selected").val();
		var params = 'wNo='+wNo+'&wdEpisode='+wdEpisode;
		$.ajax({
			url:'worklist_read/detail',
			method:'GET',
			data:params,
			dataType:'json',
			success:function(jsonData){
				var html = "";
				var cweArray = jsonData.cwe;
				var mweArray = jsonData.mwe;

				//html += "<div class='col-sm-9 col-sm-push-1'>";
				html += "<div class='slick-carousel newIn'>";
				
				for (var i = 0; i < cweArray.length; i++) {
					var cweProduct =cweArray[i].product;
					
					var cpScene = cweProduct[0].pScene;
					var cpName = cweProduct[0].pName;
					var cpView = cweProduct[0].pView;
					var cpMid = cweProduct[0].mId;
					
					html += "<div class='movie-slide'>";
					html += "<div class='movie-poster2'>";
					html += "<a href='#'><img src='"+contextPath+cpScene+"' alt="+cpName+" /></a>";
					html += "</div>";
					html += "<h4 class='no-underline'>"+cpName+"</h4>";
					html += "</div>"
				}
				html += "</div><h2></h2></div>";
				
				
				
				html += "<article>";
				
				
				for (var i = 0; i < mweArray.length; i++) {
					var mweProduct = mweArray[i].product;
					
					var mpMno = mweProduct[0].mNo;
					var mpPno = mweProduct[0].pNo;
					var mpScene = mweProduct[0].pScene;
					var mpName = mweProduct[0].pName;
					var mpView = mweProduct[0].pView;
					var mpMid = mweProduct[0].mId;
					
					html += "<form id='bookmark_"+mpPno+"' style='margin-top:10%;'>";
					html += "<input type='hidden' value='"+mpMno+"' name='mNo'>";
					html += "<input type='hidden' value='"+mpPno+"' name='pNo'>";
					html += "<img src='"+contextPath+mpScene+"' class='news-single-img' alt='"+mpName+"' />";
					html += "<h2 value='상품이름' style='margin:0px;'>"+mpName+"</h2>";
					html += "<div style='float:right;'>";
					html += "<span value='작성자'>작성자: "+mpMid+"</span>";
					html += "<span class='categories tag' value='조회수'>조회수: "+mpView+"</span>";
					html += "<span class='categories tag' value='에피소드'>"+wdEpisode+"회</span>";
					html += "</div>";
					html += "<input type='button' value='즐겨찾기 등록' onclick='create_bookmark("+mpMno+","+mpPno+")'>";
					html += "</form>";
				}
				
				html += "</article>";
				
				$('#work_list_main').empty();
				$('#work_list_main').append(html);
				/******************************/
				$('.slick-carousel.newIn').not('.slick-initialized').slick({
					autoplay: false,
					autoplaySpeed: 3000,
					slidesToShow: 4,
					centerPadding: '60px',
					prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
					nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
					responsive: [
					    {
					      breakpoint: 768,
					      settings: {
					        slidesToShow: 2
					      }
					    },
					    {
					      breakpoint: 480,
					      settings: {
					        slidesToShow: 1
					      }
					    }
					  ]
				});
				/******************************/
			}
		});
		
		e.preventDefault();
	});		
});

function bm_productpage(bmNo,pNo){
	var product_form = document.getElementById('bookmark_'+bmNo);
	product_form.action = "../detail/product_detail";
	product_form.submit();
};
function productpage(pNo){
	var product_form = document.getElementById('product_'+pNo);
	product_form.action = "../detail/product_detail";
	product_form.submit();
};
function workpage(wNo){
	var work_form = document.getElementById('work_'+wNo);
	work_form.action = "worklist_select";
	work_form.submit();
};

/************Controller select_bookmark*******************/
/*
function select_bookmark(mNo,pNo){
	var product_form = document.getElementById('product_'+pNo);
	product_form.action = "select_bookmark";
	product_form.submit();
}
*/
/************RestController select_bookmark*******************/
function select_bookmark(userNo,pNo){
	var params= "userNo="+userNo+"&pNo="+pNo;
	$.ajax({
		url: "select_bookmark",
		method: "POST",
		data: params,
		success:function(){
			location.reload();
		}
	});
	
}
/************Controller create_bookmark*******************/
/*
function create_bookmark(userNo,pNo){
	var product_form = document.getElementById('product_'+pNo);
	alert('즐겨찾기에 상품이 추가되었습니다');
	product_form.action = "create_bookmark";
	product_form.submit();
};
*/
/*************RestController create_bookmark********************/
function create_bookmark(userNo,pNo){
	alert('즐겨찾기에 상품이 추가되었습니다');
	var params= "userNo="+userNo+"&pNo="+pNo;
	$.ajax({
		url: "create_bookmark",
		method:"POST",
		data: params,
		success:function(result){
			console.log(result);
			if(result=='true'){
				
				var html = "<input class='material-icons unbookmarking' type='image' "
						+ "style='border: none; width: 10%; float:left; padding: 0px; margin: 0 5%;' alt='즐겨찾기 제거' "
						+ "src='${pageContext.request.contextPath}/images/star.png' "
						+ "onclick='select_bookmark(${userNo},${cw.product[0].pNo})'>";
			
			$('#bookmarkIcon').empty();
			$('#bookmarkIcon').append(html);
			location.reload();
			}
		}			
	});
};
/************Controller delete_bookmark*******************/
/*
function delete_bookmark(bmNo){
	  var bookmark_form = document.getElementById('bookmark_'+bmNo);
//	  alert("즐겨찾기에서 상품이 제거됐습니다");
	  bookmark_form.action = "delete_bookmark";
	  bookmark_form.submit();
	  window.location.reload();
};
*/
/***********RestController delete_bookmark*******************/
function delete_bookmark(bmNo){
//	  alert("즐겨찾기에서 상품이 제거됐습니다");
		var params= "bmNo="+bmNo;
		$.ajax({
			url: "delete_bookmark",
			method:"POST",
			data: params,
			success:function(result){
				console.log(result);
				if(result=='true'){
					
					var html = "<input class='material-icons bookmarking' type='image' "
								+ "style='border: none; width: 10%; float:left; padding: 0px; margin: 0 5%;' alt='즐겨찾기 등록' "
								+ "src='${pageContext.request.contextPath}/images/emptystar.png' "
								+ "onclick='create_bookmark(${userNo},${cw.product[0].pNo});'>";
				
				$('#bookmarkIcon').empty();
				$('#bookmarkIcon').append(html);
				location.reload();
				}
			}
				
		});
};

/**********************************************************/
function login_advice(){
	alert('로그인이 필요한 작업입니다.');
	location.href="../login/login";
}
