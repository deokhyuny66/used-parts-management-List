<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="action.actionDAO"%>
<%@ page import="action.actionDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.Entry" %>
<%
	int j = 0;
	actionDAO actionDAO = new actionDAO();
	actionDTO actionDTO = new actionDTO();
	ArrayList<HashMap<String,String>> rs_dao_list = new ArrayList<HashMap<String,String>>();
	HashMap<String,String> map = new HashMap<String,String>();
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
	<table border=1>
	<% for (j=0;j<rs_dao_list.size();j++) {%>
		<tr>
			<% for(Entry<String, String> elem : rs_dao_list.get(j).entrySet() ){%>
				<td id="<%=j+1%>" name="item" onClick="reply_click(this.id)">
							<%= elem.getValue() %>
				</td>
			<%}%>
		</tr>
	<%}%>
	</table>
	    <div id="modal" class="modal-overlay">
	        <div class="modal-window">
	            <div class="title">
	                <h2>���</h2>
	            </div>
	            <div class="close-area">X</div>
	            
	            <form id="contentForm" action="./updateAction.jsp" method="POST">
		            <div class="content"></div>
	            </form>
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
				type: 'POST',
				url: 'itemsAjax.jsp',
				dataType: 'text',
				data: {
					clickItemId:clickedId
				},
				success: function(res){
					$('#modal #contentForm .content *').remove();
					res = res.replace(/[\[\]\/?.;|\)*~`!^\-_+<>@\#$%&\\\=\(]/gi,'');	 
					res = res.replace(/\s/g, '');
					let json = JSON.parse(res);
					let keys = Object.keys(json);
					let $temp;
					
				    for (let i=0; i<keys.length; i++) {
				    	let key = keys[i];
				    	//alert("key : " + key + ", value : " + json[key]);
				    	$temp = $('#modal #contentForm .content').append('<input type="text" name="selitemParam'+i+'" value="'+json[key]+'" ><br/>');
				    }		
				   
				    $temp = $temp.append('<input type="hidden" name="clickedId" value="'+clickedId+'"><input type="submit" value="submit">');	
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