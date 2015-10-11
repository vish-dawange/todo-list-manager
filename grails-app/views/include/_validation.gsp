<script>
    $(function() {
        console.log("In todo validation");
    });

    function validateTodoItem(todoAction, dueDate) {
        $("#todo-err-msg").hide();
        $("#status-div").show();
        console.log("Validating new todo item");
        var isTodoItemValid = true;
        var isDueDateValid = true;

        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var today = year +''+month +''+ day;
        dueDate = dueDate.toString();

        //Todo: Check for replaceAll
        dueDate = dueDate.replace('-', '');
        dueDate = dueDate.replace('-', '');


        if( (todoAction == "" || todoAction == null) && (dueDate == "" || dueDate == null ))  {
            console.log("item1");
            $("#todo-err-msg").html("Please add To Do Action Item and a Due Date.").show();
            isTodoItemValid = false;
        } else if( (todoAction == "" || todoAction == null) && (parseInt(dueDate) <= parseInt(today)))  {
            console.log("item1");
            $("#todo-err-msg").html("Please add To Do Action Item and a valid Due Date.").show();
            isTodoItemValid = false;
        } else if(parseInt(dueDate) <= parseInt(today)){
            isDueDateValid = false;
            $("#todo-err-msg").html("Please select valid Due Date.").show();
            console.log("please select valid due date");
        } else if(dueDate == "" || dueDate == null ) {
            console.log("item2");
            $("#todo-err-msg").html("Please select Due Date").show();
            isDueDateValid = false;
        } else if(todoAction == "" || todoAction == null) {
            isDueDateValid = false;
            $("#todo-err-msg").html("Please add To do Action Item").show();
            console.log("Please add To do Action Item");
        }

        console.log(isTodoItemValid && isDueDateValid);
        return isTodoItemValid && isDueDateValid
    }
</script>