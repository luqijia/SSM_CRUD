<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Ա���б�</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<!-- ���� -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- ��ť -->
		<div class="row">
			 <div class="col-md-4 col-md-offset-8">
			 	<button class="btn btn-primary">����</button>
			 	<button class="btn btn-danger">ɾ��</button>
			 </div>
		</div>
		<!-- ��ʾ������� -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>����</th>
					</tr>
					<tr>
						<th>1</th>
						<th>q</th>
						<th>��</th>
						<th>aaa@crud.com</th>
						<th>deptName</th>
						<th>
							<button class="btn btn-primary btn-sm">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							�༭</button>
							<button class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							ɾ��</button>
						</th>
					</tr>
				</table>
			
			</div>
		</div>
		<!-- ��ʾ��ҳ��Ϣ -->
		<div class="row">
			<!-- ��ҳ������Ϣ -->
			<div class="col-md-6">
				��ǰ��¼��
			</div>
			<!-- ��ҳ����Ϣ -->
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#">��ҳ</a></li>
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					<li><a href="#">ĩҳ</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>