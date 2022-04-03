<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="action.actionDAO"%>
<%@ page import="action.actionDTO" %>
<%@ page import="java.util.*" %>
<%
	actionDAO actionDAO = new actionDAO();
	actionDTO actionDTO = new actionDTO();
	ArrayList<HashMap<String,Object>> rs_dao_list = new ArrayList<HashMap<String,Object>>();
	//List<String> rs_dao_list = new ArrayList<String>();
	rs_dao_list = actionDAO.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>List</title>
    <style>
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
    </style>
</head>
<body>
	<p>List Page!</p><br/>
	
	<div class='container'>
	<% for (int i=0;i<rs_dao_list.size();i++) { %>
		<div id="item-<%=i%>" name="item" onClick="reply_click(this.id)"><%= rs_dao_list.get(i) %></div>
	<% } %>

	    <div id="modal" class="modal-overlay">
	        <div class="modal-window">
	            <div class="title">
	                <h2>모달</h2>
	            </div>
	            <div class="close-area">X</div>
	            <div class="content"></div>
	        </div>
	    </div>
    </div>
    
<script>
	let item_click;
	const modal = document.getElementById('modal');
	const closeBtn = modal.querySelector('.close-area');
	
	function reply_click(clickedId){
		item_click = document.getElementById(clickedId);
		item_click.addEventListener('click', function(){
			modalOn();
			$.ajax({
				type: "POST",
				url: "itemsAjax.jsp",
				dataType: "text",
				success: function(res){
					alert(res);
					//$('#modal .content').html(res);
				},
				error: function(){
					alert("False");
				}
			});
			
		});
	}
	
	function modalOn() {
		modal.style.display = 'flex';
	}
	
	function isModalOn() {
		return modal.style.display === 'flex';
	}
	
	function modalOff() {
	    modal.style.display = 'none';
	}
	
	closeBtn.addEventListener('click', function() {
	    modalOff();
	});

</script>
</body>
</html>