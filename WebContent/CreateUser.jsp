<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.JSONObject,org.json.JSONException,java.util.*,org.json.JSONArray"%>
<%
Connection con;
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/assignment/assignmentDb.accdb","","");
PreparedStatement ps=con.prepareStatement("insert  into userRecord(uname,age,class,marks,address) values (?,?,?,?,?)");
ps.setString(1, request.getParameter("name"));
ps.setString(2, request.getParameter("age"));
ps.setString(3, request.getParameter("userClass"));
ps.setString(4, request.getParameter("marks"));
ps.setString(5, request.getParameter("address"));
int isInserted = ps.executeUpdate();
JSONObject obj = new JSONObject();
obj.put("isInserted",isInserted);
out.print(obj);
%>