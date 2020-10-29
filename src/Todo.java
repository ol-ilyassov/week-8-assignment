public class Todo {
    int id;
    String task;

    public Todo(int id, String task) {
        this.id = id;
        this.task = task;
    }

    public int getId() {
        return id;
    }
    public void setId(int id)  {
        this.id = id;
    }
    public String getTask() {
        return task;
    }
    public void setTask(String task)  {
        this.task = task;
    }
}