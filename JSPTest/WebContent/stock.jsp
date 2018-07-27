
<html>
<head>
<title>sax parser</title>
<%@ page import="java.util.*" %>
<%@ page import="saxbean.*" %>
</head>

<body bgcolor="#ffffcc">

<jsp:useBean id="saxparser" 
class="saxbean.MySAXParserBean" />

<%
Collection stocks = 
saxparser.parse("E:\\fvelez\\Indra\\ift\\Workspace\\Data\\stock.xml");
Iterator ir = stocks.iterator();
%>

<center>
<h3>My Portfolio</h3>
<table border="2" width="50%">
 <tr>
 <th>Stock Symbol</th>
 <th>Company Name</th>
 <th>Price</th>
 </tr>
 

<%
while(ir.hasNext()) {
	
  MyElement element = (MyElement) ir.next(); 
  String tag = element.getQname();
  //System.out.println("tag="+ element.getQname());
  if(tag.equals("symbol")) { %>
    <tr><td><%= element.getValue() %></td>
  <% } else if (tag.equals("name")) { %>
    <td><%= element.getValue() %></td>
  <% } else if (tag.equals("price")) { %>
    <td><%= element.getValue() %></td></tr>
  <% } %>
<% } %>

</body>
</html>