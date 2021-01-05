package model;

public class Student  {

    private int id;
    private int numberOfRents;

    public Student(int id, int numberOfRents){
        this.id = id;
        this.numberOfRents = numberOfRents;
    }

    public int getID() {
        return this.id;
    }

    public void addRent() throws Exception {
        if(numberOfRents>=2){
            throw new Exception("Maximum number of instruments rented already");
        }
    }
}
