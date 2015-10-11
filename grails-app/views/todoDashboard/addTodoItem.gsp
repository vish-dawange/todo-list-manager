<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 9/14/2015
  Time: 3:41 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>To Do List Manager</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/twitter-bootstrap/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui-1.11.2/jquery-ui.css" type="text/css" />
    <!-- JS Libraries -->
    <script src="<%=request.getContextPath() %>/css/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/css/jquery-ui-1.11.2/jquery-ui.js"></script>
    <script src="<%= request.getContextPath() %>/css/twitter-bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/css/twitter-bootstrap/js/bootstrap.js" type="text/javascript"></script>

</head>

<body>
    <div>
        <label>Todo Action: </label><input type="text" placeholder="To do Action"/>
    </div>
    <div>
        <label>Due date: </label><input type="datetime" placeholder="Due Date"/>
    </div>
    <div>
        <button>Add</button>
    </div>

    <div>
        <button id="show-to-do-list-btn" onclick="javascript: getTodoList()">View all Items</button>
    </div>
    <div id="to-do-list-list">

    </div>
</body>

<script>
    $(function(){

    });

    function getTodoList() {
        console.log("button clicked");
        $.getJSON('<g:createLink controller="Dashboard" action="todoListViaAjax"/>',function(data){
            console.log("in getJSON");
            console.log(data);
            $("#to-do-list-list").append(data);
        });
    }

</script>
</html>