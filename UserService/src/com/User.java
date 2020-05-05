package com;
import java.sql.*;

import org.apache.catalina.connector.Request;
import java.sql.*;
public class User {
	private Connection connect()
	{
			Connection con = null;
	try
	{
			Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test_user", "root", "root");
	}
	catch (Exception e)
	{e.printStackTrace();}
	return con;
	}
	//insert-----------------------------------------------------------------------------------------------------------------------------
	
	public String insertUser(String name, String age, String gender, String phone, String email, String pwd)
    {
			String output = "";
			try
			{
				Connection con = connect();
				if (con == null)
				{    
					return "Error while connecting to the database for inserting.";
				}
				// create a prepared statement
				String query = "insert into users"
						+"(`userID`,`userName`,`userAge`,`userGender`,`userPhone`,`userEmail`,`password`)"
						 + " values (?, ?, ?, ?, ?, ?, ?)";
						PreparedStatement preparedStmt = con.prepareStatement(query); 
				// binding values
						preparedStmt.setInt(1, 0);
						preparedStmt.setString(2, name);
						preparedStmt.setString(3, age);
						preparedStmt.setString(4, gender);
						preparedStmt.setString(5, phone);
						preparedStmt.setString(6, email);
						preparedStmt.setString(7, pwd);
	
				// execute the statement
				preparedStmt.execute();
				con.close();
				
				String newItems = readUser();
				output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
			}
				catch (Exception e)
			{
					output = "{\"status\":\"error\", \"data\": \"Error while inserting the item.\"}";
					System.err.println(e.getMessage());
			}
			return output;
    		}
	
	
	//view------------------------------------------------------------------------------------------------------------------------
	public String readUser(){
		
		String output = "";
			try{
			Connection con = connect();
			
			if (con == null){
				return "Error while connecting to the database for reading."; 
			}
			// Prepare the html table to be displayed
			output = "<table border='1'>"
					+ "<tr><th>User Name</th>"
					+ "<th>Age</th>"
					+ "<th>Gender</th>"
					+ "<th>User Phone</th>"
					+ "<th>Email</th>"
					+ "<th>Password</th>"
					+ "<th>Update</th>"
					+ "<th>Remove</th></tr>";
			
			String query = "select * from users";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()){
				
				String UserID = Integer.toString(rs.getInt("userID"));
				String name = rs.getString("userName");
				String age = rs.getString("userAge");
				String gender = rs.getString("userGender");
				String phone = rs.getString("userPhone");
				String email = rs.getString("userEmail");
				String pwd = rs.getString("password");

				
				// Add into the html table
				output += "<tr><td><input id='hidItemIDUpdate'name='hidItemIDUpdate' type='hidden' value='" + UserID+ "'>"+ name + "</td>";
				output += "<td>" + age + "</td>";
				output += "<td>" + gender + "</td>";
				output += "<td>" + phone + "</td>";
				output += "<td>" + email + "</td>";
				output += "<td>" + pwd + "</td>";
				 // buttons
				
				output += "<td><input name='btnUpdate'type='button' "
						+ "value='Update'class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove'type='button' "
						+ "value='Remove'class='btnRemove btn btn-danger'data-itemid='"+ UserID + "'>" + "</td></tr>";
			}
			
			con.close();
			// Complete the html table
			output += "</table>";
			}
			catch (Exception e){
				output = "Error while reading the items.";
				System.err.println(e.getMessage());
			}
			
	return output;
	
	}
	
	
	//update----------------------------------------------------------------------------------------------------------------
	public String updateItem(String UID, String Uname, String Uage, String Ugender, String Uphone, String Uemail, String pwd) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE users SET userName=?,userAge=?,userGender=?,userPhone=?,userEmail=?,password=?WHERE userID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, Uname);
			preparedStmt.setString(2, Uage);
			preparedStmt.setString(3, Ugender);
			preparedStmt.setString(4, Uphone);
			preparedStmt.setString(5, Uemail);
			preparedStmt.setString(6, pwd);
			preparedStmt.setInt(7, Integer.parseInt(UID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newItems = readUser();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";;
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while updating the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	
	//delete-------------------------------------------------------------------------------------------------------------------
	public String deleteItem(String UID) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {

				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from users where userID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(UID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newItems = readUser();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}";
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while deleting the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
}

