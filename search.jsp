<%@ page import="java.sql.*" %>
<%
				if(request.getParameter("dr1")!=null)
				{
				
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/phonebook";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="delete from phonedata where pid=?";
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setInt(1,Integer.parseInt(request.getParameter("dr1")));
				pst.executeUpdate();
				con.close();
				}
				catch(SQLException e)
				{
					out.println("issue :"+e);
				}
				}
			%>

<html>
<head>
<style>
	body
	{
		background-image: linear-gradient(to right top, #1a237e, #3152a3, #5580c3, #84afe0, #bbdefb);
		.nav{background-color:white;}
		.nav a{color:white;text-decoration:none;margin:70px;}
	}
	.b{
		font-size: 25px;
		border-radius: 8px;
	}
	div1{
		color:white;
		}
	th, tr,td {
  		border: 3px solid white;
  		border-radius: 15px 50px;
		text-align:center;
		font-size:20px;
		}
	table {
  		border: 2px solid white;
  		border-radius: 15px;
		padding:10px;
		}
</style>
<script>
		function validate()
		{
			let pid=document.getElementById("pid");
			if(city.value=="")
			{
				alert("City should not be Empty");
				city.value="";
				city.focus();
				return false;
			}
			else if(! city.value.match(/^[A-Za-z]+$/))
			{
				alert("City Name is Invalid");
				city.value="";
				city.focus();
				return false;
			}
			else if(city.value.length <2)
			{
				alert("Length of City Name should be more than 1 letter");
				city.value="";
				city.focus();
				return false;
			}
			else
			{
				true;
			}
		}
</script>
<title>Search Page</title>

<%@include file="allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<center>
	<br>
			<h1 class="text-center" style="color:white;"><b><i class="fa fa-search-plus" aria-hidden="true"></i> Search Contact Numbers</b></h1>
		<form onsubmit="return validate()" method="POST">
		<div style="width:800px;height:200px;border:2px solid white;">
	<br>
	<label for="name"><font size="4" color="white"><i class="fa fa-search" aria-hidden="true"></i> Search By City :</font></label><br>
	<input type="text" name="city" id="city" step="any" placeholder="e.g Thane" size="40" autocomplete="off"/>
	<br>
	<br>
	<input type="submit" value="Search" name="btn" class="b"/>
	</div>
	</form>
	<br><br><br>
		<%
				if(request.getParameter("btn")!=null)
				{
					String city=request.getParameter("city");
		%>
			<table border=4 style="width:70%; color:white;">
				<tr>
					<th style="padding: 10px"><b>PID</b></th>
					<th style="padding: 10px"><b>Person Name</b></th>
					<th style="padding: 10px"><b>Phone No</b></th>
					<th style="padding: 10px"><b>Person Email</b></th>
					<th style="padding: 10px"><b>City</b></th>
					<th style="padding: 10px"><b>BirthDate</b></th>
					<th style="padding: 10px"><b>Delete</b></th>
				</tr>
		<%
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/phonebook";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="select * from phonedata where uid=? and city=?";
				PreparedStatement pst=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				pst.setString(2,city);
				pst.setString(1,uid);
				ResultSet rs=pst.executeQuery();
				int count=0;
				while(rs.next())
				{
					int pid=rs.getInt(1);
					String pname=rs.getString(2);
					String pno=rs.getString(3);
					String pemail=rs.getString(4);
					String bdate=rs.getString(6);
					count++;
				if(count>0){
			%>
				<tr style="text-align:center;color:white;">
					<td><%=pid %></td>
					<td style="padding: 10px"><%=pname %></td>
					<td><%=pno %></td>
					<td><%=pemail %></td>
					<td><%=city %></td>
					<td><%=bdate %></td>
					<td><a href="?dr1=<%=pid%>"
					onclick="return confirm('Are you want delete? Sure??')"><button>Delete</button></a></td>
				</tr>
				
			<%
				}
				}
				if(count==0){
			%>
				<h5 class="text-center" style="color:white; position: absolute;bottom: 200px;right:600;"><i class="fa fa-window-close" aria-hidden="true"></i>&nbsp;Oops ! Does't found any persone in this city</h5> 
			<%
					}
					con.close();
				}
				catch(SQLException e)
				{
					out.println("issue :"+e);
				}
				}
			%>
			</table>
			<br>

</center>
</body>
</html>