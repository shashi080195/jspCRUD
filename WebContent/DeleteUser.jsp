<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.JSONObject,org.json.JSONException,java.util.*,org.json.JSONArray"%>
<%
Connection con;
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/assignment/assignmentDb.accdb","","");
PreparedStatement ps=con.prepareStatement("delete from userRecord where ID=(?)");
ps.setInt(1,Integer.parseInt(request.getParameter("userID")));
int isDeleted = ps.executeUpdate();
JSONObject obj = new JSONObject();
obj.put("isDeleted",isDeleted);
out.print(obj);
%>
