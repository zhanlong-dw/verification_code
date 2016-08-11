<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>图片验证码</title>
</head>
<script type="text/javascript" src="js/jQuery1.9.1.js"></script>
<script type="text/javascript">
	 function reload(){
		document.getElementById("image").src="<%=request.getContextPath() %>/imageServlet?date="+new Date().getTime();
		$("#checkcode").val("");   // 将验证码清空
	} 
	 
	 function verificationcode(){
		 var text=$.trim($("#checkcode").val());
		 $.post("${pageContext.request.contextPath}/verificationServlet",{op:text},function(data){
			 data=parseInt($.trim(data));
			 if(data>0){
				 $("#span").text("验证成功!").css("color","green");
			 }else{
				 $("#span").text("验证失败!").css("color","red");
				 reload();  //验证失败后需要更换验证码
			 }
		 });
		 $("#checkcode").val(""); // 将验证码清空
	 }
</script>
<body>
   	 验证码：<input type="text" name="checkcode"  id="checkcode"/>
  	<img  src="<%=request.getContextPath() %>/imageServlet" alt="验证码" id="image" />
	<a href="javascript:reload();"><label>换一张</label></a><br>
	<input  type="button" value="提交"  onclick="javascript:verificationcode()">
	<span id="span"></span>
</body>
</html>