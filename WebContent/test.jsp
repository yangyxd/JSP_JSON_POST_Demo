<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.io.*"
	import="com.http.*"
	import="net.sf.json.*"
    pageEncoding="UTF-8" %>
<body>
<%--
		浏览器或客户端通过POST方式提交请求。请求内容为JSON数据。
		通过自定义函数 HttpRequestCommon.getPostData 可以从本次请求的输入流中读取到完整的POST数据
		读取成功后，使用JSONObject解析，然后读取我们需要的参数进行处理
		需要判断json是否解析成功，不成功可以返回一个错误标识。
--%>
<%
	String postdata = Common.getPostData(request.getInputStream(), request.getContentLength(), null);
	//out.println(postdata); 
	
	if (postdata != null) {
		JSONObject json = JSONObject.fromObject(postdata);
		if (json != null) {
			out.println("{\"result\": 1, \"username\": \"" + json.getString("username") + "\"}" );
		} else
			out.println("{\"result\": 0, \"errmsg\": \"无效的请求\"}");
	} else 
		out.println("{\"result\": 0, \"errmsg\": \"无效的请求\"}");
%>
</body>