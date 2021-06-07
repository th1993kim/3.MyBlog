<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles를 사용하기 위한 taglib 지시어  --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%-- jstl를 사용하기 위한 taglib 지시어 --%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- contextPath를 변수명이 contextPath에 담는 jstl의 core 부분 --%>
<c:set var="contextPath" value ="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<style>
.studyWrite-container{
	margin:0 auto;
	width:1180px;
}
.study_title{ 
	width:90%;
	margin:0px;
}
.scontent_content{
	width:1140px;
	height:120px;
} 
.numChecking td{
	padding:0px !important;
}
.lineremove td{ 
	border:0px !important;
}
.backGround{
	background-color:#343a40;
	color:white;
} 
.textCustom{
	height:32px;
	padding: 3px 10px;
}
.textCustom input[type=text]{
	border:0px;
	height:20px;
}
.imgCustom{
	height:32px;
	padding: 3px 10px;
	display:inline-block;
}
.imgCustom input[type=text]{
	border:0px;
	height:20px;
}
.buttonsPosition{
	display:inline-block;
	width:35px; 
	position:relative;  
}
.buttonsPosition .positionUp {
	position:absolute;
	bottom:77px;
}
.buttonsPosition .positionDn {
	position:absolute;
	bottom:45px;
}
.buttonsPosition .trDelete {
	position:absolute;
	bottom:6px;
}
.submitPosition{
	text-align:center;
}

