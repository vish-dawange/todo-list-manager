<script>
    /**
     * Script to sort to do list by creation date and due date
     * */

    function dispalySortOptions() {
        getTodoList(0);
        $("#sort-options-div").show();
    }

    function sortByCdate() {
        hideAll();
        $("#sort-options-div").show();
        $("#view-todo-list").show();
        setTableHeaders();
        $.getJSON('<g:createLink controller="todoDashboard" action="sortByCDate"/>', function(data){
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
        });
    }

    function sortByDdate() {
        hideAll();
        $("#sort-options-div").show();
        $("#search-by-text-div").hide();
        $("#view-todo-list").show();
        setTableHeaders();
        $.getJSON('<g:createLink controller="todoDashboard" action="sortByDDate"/>',function(data){
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
        });
    }

</script>