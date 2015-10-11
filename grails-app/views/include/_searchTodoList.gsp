<script>
    /**
     * Script to search to do list by text, due date and due days
     * */

    function displaySearchOptions() {
        getTodoList(0);
        $("#search-options-div").show();
    }

    function showSearchByText() {
        hideAll();
        $("#search-options-div").show();
        $("#search-by-text-div").show();
        $("#search-by-text").val("");
        $("#search-by-text").focus();
    }

    function showSearchByDate() {
        hideAll();
        $("#search-by-date-div").show();
        $("#search-options-div").show();
        $("#datepicker3").val("");
        $("#datepicker3").focus();
    }

    function showSearchByDays() {
        hideAll();
        $("#search-by-days-div").show();
        $("#search-options-div").show();
        $("#search-days-id").val("");
        $("#search-days-id").focus();
    }

    function searchByText() {
        hideAll();
        $("#search-options-div").show();
        $("#view-todo-list").show();
        $("#todo-table").show();
        setTableHeaders();
        var count = 1;
        $.ajax({
            url: '<g:createLink controller="todoDashboard" action="searchByText"/>',
            data: {"text": $("#search-by-text").val()},
            type: 'post',
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
                $("#todo-err-msg").html("Failed to search by Text").show();
            }
        });
    }

    function searchByDate() {
        hideAll();
        $("#search-options-div").show();
        $("#view-todo-list").show();
        $("#todo-table").show();
        setTableHeaders();
        var count = 1;
        $.ajax({
            url: '<g:createLink controller="todoDashboard" action="searchByDueDate"/>',
            data: {"dueDate": $("#datepicker3").val()}, //use number of days
            type: 'post',
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
                $("#todo-err-msg").html("Failed to search by Due Dates").show();
            }
        });
    }

    function searchByDueDays() {
        hideAll();
        $("#search-options-div").show();
        $("#view-todo-list").show();
        $("#todo-table").show();
        setTableHeaders();
        var count = 1;
        $.ajax({
            url: '<g:createLink controller="todoDashboard" action="searchByDueDays"/>',
            data: {"dueDays": $("#search-days-id").val()}, //use number of days
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
                $("#todo-err-msg").html("Failed to search by Due Days").show();
            }
        });
    }
</script>