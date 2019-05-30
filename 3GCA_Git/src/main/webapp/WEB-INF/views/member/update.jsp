<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/view_user.js"></script>
<div class="container">
	<div class="card bg-light">
		<article class="card-body mx-auto" style="max-width: 400px;">
			<h4 class="card-title mt-3 text-center">개인 정보 수정</h4>
			<p class="text-center">계정 정보를  변경합니다</p>

			<p class="divider-text">
				<span class="bg-light">계정 변경</span>
			</p>
			<form role="form" action="update" method="post" onsubmit="return validate()">
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input id="id" name="id" class="form-control" placeholder="아이디 "
						type="text" value="${userInfo.id}" readonly>
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input id="pw" name="pw" class="form-control" placeholder="비밀번호"
						type="password" value="${userInfo.pw}">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input id="pw2" class="form-control" placeholder="비밀번호 확인" type="password">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input id="name" name="name" class="form-control" placeholder="이름 "
						type="text" value="${userInfo.name}">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fas fa-portrait"></i>
						</span>
					</div>
					<input id="nick" name="nick" class="form-control" placeholder="닉네임 "
						type="text" value="${userInfo.nick}">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i
							class="fas fa-birthday-cake"></i>
						</span>
					</div>
						 &nbsp;birthday :&nbsp;
						<fmt:formatDate value="${userInfo.birthDate}" pattern="yyyy년  MM월 dd일"/>
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-phone"></i>
						</span>
					</div>
					<input id="phone" name="phone" class="form-control" placeholder="전화 번호"
						type="text" value="${userInfo.phone}">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-building"></i>
						</span>
					</div>
					
					&nbsp;
					<c:choose>
						<c:when test="${userInfo.classType == 1 }">관리자</c:when>
						<c:when test="${userInfo.classType == 2 }">총대</c:when>
						<c:when test="${userInfo.classType == 3 }">회원</c:when>
						<c:when test="${userInfo.classType == 4 }">버스기사</c:when>
					</c:choose>
				</div>
				<!-- form-group end.// -->
				
				 <div class="form-group">
		        	<button type="button" class="btn btn-danger btn-block" id='deleteBtn'> 회원 탈퇴  </button>
		    	</div> <!-- form-group// -->  
				
<%-- 				 <!-- 회원삭제 modal -start-->
				<div class="modal fade" id="checkDel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true"></span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>
				        	계정이 삭제됩니다.<br>
				        	정말로  탈퇴하시겠습니까?<br>
				        </p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-danger" onclick="location.href='deleteMember?id=${userInfo.id}'">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
			   <!-- 회원삭제 modal -end -->
				
				 --%>
			<div class="form-group">
	        	<button type="submit" class="btn btn-primary  btn-block"> 회원 정보 변경  </button>
	    	</div> <!-- form-group// -->        
	    	
	    	<div class="form-group">
	       		<a href="<%=request.getContextPath()%>/">취소</a> <!-- 홈으로 돌아가기 -->
	    	</div> <!-- form-group// -->                                                        
			
			</form>
		</article>
	</div>
	<!-- card.// -->
</div>

<form id='deleteForm' action="/member/deleteMember" method="post">
	<input type='hidden' id='id' name='id' value='<c:out value="${userInfo.id}"/>'>

</form>
<script type="text/javascript">
	$(document).ready(function() {

		var deleteForm = $("#deleteForm");
		
		$("#deleteBtn").on("click", function(e) {

			if (confirm("계정이 삭제됩니다. 정말로  탈퇴하시겠습니까?")) {
				deleteForm.attr("action", "/member/deleteMember").submit();
				alert("탈퇴되었습니다.");
			} else {
				// 취소 버튼 클릭 시 동작
				alert("취소했습니다.");
			}

		});

	});
</script>
<%@include file="../includes/footer.jsp"%>
