<script>
    /**
     * Function to fetch whole to do list
     * */

    $(function() {
        getTodoList(0);
    });

    function getTodoList(flag) {
        hideAll();
        if(flag == 1) {
            $("#dashboard-filter").show();
        }
        $("#view-todo-list").show();
        setTableHeaders();
        $.getJSON('<g:createLink controller="todoDashboard" action="todoListViaAjax"/>',function(data){
            var rowData = JSON.stringify(data);
            var count = 1;
            if(data.error) {
                $("#status-div").show();
                $("#todo-err-msg").html("No records found.").show().delay(4000).fadeOut('slow');
            } else {
                $.each(data, function(index, rowData) {
                    if(rowData[3] == "Done") {
                        $("#todo-table").append('<tr>' +
                        '<td>'+count+'</td>' +
                        '<td>'+rowData[1]+'</td>' +
                        '<td>'+rowData[2]+'</td>' +
                        '<td>'+rowData[3]+'</td>' +
                        '<td>'+rowData[4]+'</td>' +
                        '<td><button class="completed btn btn-default" id="status-'+rowData[0]+'">'+"Completed"+'</button >' +'</td>' +
                        '<td><button class="edit-btn btn btn-default" id="edit-'+rowData[0]+'">'+"Edit"+'</button></td>' +
                        '<td><button class="delete-btn btn btn-default" id="delete-'+rowData[0]+'">'+"Delete"+'</button></td>' +
                        '</tr>');
                        var idToDisable = "#status-"+rowData[0];
                        $(idToDisable).prop('disabled', true);
                        $("#edit-"+rowData[0]).prop('disabled', true);
                    } else {
                        $("#todo-table").append('<tr>' +
                        '<td>'+count+'</td>' +
                        '<td>'+rowData[1]+'</td>' +
                        '<td>'+rowData[2]+'</td>' +
                        '<td>'+rowData[3]+'</td>' +
                        '<td>'+rowData[4]+'</td>' +
                        '<td><button class="status-btn btn btn-default" id="status-'+rowData[0]+'">'+"Mark as Complete"+'</button >' +'</td>' +
                        '<td><button class="edit-btn btn btn-default" id="edit-'+rowData[0]+'">'+"Edit"+'</button>' +'</td>' +
                        '<td><button class="delete-btn btn btn-default" id="delete-'+rowData[0]+'">'+"Delete"+'</button></td>' +
                        '</tr>');

                        var idToDisable = "#status-"+rowData[0];
                        $(idToDisable).prop('disabled', false);
                        $("#edit-"+rowData[0]).prop('disabled', false);
                    }
                    count++;
                });
            }
        });
    }

    /**
     * Function to filter to do list by status
     * */

    //Filter options like All, Pending, Completed
    function dispalyFilterOptions() {
        getTodoList(1);
        $("#filter-option-id").val("All");
        $("#dashboard-filter").show();
        $("#view-todo-list").show();
    }

    function displayToDoListByFilter(val) {
        $("#dashboard-filter").show();
        if(val == "All") {
            getTodoList(1);
        } else {
            showTodoItemsByStatus(val);
        }
    }

    /**
     * Function to display to do list by status
     * */
    function showTodoItemsByStatus(val) {
        hideAll();
        $("#dashboard-filter").show();
        $("#view-todo-list").show();
        $("#todo-table").show();
        setTableHeaders();
        var count = 1;
        $.ajax({
            url: '<g:createLink controller="todoDashboard" action="fetchTodoItemsByStatus"/>',
            data: {"status": val},
            type: 'get',
            success: function (data) {
                if(data.error) {
                    $("#status-div").show();
                    $("#todo-err-msg").html("No records found.").show().delay(4000).fadeOut('slow');
                } else {
                    $.each(data, function(index, rowData) {
                        if(rowData[3] == "Done") {
                            $("#todo-table").append('<tr>' +
                            '<td>'+count+'</td>' +
                            '<td>'+rowData[1]+'</td>' +
                            '<td>'+rowData[2]+'</td>' +
                            '<td>'+rowData[3]+'</td>' +
                            '<td>'+rowData[4]+'</td>' +
                            '<td><button class="status-btn btn btn-default" id="status-'+rowData[0]+'">'+"Completed"+'</button ></td>' +
                            '<td><button class="edit-btn btn btn-default" id="edit-'+rowData[0]+'">'+"Edit"+'</button></td>' +
                            '<td><button class="delete-btn btn btn-default" id="delete-'+rowData[0]+'">'+"Delete"+'</button></td>' +
                            '</tr>');

                            var idToDisable = "#status-"+rowData[0];
                            $(idToDisable).prop('disabled', true);
                            $("#edit-"+rowData[0]).prop('disabled', true);
                        } else {
                            $("#todo-table").append('<tr>' +
                            '<td>'+count+'</td>' +
                            '<td>'+rowData[1]+'</td>' +
                            '<td>'+rowData[2]+'</td>' +
                            '<td>'+rowData[3]+'</td>' +
                            '<td>'+rowData[4]+'</td>' +
                            '<td><button class="status-btn btn btn-default" id="status-'+rowData[0]+'">'+"Mark as Complete"+'</button ></td>' +
                            '<td><button class="edit-btn btn btn-default" id="edit-'+rowData[0]+'">'+"Edit"+'</button></td>' +
                            '<td><button class="delete-btn btn btn-default" id="delete-'+rowData[0]+'">'+"Delete"+'</button></td>' +
                            '</tr>');
                            var idToDisable = "#status-"+rowData[0];
                            $(idToDisable).prop('disabled', false);
                            $("#edit-"+rowData[0]).prop('disabled', false);
                        }
                        count++;
                    });
                }
            },
            error: function() {
                $("#status-div").show();
                $("#todo-err-msg").html("Failed to filter by Status "+val).show();
            }
        });
    }
</script>