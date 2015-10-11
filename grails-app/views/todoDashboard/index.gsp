<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>To Do List Manager</title>
    %{--CSS --}%
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/twitter-bootstrap/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui-1.11.2/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css" type="text/css" />
    <!-- JS Libraries -->
    <script src="<%=request.getContextPath() %>/css/jquery-ui-1.11.2/external/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/css/jquery-ui-1.11.2/jquery-ui.js"></script>
    <script src="<%= request.getContextPath() %>/css/twitter-bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script src="<%= request.getContextPath() %>/css/twitter-bootstrap/js/bootstrap.js" type="text/javascript"></script>

    <g:render template="/include/common" />  %{-- handles click events --}%
    <g:render template="/include/validation" />  %{-- handles validations --}%

    <g:render template="/include/fetchTodoList" /> %{--fetched to do list--}%
    <g:render template="/include/createTodoList" /> %{--creates new to do action item--}%
    <g:render template="/include/deleteTodoList" /> %{--deletes to do action item--}%
    <g:render template="/include/editTodoList" /> %{--edit to do list--}%
    <g:render template="/include/searchTodoList" /> %{--search from to do list--}%
    <g:render template="/include/sortTodoList" /> %{--sort to do list--}%
</head>

<body class="container">

    <div id="dashboard">
        <div class="row well">
                <button class="btn btn-default todo-btn" id="home-id" onclick="getTodoList()">Dashboard</button>
                <button class="btn btn-default todo-btn" id="create-id" onclick="createNewTodoItem()">New</button>
                <button class="btn btn-default todo-btn" id="search-id" onclick="displaySearchOptions()">Search</button>
                <button class="btn btn-default todo-btn" id="sort-id" onclick="dispalySortOptions()" >Sort</button>
                <button class="btn btn-default todo-btn" id="filter-id" onclick="dispalyFilterOptions()" >Filter</button>

            <div id="dashboard-filter"  align="center" style="display: none">
                <select id="filter-option-id" class="input-lg">
                    <option value="All">All</option>
                    <option value="Pending">Pending</option>
                    <option value="Done">Completed</option>
                </select>
            </div>
            <div id="search-options-div" style="display: none" align="center"  >
                <button class="btn btn-default todo-btn" id="search-by-text-id" onclick="showSearchByText()">Search by Text</button>
                <button class="btn btn-default todo-btn" id="search-by-due-date" onclick="showSearchByDate()">Search by Due Date</button>
                <button class="btn btn-default todo-btn" id="search-by-due-days" onclick="showSearchByDays()">Search by Due Days</button>
            </div>

            <div id="sort-options-div" style="display: none" align="center">
                <button class="btn btn-default todo-btn" id="sort-by-creation-date" onclick="sortByCdate()" >Sort by Creation Date</button>
                <button class="btn btn-default todo-btn" id="sort-by-due-date" onclick="sortByDdate()">Sort by Due Date</button>
            </div>
        </div>
        <div id="status-div" align="center">
            <span id="todo-err-msg" class="err-msg" ></span>
            <span id="todo-success-msg" class="success-msg"></span>
        </div>
        <div class="row well">
            <div id="search-by-text-div" class="row">
                <input type="text" id="search-by-text" placeholder="Enter text to search"/>
                <button class="btn btn-default todo-btn" id="search-by-text-btn" onclick="searchByText()">Search</button>
            </div>

            <div id="search-by-date-div" class="row">
                <input type="text" class="datepick" id="datepicker3" placeholder="Select due date to search"/>
                <button class="btn btn-default todo-btn" id="search-by-date-btn" onclick="searchByDate()">Search</button>
            </div>

            <div id="search-by-days-div" class="row">
                <input type="text" id="search-days-id" placeholder="Enter number of days"/>
                <button class="btn btn-default todo-btn" id="search-by-days-btn" onclick="searchByDueDays()">Search</button>
            </div>

            <div id="view-todo-list" style="display: none" class="row">
                <div>
                    <table class="table table-striped" id="todo-table" style="display:none;">
                    </table>
                </div>
            </div>

            <div id="create-todo-list" class="row">
                    <textarea id="todo-item-id" cols="50" rows="3" class="col-sm-6 todo-text" placeholder="Enter your new to do action item"></textarea>
                    <input type="text" class="col-sm-2 datepick" id="datepicker1" placeholder="Select due date" />
                <div class="row">
                    <button id="add-to-do" class="btn btn-default todo-btn" onclick="javascript: addToTodoList()">Save</button>
                </div>
            </div>

            <div id="edit-todo-list" class="row">
                    <textarea id="edit-item-id" cols="30" rows="5" class="col-sm-6 todo-text"></textarea>
                    <input type="text" class="col-sm-2 datepick" id="datepicker2" />
                <div class=""row>
                    <button id="edit-to-do" class = "btn btn-default todo-btn" >Edit</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>