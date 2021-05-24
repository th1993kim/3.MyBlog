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
}
.scontent_content{
	width:1170px;
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
			<table width="1180px" id="studyTable">
				<caption>글 작성</caption>
				<tr>
					<th>제목</th><td><input type="text" name="study_title" class="study_title"></td>
				</tr>
				<tr class="numChecking">
					<td colspan="3">
						<span class="nameTag">색상 : </span><input type="text" name="scontentList[0].scontent_color" value="black" class="textCss scontent_color" />
						<span class="nameTag">폰트 크기 : </span><input type="text" name="scontentList[0].scontent_size" value="1.2rem" class="textCss scontent_size" />
						<span class="nameTag">폰트 굵기 : </span><input type="text" name="scontentList[0].scontent_weight" value="500"  class="textCss scontent_weight" />
						<textarea  name="scontentList[0].scontent_content" class="scontent_content"></textarea>
						<input type="hidden" name="scontentList[0].scontent_order_no" class="order_no scontent_order_no" value="0" />
						</td>
				</tr>
				<tr class="addButton">
					<td colspan="3"><input type="button" id="contentAdd" value="내용 추가"/><input type="button" id="fileAdd" value="파일 추가" /></td>
				</tr>
			</table>
			<input type="hidden" name="so_no" value="${search.so_no}" />
			<input type="hidden" name="dae_no" value="${search.dae_no}" />
			<input type="submit" name="regist" class="inputBtn" value="확인" />
			<input type="button" name="previous" class="inputBtn" value="취소" />
		</form>
	</div>

<script>
	
	$(function(){ 
		
		/* 색상변경 */
		$(document).on("keyup",'.scontent_color',function(){
			var color=$(this).val();
			$(this).nextAll("textarea").first().css('color',color);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		}); 
		 
		/* 폰트크기 변경 */
		$(document).on("keyup",'.scontent_size',function(){
			var size=$(this).val();
			$(this).nextAll("textarea").first().css('font-size',size);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		});  
		
		/* 폰트 굵기 변경 */
		$(document).on("keyup",'.scontent_weight',function(){
			var weight=$(this).val();
			$(this).nextAll("textarea").first().css('font-weight',weight);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		}); 
		
		/* 이미지 너비 변경 */
		$(document).on("keyup",'.simg_width',function(){
			var width=$(this).val();
			$(this).nextAll("img").first().css('width',width);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		}); 
		
		/* 이미지 높이 변경 */
		$(document).on("keyup",'.simg_height',function(){
			var height=$(this).val();
			$(this).nextAll("img").first().css('height',height);
			/* .next는 다음요소에 바로 값이 없으면 해당 선택요소를 못가져온다. */
		}); 
		
		
		/* 내용 추가시  */
		$(document).on("click","#contentAdd",function(){
			$('.addButton').remove();
			var str ="" 	
				    str+='<tr class="numChecking">';
				    str+='	<td colspan="3">'
					str+='		<span class="nameTag">색상 : </span><input type="text" name="" value="black" class="textCss scontent_color" />';
					str+='		<span class="nameTag">폰트 크기 : </span><input type="text" name="" value="1.2rem" class="textCss scontent_size" />';
					str+='		<span class="nameTag">폰트 굵기 : </span><input type="text" name="" value="500"  class="textCss scontent_weight" />';
					str+='		<textarea  name="" class="scontent_content"></textarea>';
					str+='		<input type="button" value="위" class="positionUp" >';
					str+='		<input type="button" value="아래" class="positionDn">';
					str+='		<input type="button" value="삭제" class="trDelete">';
					str+='       <input type="hidden" name="" class="order_no scontent_order_no" value="" />';
					str+='	</td>';
					str+='</tr>';
					str+='<tr class="addButton">';
					str+='	<td colspan="3"><input type="button" id="contentAdd" value="내용 추가"/><input type="button" id="fileAdd" value="파일 추가" /></td>';
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
					str+='		<span class="nameTag">이미지 너비 : </span><input type="text" name="" value="100%" class="textCss simg_width" />';
					str+='		<span class="nameTag">이미지 높이 : </span><input type="text" name="" value="" class="textCss simg_height" />';
					str+=' 		<input type="file" name="imgfiles" class="fileUpload">'; 
					str+='		<input type="button" value="위" class="positionUp" >';
					str+='		<input type="button" value="아래" class="positionDn">';
					str+='		<input type="button" value="삭제" class="trDelete">';
					str+='  		<input type="hidden" name="" class="order_no simg_order_no" />';
					str+='  		<input type="hidden" name="" value="0" class="is_upload" />';
					str+=' 	</td>';
					str+='</tr>';
					str+='<tr class="addButton">';
					str+='	<td colspan="3"><input type="button" id="contentAdd" value="내용 추가"/><input type="button" id="fileAdd" value="파일 추가" /></td>';
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
			var width=$(this).prevAll('.simg_width').first().val();
			var height=$(this).prevAll('.simg_height').first().val();
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
		$(this).siblings('.scontent_content').prop('name',"scontentList["+index+"].scontent_content");
		$(this).siblings('.scontent_order_no').prop('name',"scontentList["+index+"].scontent_order_no");
	});	
	
	$('.simg_width').each(function(index){
		$(this).prop('name',"simgList["+index+"].simg_width")
		$(this).siblings('.simg_height').first().prop('name',"simgList["+index+"].simg_height")
		$(this).siblings('.simg_order_no').first().prop('name',"simgList["+index+"].simg_order_no")
		$(this).siblings('.is_upload').first().prop('name',"simgList["+index+"].is_upload")
		
	});
		
} 	 
    
</script>
</body>
</html>