/* input type file의 css */
.file-input-css{
	position:relative;
	display:inline-block;
	height:31px;
	top:11px;
}
.file-input-text{
	float:left;
	height:31px;
	width:200px;
	font-size:10px;
	border:0px;
}
.file-input-div{
	position:relative;
	width:120px;
	height:31px;
	overflow: hidden;
}
.file-input-hidden{
	font-size:45px;
	position:absolute;
	right:0px;
	top:0px;
	opacity:0;
	cursor:pointer;
	 
	filter: alpha(opacity=0);
	-ms-filter:"alpha(opacity=0)";
	-khtml-opacity:0;
	-moz-opacity:0;
}
.file-input-button{
	position:absolute;
	top:0px;
	width:120px; 
	height:31px !important; 
	padding:0px !important; 
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="studyWrite-container">
		<form id="writeForm" method="post" action="${contextPath}/study/studyWrite" enctype="multipart/form-data">
			<table width="1180px" id="studyTable" class="table lineremove"> 
				<tr>
					<td>제목</td><td><input type="text" name="study_title" class="study_title"></td>
				</tr> 
				<tr class="numChecking">
					<td colspan="3">
						<div class="textCustom">
							<span class="nameTag">색상 : </span><input type="text" name="scontentList[0].scontent_color" value="black" class="textCss scontent_color" />
							<span class="nameTag">폰트 크기 : </span><input type="text" name="scontentList[0].scontent_size" value="1.2rem" class="textCss scontent_size" />
							<span class="nameTag">폰트 굵기 : </span><input type="text" name="scontentList[0].scontent_weight" value="500"  class="textCss scontent_weight" />
						</div>
						<textarea  name="scontentList[0].scontent_content" class="scontent_content" wrap="hard"></textarea>
						<input type="hidden" name="scontentList[0].scontent_order_no" class="order_no scontent_order_no" value="0" />
					</td>
				</tr>
				<tr class="addButton">
					<td colspan="3"><input type="button" id="contentAdd" value="Content +" class="btn btn-outline-dark"/><input type="button" id="fileAdd" value="File +" class="btn btn-outline-dark"/></td>
				</tr>
			</table>  
			<input type="hidden" name="so_no" value="${search.so_no}" />
			<input type="hidden" name="dae_no" value="${search.dae_no}" />
			<div class="submitPosition">
				<c:if test="${!empty loginMember}"><input type="submit" name="regist" class="inputBtn btn btn-primary"  value="확인" /></c:if>
				<input type="button" name="previous" id="beforPageButton" class="inputBtn btn btn-primary" value="취소" />
			</div> 
		</form> 
	</div> 

<script>
	
	$(function(){ 
		
		/* 색상변경 */
		$(document).on("keyup",'.scontent_color',function(){
			var color=$(this).val();
			$(this).parents("div").first().nextAll("textarea").css('color',color);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		});  
		 
		/* 폰트크기 변경 */
		$(document).on("keyup",'.scontent_size',function(){
			var size=$(this).val();
			$(this).parents("div").first().nextAll("textarea").css('font-size',size);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		});  
		
		/* 폰트 굵기 변경 */
		$(document).on("keyup",'.scontent_weight',function(){
			var weight=$(this).val();
			$(this).parents("div").first().nextAll("textarea").css('font-weight',weight);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		}); 
		
		/* 이미지 너비 변경 */
		$(document).on("keyup",'.simg_width',function(){
			var width=$(this).val(); 
			$(this).parents("div").first().nextAll("img").css('width',width);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		}); 
		
		/* 이미지 높이 변경 */
		$(document).on("keyup",'.simg_height',function(){
			var height=$(this).val();
			$(this).parents("div").first().nextAll("img").css('height',height);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		}); 
		
		
		/* 내용 추가시  */
		$(document).on("click","#contentAdd",function(){
			$('.addButton').remove();
			var str ="" 	
				    str+='<tr class="numChecking">';
				    str+='	<td colspan="3">';
				    str+='		<div class="textCustom">';			
					str+='			<span class="nameTag">색상 : </span><input type="text" name="" value="black" class="textCss scontent_color" />';
					str+='			<span class="nameTag">폰트 크기 : </span><input type="text" name="" value="1.2rem" class="textCss scontent_size" />';
					str+='			<span class="nameTag">폰트 굵기 : </span><input type="text" name="" value="500"  class="textCss scontent_weight" />';
					str+='      </div>';
					str+='		<textarea  name="" class="scontent_content"></textarea>';
					str+='		<div class="buttonsPosition">';		
					str+='			<input type="button" value="▲" class="positionUp btn btn-secondary btn-sm" >';
					str+='			<input type="button" value="▼" class="positionDn btn btn-secondary btn-sm">';
					str+='			<input type="button" value="X" class="trDelete btn btn-danger btn-sm">'; 
					str+='       	<input type="hidden" name="" class="order_no scontent_order_no" value="" />';
					str+='       </div>';
					str+='	</td>';
					str+='</tr>';
					str+='<tr class="addButton">';
					str+='	<td colspan="3"><input type="button" id="contentAdd" value="Content +" class="btn btn-outline-dark"/><input type="button" id="fileAdd" value="File +" class="btn btn-outline-dark"/></td>';
					str+='</tr>';
			$(str).appendTo('#studyTable');
			reposition();
		});
		
		/* 이미지 파일 추가 시  */
		$(document).on('click','#fileAdd',function(){
			$('.addButton').remove();
			var str =""; 
					str+='<tr class="numChecking">';
					str+='	<td colspan="3">';
					str+='		<div class="imgCustom">';		
					str+='			<span class="nameTag">이미지 너비 : </span><input type="text" name="" value="100%" class="textCss simg_width" />';
					str+='			<span class="nameTag">이미지 높이 : </span><input type="text" name="" value="" class="textCss simg_height" />';
					str+='      </div>';
					str+='      <div class="file-input-css">';
					str+='     	 	<input id="fileName" class="file-input-text" readonly />';
					str+='     		<div class="file-input-div">';
					str+='              <input type="button" value="File Upload" class="file-input-button btn btn-primary btn-sm">';
					str+=' 				<input type="file" name="imgfiles" class="fileUpload file-input-hidden">';
					str+='      		</div>';   
					str+=' 		</div>';
					str+='		<input type="button" value="▲" class="positionUp btn btn-secondary btn-sm" >';
					str+='		<input type="button" value="▼" class="positionDn btn btn-secondary btn-sm">';
					str+='		<input type="button" value="X" class="trDelete btn btn-danger btn-sm">'; 
					str+='  		<input type="hidden" name="" class="order_no simg_order_no" />';
					str+='  		<input type="hidden" name="" value="0" class="is_upload" />';
					str+=' 	</td>';
					str+='</tr>';
					str+='<tr class="addButton">';
					str+='	<td colspan="3"><input type="button" id="contentAdd" value="Content +" class="btn btn-outline-dark"/><input type="button" id="fileAdd" value="File +" class="btn btn-outline-dark"/></td>';
					str+='</tr>';
			$(str).appendTo('#studyTable');
			reposition();
		});	
		
		
		
		
		
		/* tr영역 삭제 */
		$(document).on("click",".trDelete",function(){
			$(this).parents('tr').remove();
			reposition();
		});
		
		/* 위치 위로 */
		$(document).on('click',".positionUp",function(){
			var tr = $(this).parents('tr');
			if($(this).nextAll('.order_no').val()>1){
				tr.insertBefore(tr.prevAll('tr').first());
			}
			reposition();
		});
		
		/* 위치 아래로 */
		$(document).on('click',".positionDn",function(){
			var tr = $(this).parents('tr');
			if($(this).nextAll('.order_no').val()<$('.numChecking').length-1){
				tr.insertAfter(tr.nextAll('tr').first());
			}
			reposition();
		});
		
		/* 이미지 미리보기 */
		$(document).on("change",".fileUpload",function(file){ //file은 이벤트 객체
			var imgfile = file.target.files[0]; //원래는 multifile을 불러오나 [0]번째 index는 첫번재 것만 불러온다
			var str ="";   //target은 event객체의 엘리먼트를 알려준다
			var td = $(this).parents('td').first();
			var fileName = $(this).parents('div').first().prevAll('.file-input-text').first();
			var width=$(this).prevAll('.simg_width').first().val();
			var height=$(this).prevAll('.simg_height').first().val();
			var fName=imgfile.name; 
			if(imgfile.type.match('image.*')){
				var reader = new FileReader();
				 
				/* 
				xogus005
				
					파일의 URL을 읽어온다 . 다른방법으로는
					readAsText() 텍스트만
					readAsArrayBuffer 버퍼로 데이터 저장
					readAsBinaryString 이진데이터 반환
				*/
				reader.readAsDataURL(imgfile);
				//onload 는 데이터 불러오기 성공했을때 이벤트를 실시한다.
				reader.onload=function(f){
					str+="<img src='"+f.target.result+"' style='width:"+width+";height:"+height+";'>"; //IMG 태그 추가
					$(td).find('.is_upload').val(1); //파일 업로드시에 확인용 value
					$(td).find('img').remove();
					$(str).appendTo(td); //만들어진 IMG 태그 보내기
					$(fileName).val(fName);
				}
			}
	
			/* multifile 업로드인 경우는
			 var imgfiles = file.target.files;
			 var filesArr = Array.prototype.slice.call(imgfiles);
			 var index = 0;
			 filesArr.forEach(function(f)){
				 if(!f.type.match('image.*')){
					 return;
				 }
				 sel_files.push(f);
				 var reader = new FileReader();
				 reader.onload = function(e){
					 var html="";
					 ~~append
					 index++;
				 }
				 reader.readAsDataURL(f);
			 }
			 
				});
			
			*/
		});
	
		$('#beforPageButton').click(function(){
			goBack();
		});
	
	});
	/* 동적 처리시 parameter,name 재정렬 function */
function reposition(){
		
	$('.numChecking').each(function(index){
		$(this).find('.order_no').first().val(index);
	});
	
	 
	$('.scontent_color').each(function(index){ 
		$(this).prop('name',"scontentList["+index+"].scontent_color");
		$(this).siblings('.scontent_size').prop('name',"scontentList["+index+"].scontent_size");
		$(this).siblings('.scontent_weight').prop('name',"scontentList["+index+"].scontent_weight");
		$(this).parents('div').nextAll('.scontent_content').prop('name',"scontentList["+index+"].scontent_content");
		$(this).parents('div').nextAll('div').find('.scontent_order_no').prop('name',"scontentList["+index+"].scontent_order_no");
	});	 
	
	$('.simg_width').each(function(index){
		$(this).prop('name',"simgList["+index+"].simg_width")
		$(this).siblings('.simg_height').first().prop('name',"simgList["+index+"].simg_height")
		$(this).parents('div').nextAll('.simg_order_no').first().prop('name',"simgList["+index+"].simg_order_no")
		$(this).parents('div').nextAll('.is_upload').first().prop('name',"simgList["+index+"].is_upload")
	}); 
		
} 	 
//이전페이지 가기 함수	
function goBack(){
	window.history.back();
}    
</script>
</body>
</html>