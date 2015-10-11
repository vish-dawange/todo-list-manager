<script>
    /**
     * Script to delete to do list
     * */

    function deleteTodoItem(todoId) {
        $.ajax({
            url: '<g:createLink controller="todoDashboard" action="deleteTodo"/>',
            data: {"id": todoId},
            type: 'post',
            success: function (data) {
                if(data.error) {
                    $("#status-div").show();
                    $("#todo-err-msg").html("No records found.").show().delay(4000).fadeOut('slow');
                } else {
                    getTodoList(0);
                    $("#status-div").show();
                    $("#todo-success-msg").html("To do item deleted successfully.").show().delay(4000).fadeOut('slow');
                }
            },
            error: function() {
                $("#status-div").show();
                $("#todo-err-msg").html("Failed to Delete to do item").show();
            }
        });
    }

</script>