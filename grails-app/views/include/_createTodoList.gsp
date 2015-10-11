<script>
    /**
     * Function to create new to do action item
     * */
    function createNewTodoItem() {
        hideAll();
        $("#todo-item-id").val("");
        $("#datepicker1").val("");
        $(".err-msg").hide();
        $("#create-todo-list").show();
    }

    /**
     * Function to add new to do item to db
     * */
    function addToTodoList() {
        if(validateTodoItem($("#todo-item-id").val(), $("#datepicker1").val()) ) {
            var ui_data = {
                "todoItem": $("#todo-item-id").val(),
                "dueDate": $("#datepicker1").val()
            };

            $.ajax({
                url: '<g:createLink controller="todoDashboard" action="addTodoItem"/>',
                data: JSON.stringify(ui_data),
                type: 'post',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if(data.error) {
                        $("#status-div").show();
                        $("#todo-err-msg").html("No records found.").show().delay(4000).fadeOut('slow');
                    } else {
                        getTodoList(0);
                        $("#status-div").show();
                        $("#todo-success-msg").html("New to do item added successfully.").show().delay(4000).fadeOut('slow');
                    }
                },
                error: function() {
                    $("#status-div").show();
                    $("#todo-err-msg").html("Failed to add new to do item").show();
                }
            });
        }
    }

</script>