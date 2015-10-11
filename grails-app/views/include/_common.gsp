<script>
    $(function() {
        registerStatusClickEvent();
        setDatePicker();
        registerFilterClickEvent();
    });

    function registerFilterClickEvent() {
        $("#filter-option-id").on("click", function() {
            var val = $("#filter-option-id").val();
            console.log("Val:" +val);
            //send ajax request for selected value
            displayToDoListByFilter(val);
        });
    }


    function setDatePicker() {
        $('.datepick').each(function(){
            $(this).datepicker();
        });

        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            showOn: "both",
            buttonImageOnly: true,
            buttonText: "Calendar"
        });
    }
    function registerDashboardClickEvent() {
        $("#sort-by-creation-date").click(function() {

        });
    }
    function registerStatusClickEvent() {
        $("#todo-table").on('click', '.status-btn', function() {
            console.log(this.id);
            var todoId = this.id.split('-')[1].trim();
            console.log("Id to update: "+todoId);
            updateTodoStatus(todoId);
        });

        $("#todo-table").on('click', '.edit-btn', function() {
            var todoId = this.id.split('-')[1].trim();
            console.log(this.id);
            editTodoItem(todoId);

        });

        $("#todo-table").on('click', '.delete-btn', function() {
            var todoId = this.id.split('-')[1].trim();
            console.log(this.id);
            deleteTodoItem(todoId);
        });
    }

    function hideAll() {
        $("#view-todo-list").hide();
        $("#create-todo-list").hide();
        $("#edit-todo-list").hide();
        $("#search-by-text-div").hide();
        $("#search-by-date-div").hide();
        $("#search-by-days-div").hide();
        $("#search-options-div").hide();
        $("#sort-options-div").hide();
        $("#dashboard-filter").hide();
        $("#status-div").hide();
    }

    function setTableHeaders() {
        $("#view-todo-list").show();
        var htmlString = '<thead>'+
                '<tr>'+
                '<th>'+" Id"+'</th>'+
                '<th>'+" Action Item"+'</th>'+
                '<th>'+" Due Date"+'</th>'+
                '<th>'+" Status"+'</th>'+
                '<th>'+" Creation Date"+'</th>'+
                '</tr>'+
                '</thead>';

        $("#todo-table").html(htmlString);
        $("#todo-table").show();
    }
</script>