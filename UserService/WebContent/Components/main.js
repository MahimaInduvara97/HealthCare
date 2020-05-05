$(document).ready(function()
{
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

//SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateUserForm();
	
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var method = ($("#hidUserIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "UserAPI",
		type : method,
		data : $("#formuser").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onItemSaveComplete(response.responseText, status);
		}
	});
});

function onItemSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} 
	else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#hidUserIDSave").val("");
	$("#formuser")[0].reset();
}
//-------------Update----------------
$(document).on("click", ".btnUpdate", function(event)
		{
			$("#hidUserIDSave").val($(this).closest("tr").find('#hidUserIDUpdate').val());
			$("#userName").val($(this).closest("tr").find('td:eq(0)').text());
			$("#userAge").val($(this).closest("tr").find('td:eq(1)').text());
			$("#userGender").val($(this).closest("tr").find('td:eq(2)').text());
			$("#userPhone").val($(this).closest("tr").find('td:eq(3)').text());
			$("#userEmail").val($(this).closest("tr").find('td:eq(4)').text());
			$("#password").val($(this).closest("tr").find('td:eq(5)').text());
		});


//----------------------Delete----------------------------
$(document).on("click", ".btnRemove", function(event)
		{
			$.ajax(
			{
				url : "UserAPI",
				type : "DELETE",
				data : "userID=" + $(this).data("itemid"),
				dataType : "text",
				complete : function(response, status)
				{
					onUserDeleteComplete(response.responseText, status);
				}
			});
		});

		function onUserDeleteComplete(response, status)
		{
			if (status == "success")
			{
				var resultSet = JSON.parse(response);
				
				if (resultSet.status.trim() == "success")
				{
					$("#alertSuccess").text("Successfully deleted.");
					$("#alertSuccess").show();
					$("#divItemsGrid").html(resultSet.data);
				} 
				else if (resultSet.status.trim() == "error")
				{
					$("#alertError").text(resultSet.data);
					$("#alertError").show();
				}
			} 
			else if (status == "error")
			{
				$("#alertError").text("Error while deleting.");
				$("#alertError").show();
			} 
			else
			{
				$("#alertError").text("Unknown error while deleting..");
				$("#alertError").show();
			}
		}
//--------------------validate-----------------------
function validateUserForm()
{
	// CODE
	if ($("#userName").val().trim() == "")
	{
		return "Insert Name.";
	}
	if ($("#userAge").val().trim() == "")
	{
		return "Insert Age.";
	}
	
	// GENDER
	if ($("#userGender").val().trim() == "")
	{
		return "Insert gender.";
	}
	
	//PHONE-------------------------------
	if ($("#userPhone").val().trim() == "")
	{
		return "Insert Phone.";
	}
	
	// is numerical value
	var tmpPrice = $("#userPhone").val().trim();
	
	if (!$.isNumeric(tmpPrice))
	{
		return "Insert a numerical value for Phone.";
	}
	
	// EMAIL------------------------
	if ($("#userEmail").val().trim() == "")
	{
		return "Insert User Email.";
	}
	if ($("#password").val().trim() == "")
	{
		return "Insert Passowrd.";
	}
	
	return true;
}