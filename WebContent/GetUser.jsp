<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.JSONObject,org.json.JSONException,java.util.*,org.json.JSONArray"%>
<%
Connection con;
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
con = DriverManager.getConnection("jdbc:ucanaccess://C:/Users/shashi/workspace/assignment/assignmentDb.accdb","","");
PreparedStatement ps=con.prepareStatement("select * from userRecord");
ResultSet rs = ps.executeQuery();
JSONArray arr = new JSONArray();

while(rs.next()){
	JSONObject object = new JSONObject();
	ResultSetMetaData rsmd = rs.getMetaData();
	for(int i=1;i<=rsmd.getColumnCount(); i++){
		object.put(rsmd.getColumnName(i),rs.getString(i));
	}
	arr.put(object);
}
out.print(arr.toString());
%>
