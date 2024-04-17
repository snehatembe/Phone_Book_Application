<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-custome navbar-custom">
  <a class="navbar-brand" href="" style="border:white; border-width:2px; border-style:solid; border-radius: 15px; padding-left:10px; padding-right:10px; margin-right: 10px;"><b><i class="fa fa-phone-square" aria-hidden="true"></i> PhoneBook</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">


      <li class="nav-item active">
        <a class="nav-link" href="add.jsp" style="border:white; border-width:2px; border-style:solid; border-radius: 15px; margin-right: 6px;"><b><i class="fa fa-plus-square" aria-hidden="true" ></i> Add PhoneNo </b><span class="sr-only">(current)</span></a>
      </li>

      <li class="nav-item active">
        <a class="nav-link" href="show.jsp" style="border:white; border-width:2px; border-style:solid; border-radius: 15px; margin-right: 6px;"><b><i class="fa fa-address-book-o" aria-hidden="true"></i> Show PhoneNo </b></a>
      </li>
	<li class="nav-item active">
        <a class="nav-link" href="update.jsp" style="border:white; border-width:2px; border-style:solid; border-radius: 15px; margin-right: 6px;"><b><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update PhoneNo </b></a>
      </li>
	<li class="nav-item active">
        <a class="nav-link" href="search.jsp" style="border:white; border-width:2px; border-style:solid; border-radius: 15px; margin-right: 6px;"><b><i class="fa fa-search-plus" aria-hidden="true"></i> Search </b></a>
      </li>
    </ul>
	
	<%
			if(session.getAttribute("uid")!=null)
				{
					String uid=(String)session.getAttribute("uid");
					
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/phonebook";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="select * from userdata where uid=?"; 
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1,uid);
				ResultSet rs=pst.executeQuery();
				while(rs.next())
				{
					String uname=rs.getString(2);
					String uemail=rs.getString(3);
					String pw1=rs.getString(4);
					
%>
				<a href="" class="btn btn-light my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#exampleModal" type="submit"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;<%= uname %></a>

<%
				}
					con.close();
				}
				catch(SQLException e)
				{
%>
				<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;<p>Profile not found</p></a>

<%
				}
			}
			else
				{
					response.sendRedirect("login.jsp");
				}
	
%>
	

	<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" name="btn4" id="btn4" type="submit"><i class="fa fa-sign-out" aria-hidden="true"></i></i>  Logout  </a>
  </div>

<%
			
				String uid=(String)session.getAttribute("uid");
					
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/phonebook";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="select * from userdata where uid=?"; 
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1,uid);
				ResultSet rs=pst.executeQuery();
				while(rs.next())
				{
					String uname=rs.getString(2);
					String uemail=rs.getString(3);
					String pw1=rs.getString(4);
					
%>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 align="center" class="modal-title" id="exampleModalLabel">Profile</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
		<div class="container text-center">
			<i class="fa fa-user fa-3x"></i>
			<h5><%= uname %></h5>
			
			<table class="table">
			<tbody>
			<tr>
				<th>User ID : </th>
				<td><%= uid %></td>
			</tr>

			<tr>
				<th>Full name : </th>
				<td><%= uname %></td>
			</tr>

			<tr>
				<th>Email ID : </th>
				<td><%= uemail %></td>
			</tr>	
		
		</tbody>
		</table>
		
		<div>
			<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<%
				}
					con.close();
				}
				catch(SQLException e)
				{
%>
				<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;<p>Profile not found</p></a>

<%
				}
			
%>
	
</nav>
