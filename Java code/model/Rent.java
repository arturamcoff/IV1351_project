package model;

public class Rent  {

    private int id;
    private int studentId;

    public Rent(int id, int studentId){
        this.id = id;
        this.studentId = studentId;
    }

    public void terminate() throws Exception {
        if(id!=-1 && studentId!=-1){
            return;
        }else{
            throw new Exception("Rent doesn't exist");
        }
    }


}
