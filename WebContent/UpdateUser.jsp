<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.JSONObject,org.json.JSONException,java.util.*,org.json.JSONArray"%>
<%
Connection con;
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/assignment/assignmentDb.accdb","","");
PreparedStatement ps=con.prepareStatement("update userRecord set uname=(?),age=(?),class=(?),marks=(?),address=(?) where ID = (?) ");
ps.setString(1, request.getParameter("name"));
ps.setString(2, request.getParameter("age"));
ps.setString(3, request.getParameter("userClass"));
ps.setString(4, request.getParameter("marks"));
ps.setString(5, request.getParameter("address"));
ps.setString(6, request.getParameter("id"));
int isUpdated = ps.executeUpdate();
JSONObject obj = new JSONObject();
obj.put("isUpdated",isUpdated);
out.print(obj);
%>