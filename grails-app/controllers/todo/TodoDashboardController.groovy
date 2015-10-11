package todo

import grails.converters.JSON

/**
 * Controller to handle to do list operations
 * */
class TodoDashboardController {

    def manageTodoDashboardService
    def index() {
    }

    /**
     * This action invokes a service to fetch to do list
     * */
    def todoListViaAjax() {
        log.info("[todoListViaAjax] --> Initializing")
        def data = manageTodoDashboardService.fetchTodoList()
        render data as JSON
    }

    /**
     * This action invokes a service to add new to do item in the list
     * */
    def addTodoItem() {
        log.info("[addTodoItem] --> Initializing")
        def requestJson = request.JSON
        Map loadMap = [:]
        loadMap["dueDate"]= requestJson.dueDate
        loadMap["todoItem"] = requestJson.todoItem

        def data = manageTodoDashboardService.addTodoActionItem(loadMap)
        log.info("[addTodoItem] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to update to do item's status
     * */
    def updateStatus() {
        log.info("[updateStatus] --> Initializing")
        def requestJson = params
        def id = requestJson.id
        def data = manageTodoDashboardService.updateTodoStatus(id)
        log.info("[updateStatus] --> rendering data")
        render data
    }

    /**
     * This action invokes a service to edit to do item
     * */
    def editTodo() {
        log.info("[editTodo] --> Initializing")
        Map updatedTodo = [:]
        updatedTodo["id"] = params.id
        updatedTodo["todoItem"] = params.todoItem
        updatedTodo["dueDate"] = params.dueDate
        def data = manageTodoDashboardService.editTodoItem(params)
        log.info("[editTodo] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to fetch to do item
     * */
    def fetchTodo() {
        log.info("[fetchTodo] --> Initializing")
        def data = manageTodoDashboardService.fetchTodo(params.id)
        log.info("[fetchTodo] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to delete to do item
     * */
    def deleteTodo() {
        log.info("[deleteTodo] --> Initializing")
        def data = manageTodoDashboardService.deleteTodo(params.id)
        log.info("[deleteTodo] --> rendering data")
        render data
    }

    /**
     * This action invokes a service to sort to do list by due date
     * */
    def sortByDDate() {
        log.info("[sortByDDate] --> Initializing")
        def data = manageTodoDashboardService.sortByDdate()
        log.info("[sortByDDate] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to sort to do list by ceration date
     * */
    def sortByCDate() {
        log.info("[sortByCDate] --> Initializing")
        def data = manageTodoDashboardService.sortByCdate()
        log.info("[sortByCDate] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to search a to do item by text
     * */
    def searchByText() {
        log.info("[searchByText] --> Initializing")
        def data = manageTodoDashboardService.searchByText(params.text)
        log.info("[searchByText] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to search a to do item by due date
     * */
    def searchByDueDate() {
        log.info("[searchByDueDate] --> Initializing")
        def data = manageTodoDashboardService.searchByDueDate(params.dueDate)
        log.info("[searchByDueDate] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to search a to do item by due days
     * */
    def searchByDueDays() {
        log.info("[searchByDueDays] --> Initializing")
        def data = manageTodoDashboardService.searchByDueDays(Integer.parseInt(params.dueDays))
        log.info("[searchByDueDays] --> rendering data")
        render data as JSON
    }

    /**
     * This action invokes a service to fetch to do items by status
     * */
    def fetchTodoItemsByStatus() {
        log.info("[fetchTodoItemsByStatus] --> Initializing")
        def result = manageTodoDashboardService.fetchTodoItemsByStatus(params.status)
        log.info("[fetchTodoItemsByStatus] --> rendering data")
        render result as JSON
    }
}
//End: TodoDashboardController