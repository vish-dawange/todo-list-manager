<script>
    /**
     * Script to edit to do list
     * */

    function editTodoItem(todoId) {
        hideAll();
        $("#edit-item-id").val("");
        $('#datepicker2').val("");
        $("#edit-todo-list").show();

        $.ajax({
            url: '<g:createLink controller="todoDashboard" action="fetchTodo"/>',
            data: {"id": todoId},
            type: 'post',
            async: true,
            success: function (data) {
                if(data.error) {
                    $("#status-div").show();
                    $("#todo-err-msg").html("No records found.").show().delay(4000).fadeOut('slow');
                } else {
                    todoItToEdit = todoId;
                    $("#edit-item-id").val(data["todoItem"]);
                    $('#datepicker2').val(data["dueDate"]);
                    $("#edit-to-do").click(function() {
                        updateTodo(todoId)
                    });
                }
            },
            error: function() {
                $("#status-div").show();
                $("#todo-err-msg").html("Failed to fetch Todo item for edit").show();
            }
        });
    }

    function updateTodo(todoItToEdit) {
        if (validateTodoItem($("#edit-item-id").val(), $("#datepicker2").val())) {
            $.ajax({
                url: '<g:createLink controller="todoDashboard" action="editTodo"/>',
                data: {"id": todoItToEdit, "todoItem": $("#edit-item-id").val(), "dueDate": $("#datepicker2").val()},
                type: 'post',
                async: true,
                success: function (data) {
                    if(data.error) {
                        $("#status-div").show();
                        $("#todo-err-msg").html("No records found.").show().delay(4000).fadeOut('slow');
                    } else {
                        getTodoList(0);
                        $("#status-div").show();
                        $("#todo-success-msg").html("To do item saved successfully.").show().delay(4000).fadeOut('slow');
                    }
                },
                error: function () {
                    $("#status-div").show();
                    $("#todo-err-msg").html("Failed to edit to do item").show();
                }
            });
        }
    }

    /**
     * Script to update status of to do list
     * */

    function updateTodoStatus(todoId) {
        $.ajax({
            url: '<g:createLink controller="todoDashboard" action="updateStatus"/>',
            data: {"id": todoId},
            type: 'post',
            success: function (data) {
                if(data.error) {
                    $("#status-div").show();
                    $("#todo-err-msg").html("No records found.").show().delay(4000).fadeOut('slow');
                } else {
                    getTodoList(0);
                    $("#status-div").show();
                    $("#todo-success-msg").html("To do item status updated successfully.").show().delay(4000).fadeOut('slow');
                }
            },
            error: function() {
                $("#status-div").show();
                $("#todo-err-msg").html("Failed to update status").show();
            }
        });
    }
</script>