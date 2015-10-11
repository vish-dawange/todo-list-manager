package todo

import com.todo.TodoList
import grails.transaction.Transactional

@Transactional
/**
 * Service to manage all operations on to do list
 * */
class ManageTodoDashboardService {

    /**
     *This service adds new to do item in the to do list
     * @return newly added to do item
     * */
    def addTodoActionItem(def newTodo) {
        try {
            log.info("[addTodoActionItem] --> Initializing")
            def today = new Date()
            def due = new Date().parse("yyyy-MM-dd", newTodo.dueDate)

            TodoList todoList = new TodoList(
                    "todoItem"      :       newTodo.todoItem,
                    "dueDate"       :       due,
                    "creationDate"  :       today,
                    "status"        :       "Pending"
            ).save(flush: true)
            log.info("[addTodoActionItem] --> todo action item saved to db")
            return todoList
        } catch (Exception e) {
            log.error("[addTodoActionItem] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service fetches whole to do to do list
     * @return to do list saved in db
     * */
    def fetchTodoList() {
        try {
            log.info("[fetchTodoList] --> Initializing")
            def todoList = TodoList.getAll()
            if(!todoList)
                return ["error": "No records found"]
            Map returnMap = [:]
            todoList.each {
                List rowData = []
                rowData << it.id
                rowData << it.todoItem
                rowData << it.dueDate.format("yyyy-MM-dd")
                rowData << it.status
                rowData << it.creationDate.format("yyyy-MM-dd")
                returnMap["todo"+it.id]=rowData
            }
            log.info("[fetchTodoList] --> todo list fetched successfully")
            return returnMap
        } catch (Exception e) {
            log.error("[fetchTodoList] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service updates to do item status
     * @return updated to do item
     * */
    def updateTodoStatus(def todoId) {
        try {
            log.info("[updateTodoStatus] --> Initializing ")
            TodoList updateTodo = TodoList.get(todoId)
            if(!updateTodo)
                return ["error": "No records found"]
            updateTodo.status = "Done"
            updateTodo.save(flush: true)
            log.info("[updateTodoStatus] --> todo action status updated for id $todoId")
            return updateTodo.status
        } catch (Exception e) {
            log.error("[updateTodoStatus] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service edits to do item in the to do list
     * @return edited to do item
     * */
    def editTodoItem(Map updatedTodo) {
        try {
            log.info("[editTodoItem] --> Initializing")
            def due = new Date().parse("yyyy-MM-dd", updatedTodo.dueDate)
            TodoList editTodo = TodoList.get(updatedTodo.id)
            if(!editTodo)
                return ["error": "No records found"]
            editTodo.todoItem = updatedTodo.todoItem
            editTodo.dueDate = due
            editTodo.save(flush: true)
            log.info("[editTodoItem] --> Todo item updated successfully")
            return editTodo
        } catch (Exception e) {
            log.error("[editTodoItem] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service is fetches single to do item from the to do list
     * @return to do item
     * */
    def fetchTodo(def id) {
        try {
            log.info("[fetchTodo] --> Initializing")
            TodoList data = TodoList.get(id)
            if(!data)
                return ["error": "No records found"]
            Map returnMap = ["todoItem":data.todoItem, "dueDate":data.dueDate.format("yyyy-MM-dd")]
            log.info("[fetchTodo] --> todo item fetched successfully")
            return returnMap
        } catch (Exception e) {
            log.error("[fetchTodo] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service deleted to do item from the to do list
     * @return true if deleted
     * */
    def deleteTodo(def id) {
        try {
            log.info("[deleteTodo] --> Initializing")
            TodoList deleteTodo = TodoList.get(id)
            if(!deleteTodo)
                return ["error": "No records found"]
            deleteTodo.delete()
            log.info("[deleteTodo] --> todo item deleted successfully")
            return true
        } catch (Exception e) {
            log.error("[deleteTodo] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service sorts to do item by creation date
     * @return sorted to do list
     * */
    def sortByCdate() {
        try {
            log.info("[sortByCdate] --> Initializing")
            def todoList = TodoList.list(sort: "creationDate")
            if(!todoList)
                return ["error": "No records found"]
            Map returnMap = [:]
            todoList.each {
                List rowData = []
                rowData << it.id
                rowData << it.todoItem
                rowData << it.dueDate.format("yyyy-MM-dd")
                rowData << it.status
                rowData << it.creationDate.format("yyyy-MM-dd")
                returnMap["todo"+it.id]=rowData
            }
            log.info("[sortByCdate] --> todo items sorted successfully by Creation Date")
            return returnMap
        } catch (Exception e) {
            log.error("[sortByCdate] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service sorts to do items by due date
     * @return sorted to do list
     * */
    def sortByDdate() {
        try {
            log.info("[sortByDdate] --> Initializing")
            def todoList = TodoList.list(sort: "dueDate")
            if(!todoList)
                return ["error": "No records found"]
            Map returnMap = [:]
            todoList.each {
                List rowData = []
                rowData << it.id
                rowData << it.todoItem
                rowData << it.dueDate.format("yyyy-MM-dd")
                rowData << it.status
                rowData << it.creationDate.format("yyyy-MM-dd")
                returnMap["todo"+it.id]=rowData
            }
            log.info("[sortByDdate] --> todo items sorted successfully by Due Date")
            return returnMap
        } catch (Exception e) {
            log.error("[sortByDdate] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service search to do item by due date
     * @return to do list of matching criterion
     * */
    def searchByDueDate(def dueDate) {
        try{
            log.info("[searchByDueDate] --> Initializing")
            Date due = new Date().parse("yyyy-MM-dd", dueDate) //.format("yyyy-MM-dd")
            print "Date to search service: "+due

            def todoDetailsByDDate = TodoList.findAllByDueDate(due, [readOnly: true])
            if(!todoDetailsByDDate)
                return ["error": "No records found"]
            Map returnMap = [:]
            todoDetailsByDDate.each {
                List rowData = []
                rowData << it.id
                rowData << it.todoItem
                rowData << it.dueDate.format("yyyy-MM-dd")
                rowData << it.status
                rowData << it.creationDate.format("yyyy-MM-dd")
                returnMap["todo"+it.id]=rowData
            }
            log.info("[searchByDueDate] --> todo items searched successfully by Due Date")
            return returnMap
        } catch (Exception e) {
            log.error("[searchByDueDate] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service search to do item by due days
     * @return to do list of matching criterion
     * */
    def searchByDueDays(Integer days) {
        try{
            log.info("[searchByDueDays] --> Initializing")
            Date today = new Date()
            def todoDetailsByDDate = TodoList.findAllByDueDateGreaterThanAndDueDateLessThan(today, today+days, [readOnly: true])
            if(!todoDetailsByDDate)
                return ["error": "No records found"]
            Map returnMap = [:]
            todoDetailsByDDate.each {
                List rowData = []
                rowData << it.id
                rowData << it.todoItem
                rowData << it.dueDate.format("yyyy-MM-dd")
                rowData << it.status
                rowData << it.creationDate.format("yyyy-MM-dd")
                returnMap["todo"+it.id]=rowData
            }
            log.info("[searchByDueDays] --> todo items searched successfully by Due Days")
            return returnMap
        } catch (Exception e) {
            log.error("[searchByDueDays] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service search to do item by text
     * @return to do list of matching criterion
     * */
    def searchByText(def text) {
        try {
            log.info("[searchByText] --> Initializing")
            print "In service:Search text: "+text
            def todoDetailsByText = TodoList.findAllByTodoItemLike("%"+text+"%", [readOnly: true])
            if(!todoDetailsByText)
                return ["error": "No records found"]
            Map returnMap = [:]
            todoDetailsByText.each {
                List rowData = []
                rowData << it.id
                rowData << it.todoItem
                rowData << it.dueDate.format("yyyy-MM-dd")
                rowData << it.status
                rowData << it.creationDate.format("yyyy-MM-dd")
                returnMap["todo"+it.id]=rowData
            }
            log.info("[searchByText] --> todo items searched successfully by text")
            return returnMap
        } catch (Exception e) {
            log.error("[searchByText] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }

    /**
     *This service fetched to do items by status
     * @return to do list of matching status
     * */
    def fetchTodoItemsByStatus(def status) {
        try {
            log.info("[fetchTodoItemsByStatus] --> Initializing")
            def todoDetailsByText = TodoList.findAllByStatus(status, [readOnly: true])
            if(!todoDetailsByText)
                return ["error": "No records found"]
            Map returnMap = [:]
            todoDetailsByText.each {
                List rowData = []
                rowData << it.id
                rowData << it.todoItem
                rowData << it.dueDate.format("yyyy-MM-dd")
                rowData << it.status
                rowData << it.creationDate.format("yyyy-MM-dd")
                returnMap["todo"+it.id]=rowData
            }
            log.info("[fetchTodoItemsByStatus] --> todo items fetched successfully by status $status")
            return returnMap
        } catch (Exception e) {
            log.error("[fetchTodoItemsByStatus] --> Error: "+e.getMessage())
            //e.printStackTrace()
        }
    }
}
//End: ManageTodoDashboardService