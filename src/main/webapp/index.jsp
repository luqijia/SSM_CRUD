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
	<!-- Ա���޸ĵ�ģ̬�� -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Ա���޸�</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								 <p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email" id="email_update_input"
									placeholder="email@crud.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> 
								<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> ��									
								</label>
								 <label class="radio-inline">
								 <input type="radio" name="gender" id="gender2_update_input" value="F"> Ů
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!-- �����ύ����id���� -->
								<select class="form-control" name="dId" id="dept_update_select">
								
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">����</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Ա����ӵ�ģ̬�� -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Ա�����</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName" id="empName_add_input"
									placeholder="empName">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email" id="email_add_input"
									placeholder="email@crud.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> 
								<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> ��									
								</label>
								 <label class="radio-inline">
								 <input type="radio" name="gender" id="gender2_add_input" value="F"> Ů
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!-- �����ύ����id���� -->
								<select class="form-control" name="dId" id="dept_add_select">
								
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">����</button>
				</div>
			</div>
		</div>
	</div>

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
			 	<button class="btn btn-primary" id="emp_add_modal_btn">����</button>
			 	<button class="btn btn-danger" id="emp_delete_all_btn">ɾ��</button>
			 </div>
		</div>
		<!-- ��ʾ������� -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>����</th>
						</tr>
					</thead>
					<tbody>
					
					
					</tbody>
				</table>
			
			</div>
		</div>
		<!-- ��ʾ��ҳ��Ϣ -->
		<div class="row">
			<!-- ��ҳ������Ϣ -->
			<div class="col-md-6" id="page_info_area">
			
			</div>
			<!-- ��ҳ����Ϣ -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		var totalRecord;//ȫ�ֱ������ܼ�¼����������������ʱ������Ϻ���ʾ������������
		var currentPage;//��¼��ǰҳ������Ա���ı༭��������ɺ�ص���ǰҳ
		//1.ҳ�������ɺ�ֱ�ӷ���ajax����Ҫ����ҳ����
		$(function(){
			to_page(1);
		});		
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//console.log(result);
					//1.��������ʾԱ������
					build_emps_table(result);
					//2.��������ʾ��ҳ��Ϣ
					build_page_info(result);
					//3.������ʾ��ҳ������
					build_page_nav(result);
				}
			});
		}
		//������ʾԱ������
		function build_emps_table(result){
			//���table���
			$("#emps_table tbody").empty();
			var emps=result.extend.pageInfo.list;//�õ�����Ա������
			$.each(emps,function(index,item){
				var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd=$("<td></td>").append(item.empId);
				var empNameTd=$("<td></td>").append(item.empName);
				var genderTd=$("<td></td>").append(item.gender=="M"?"��":"Ů");
				var emailTd=$("<td></td>").append(item.email);
				var deptNameTd=$("<td></td>").append(item.department.deptName);
				var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
							.append("�༭");
				//Ϊ�༭��ť���һ���Զ�������ԣ�����ʾ��ǰԱ����id
				editBtn.attr("edit-id",item.empId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash"))
							.append("ɾ��");
				//Ϊɾ����ť���һ���Զ�������ԣ�����ʾ��ǰԱ����id
				delBtn.attr("del-id",item.empId);
				var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(checkBoxTd)
							.append(empIdTd)
							.append(empNameTd)
							.append(genderTd)
							.append(emailTd)
							.append(deptNameTd)
							.append(btnTd)
							.appendTo("#emps_table tbody");
			});
		}
		//������ʾ��ҳ��Ϣ
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("��ǰ" + result.extend.pageInfo.pageNum + "ҳ,��"
							+ result.extend.pageInfo.pages + "ҳ,��"
							+ result.extend.pageInfo.total + "����¼");
			totalRecord=result.extend.pageInfo.total;
			currentPage=result.extend.pageInfo.pageNum;
		}

		//������ʾ��ҳ��
		function build_page_nav(result) {
			/*
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
			*/
			$("#page_nav_area").empty();
			var ul=$("<ul></ul>").addClass("pagination");
			//����Ԫ��
			var firstPageLi=$("<li></li>").append($("<a></a>").append("��ҳ").attr("href","#"));
			var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//ΪԪ����ӵ����ҳ���¼�
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}
			var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi=$("<li></li>").append($("<a></a>").append("ĩҳ").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			};
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi=$("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum==item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			})
			ul.append(nextPageLi).append(lastPageLi);
			var navEle=$("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		//��ձ���ʽ������
		function reset_form(ele){
			//��ձ�����
			$(ele)[0].reset();
			//��ձ���ʽ
			$(ele).find("*").removeClass("has-error has-success");//�ҵ���Ԫ���µ����д���has-error��has-success���ಢ���
			$(ele).find(".help-block").text("");
		}
		
		//���������ť����ģ̬��
		$("#emp_add_modal_btn").click(function(){
			//���������(����������(�������ݣ�������ʽ))
			//$("#empAddModal form")[0].reset(); //ȡ��dom����
			reset_form("#empAddModal form");
			//����ajax���󣬲��������Ϣ����ʾ�������б���
			getDepts("#empAddModal select");
			//����ģ̬��
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		
		//������еĲ�����Ϣ����ʾ�������б���
		function getDepts(ele){
			//���֮ǰ�����б��ֵ
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
					//{"code":100,"msg":"����ɹ�","extend":{"depts":[{"deptId":1,"deptName":"������"},
						//{"deptId":2,"deptName":"���Բ�"}]}}
					//console.log(result);
					//$("#dept_add_select") //���ַ���:1.����id 2.��div�µ��������
					//$("#empAddModal select").append("");
					$.each(result.extend.depts,function(){
						var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		
		//У�������
		function validata_add_form(){
			//1.�õ�ҪУ������ݣ�ʹ��������ʽ
			//У���û�����Ϣ
			var empName=$("#empName_add_input").val();
			var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){ //���У��ʧ��
				//alert("�û���Ϊ2-5λ���Ļ���6-16λӢ�ĺ����ֵ����");
				//Ӧ��������Ԫ��֮ǰ����ʽ
				show_validata_msg("#empName_add_input","error","�û���Ϊ2-5λ���Ļ���6-16λӢ�ĺ����ֵ����");
				return false;
			}else{
				show_validata_msg("#empName_add_input","success","");
			};
			//У��������Ϣ
			var email=$("#email_add_input").val();
			var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){//���У��ʧ��
				//alert("�����ʽ����ȷ");
				//Ӧ��������Ԫ��֮ǰ����ʽ
				show_validata_msg("#email_add_input","error","�����ʽ����ȷ");
				return false;
			}else{
				show_validata_msg("#email_add_input","success","");
			};
			return true;
		}
		//��ʾ��֤�������ʾ��Ϣ
		function show_validata_msg(ele,status,msg){
			//�����ǰԪ�ص�У��״̬
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			};
		}
		
		//У���û����Ƿ����
		$("#empName_add_input").change(function(){
			//����ajax����У���û����Ƿ����
			var empName=this.value;
			$.ajax({
				url:"${APP_PATH}/checkuser",
				data:"empName="+empName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validata_msg("#empName_add_input","success","�û�������");
						$("#emp_save_btn").attr("ajax-va","success");
					}else{
						show_validata_msg("#empName_add_input","error",result.extend.va_msg);
						$("#emp_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		
		//������棬����Ա��
		$("#emp_save_btn").click(function(){
			//1.ģ̬������д�ı������ύ�����������б���
			//1.�ȶ�Ҫ�ύ�������������ݽ���У��
			if(!validata_add_form()){
				return false;
			};
			//1.�ж�֮ǰ��ajax�û���У���Ƿ�ɹ�������ɹ�
			if($(this).attr("ajax-va")=="error"){//�õ���ǰԪ�ص�ajax-va���Ե�ֵ
				return false;
			};
			//2.����ajax���󱣴�Ա��
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"POST",
				data:$("#empAddModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					if(result.code==100){
						//Ա������ɹ�
						//1.�ر�ģ̬��
						$('#empAddModal').modal('hide');
						//2.�������һҳ����ʾ�ղű��������
						//����ajax������ʾ���һҳ����
						to_page(totalRecord);
					}else{
						//��ʾʧ����Ϣ
						//console.log(result);
						//���ĸ��ֶεĴ�����Ϣ����ʾ�ĸ��ֶε�
						if(undefined != result.extend.errorFields.email){
							//��ʾ���������Ϣ
							show_validata_msg("#email_add_input","error",result.extend.errorFields.email);
						}
						if(undefined != result.extend.errorFields.empName){
							//��ʾ�û���������Ϣ
							show_validata_msg("#empName_add_input","error",result.extend.errorFields.empName);
						}
					}	
				}
			});
		});

		//�򿪱༭ģ̬��
		//1.�����ǰ�ť����֮ǰ�Ͱ���click,���԰󶨲���
		//$(".edit_btn").click(function(){
 		//	alert("edit");
 		//});
		//1).�����ڴ�����ť��ʱ���  2).�󶨵��.live()
 		//$(".edit_btn").live(function(){  //�ᱨ��
 		//	alert("edit");
 		//});
		//jquery�°�û��live,ʹ��on�������
		$(document).on("click",".edit_btn",function(){
			//alert("edit");
			//1.���������Ϣ������ʾ�����б�
			getDepts("#empUpdateModal select");
			//2.���Ա����Ϣ����ʾԱ����Ϣ
			getEmp($(this).attr("edit-id"));
			//3.��Ա����id���ݸ�ģ̬��ĸ��°�ť
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
			//����ģ̬��
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					var empData=result.extend.emp;//�õ���Ա������
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val([empData.gender]);//�ı�empUpdateModalģ̬���µ�inputԪ�ز���nameΪgender��ֵ
					$("#empUpdateModal select").val([empData.dId]);
				}
			});
		}
		
		//������£�����Ա����Ϣ
		$("#emp_update_btn").click(function(){
			//��֤�����Ƿ�Ϸ�
			//1.У��������Ϣ
			var email=$("#email_update_input").val();
			var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){//���У��ʧ��
				//alert("�����ʽ����ȷ");
				//Ӧ��������Ԫ��֮ǰ����ʽ
				show_validata_msg("#email_update_input","error","�����ʽ����ȷ");
				return false;
			}else{
				show_validata_msg("#email_update_input","success","");
			}
			//2.����ajax���󱣴���µ�Ա������
			//ajax����ʽ
			//1.POST����ͨ��web.xml��HiddenHttpMethodFilter��������POST����ת��ΪPUT����
// 			$.ajax({
// 				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
// 				type:"POST",
// 				data:$("#empUpdateModal form").serialize()+"&_method=PUT", //.serialize()Ϊ�����кź�Ľ����Ϊ�ַ���
// 				success:function(result){
// 					alert(result.msg);
// 				}
// 			});
			//2.ֱ��PUT������Ҫ��web.xml������HttpPutFormContentFilter������
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#empUpdateModal form").serialize(), //.serialize()Ϊ�����кź�Ľ����Ϊ�ַ���
				success:function(result){
					//alert(result.msg);
					//1.�رնԻ���
					$("#empUpdateModal").modal("hide");
					//2.�ص���ҳ��
					to_page(currentPage);
				}
			});
		});
		
		//����ɾ��
		$(document).on("click",".delete_btn",function(){
			//1.�����Ƿ�ȷ�϶Ի���
			var empName=$(this).parents("tr").find("td:eq(2)").text();//�ҵ�ǰԪ�صĸ�Ԫ��Ϊtr�µĵڶ���tdԪ�ص�text
			var empId=$(this).attr("del-id");
			//alert($(this).parents("tr").find("td:eq(1)").text());
			if(confirm("ȷ��ɾ����"+empName+"����")){
				//ȷ�ϣ�����ajax����ɾ������
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//�ص���ҳ
						to_page(currentPage);
					}
				});
			}
		});
		
		//���ȫѡ/ȫ��ѡ����
		$("#check_all").click(function(){
			//attr��ȡchecked��undefined
			//alert($(this).attr("checked"));
			//������Щdomԭ��������;attr��ȡ�Զ������Ե�ֵ
			//prop�޸ĺͶ�ȡdomԭ�����Ե�ֵ
			//alert($(this).prop("checked"));
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//check_item
		$(document).on("click",".check_item",function(){
			//�жϵ�ǰѡ���е�Ԫ���Ƿ�5��
			var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		//���ȫ��ɾ����������ɾ��
		$("#emp_delete_all_btn").click(function(){
			var empNames="";
			var del_idstr="";
			$.each($(".check_item:checked"),function(){
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//��װԱ��id�ַ���
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//ȥ��empNames�����,
			empNames=empNames.substring(0,empNames.length-1);
			//ȥ��ɾ����id�����-
			del_idstr=del_idstr.substring(0,del_idstr.length-1);
			if(confirm("ȷ��ɾ����"+empNames+"����")){
				//����ajax����ɾ��
				$.ajax({
					url:"${APP_PATH}/emp/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//�ص���ǰҳ��
						to_page(currentPage);
					}
				});
			}
		});
	</script>
</body>
</html>