public class Book {
    private String isbn;
    private String name;
    private String author;
    private int count;
    private int deleted;

    public Book(String name,String author,int count){
        setName(name);
        setAuthor(author);
        setCount(count);
        this.deleted=0;
    }

    public String getIsbn(){
        return isbn;
    }

    public void setName(String name){
        this.name=name;
    }
    public String getName(){
        return name;
    }

    public void setAuthor(String author){
        this.author=author;
    }
    public String getAuthor(){
        return author;
    }

    public void setCount(int count){
        this.count=count;
    }
    public int getCount(){
        return count;
    }
}
