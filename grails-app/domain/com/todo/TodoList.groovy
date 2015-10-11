package com.todo

class TodoList {
    String todoItem
    Date dueDate
    Date creationDate
    String status

    static constraints = {
    }
    static mapping = {
        sort dueDate: "asc"
        sort creationDate: "desc"
    }
}
