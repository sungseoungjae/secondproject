<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="res/style.css" />
<link rel="stylesheet" href="richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="richtexteditor/rte.js"></script>
<script type="text/javascript"
	src='richtexteditor/plugins/all_plugins.js'></script>
	
<!-- datepicker -->
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<!-- datepicker -->	


<style>
span{
	width:130px;
}
</style>
	
</head>
<body>
<%
int hope = (int)session.getAttribute("hope");
System.out.println(hope);
%>
    <div id="app">
	<c:set var = "power" scope = "session" value = "${hope}"/>
		<c:choose>
		<c:when test="${power == 1}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:when test="${power == 2}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
		<jsp:include page="../sidebar.jsp"></jsp:include>
		</c:otherwise>
		</c:choose>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<!-- ?????? ????????? ??????  -->
			<div class="page-heading">
				<h3>??????????????? ????????????</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card">
						<div class="card-body py-4 px-5">
						<form action="programDetailUpdate" method="post">
							<input type="hidden" name="pr_idx" value="${list.pr_idx}">
							<!-- hidden?????? ???????????? idx??? ???????????? ????????? ?????? ????????? -->
								<div class="d-flex align-items-center">
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">???????????????</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_name" value="${list.pr_name}" autofocus>
									</div>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">?????????</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_teacher" value="${list.pr_teacher}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">????????????</span> 
<!-- 										<input type="text" class="form-control" aria-label="Username"  -->
<%-- 											aria-describedby="basic-addon1" name="pr_start" value="${list.pr_start}" autofocus> --%>
											<input type="text" name="pr_start" id="text1" value="${list.pr_start}" class="datetimepicker" readonly/>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">?????????</span> 
<!-- 										<input type="text" class="form-control" aria-label="Username"  -->
<%-- 											aria-describedby="basic-addon1" name="pr_end" value="${list.pr_end}" autofocus> --%>
											<input type="text" name="pr_end" id="text1" value="${list.pr_end}" class="datetimepicker" readonly/>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">??????</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_content" value="${list.pr_content}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">??????</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_goal" value="${list.pr_goal}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">??????</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_place" value="${list.pr_place}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">??????</span> 
										
										<select name="pr_state">
												<option
												<c:if test="${list.pr_state eq '????????????'}">selected</c:if>>
													????????????
												</option>
												<option
													<c:if test="${list.pr_state eq '?????????'}">selected</c:if>>
													?????????
												</option>
												<option
													<c:if test="${list.pr_state eq '??????'}">selected</c:if>>
													??????
												</option>
										</select>

								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">????????????</span> 
										
									<select name="pc_idx">
										<c:forEach items="${procategory}" var="pc">
											<option value="${pc.pc_idx}" ${pc.pc_idx == list.pc_idx ? 'selected="selected"' : ''}>${pc.pc_cate}</option>	
										</c:forEach>			
									</select>
									<!-- ?????????????????? value=pc.pc_idx ?????? pc.pc_idx == list.pc_idx ????????? ????????? ?????? ?????? ?????? selected ?????? ?????? pc.pc_cate ??????-->


<!-- 										<option -->
<%-- 										<c:if test="${list.pc_idx == 1}">selected</c:if>> --%>
<!-- 										?????????????????? -->
<!-- 										</option> -->
<!-- 										<option -->
<%-- 										<c:if test="${list.pc_idx == 2}">selected</c:if>> --%>
<!-- 										?????????????????? -->
<!-- 										</option> -->
<!-- 										<option -->
<%-- 										<c:if test="${list.pc_idx == 3}">selected</c:if>> --%>
<!-- 										?????????????????? -->
<!-- 										</option> -->
<!-- 									</select> -->
<%-- 									<input type="hidden" name="pc_idxTwo" value="${list.pc_idx}"> --%>
									<!-- name?????? value??? ??????????????? ???????????? ?????? ????????? hidden ?????? -->
								</div>
									
							<!-- ?????? ?????? -->	
							<button type="submit" class="btn btn-primary">????????????</button>
							<button type="button" class="btn btn-secondary"
								onclick="location.href='programList?page=resident'">????????????</button>
							</form>
						</div>
					</div>


				</section>
			</div>
			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2023 Final Project</p>
					</div>
					<div class="float-end">
						<p>
							Create With <span class="text-danger"><i
								class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">Gudi</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>
<script>
//?????????
$(function(){
    $('.datetimepicker').appendDtpicker({'locale':'ko'},{format:'Y-m-d H:i'});
});

</script>
</html>