package Controller;

import integration.SoundGoodDataAccess;
import model.InstrumentForRent;
import model.Rent;
import model.Student;

import java.util.ArrayList;

public class Controller {

    private SoundGoodDataAccess soundgoodDB;

    public Controller(){
        this.soundgoodDB = new SoundGoodDataAccess();
    }

    public ArrayList<InstrumentForRent> listRent(String type){
        return soundgoodDB.getInstrumentsAvailableForRentByType(type);
    }

    public void addRent(String studentId, String instrumentId, String rentMonth) throws Exception {
        Student student = soundgoodDB.getStudentById(studentId);
        InstrumentForRent instrumentForRent = soundgoodDB.getInstrumentForRentById(instrumentId);
        try{
            student.addRent();
            instrumentForRent.allowRent(rentMonth);
            soundgoodDB.insertRent(student, instrumentForRent, rentMonth);
        }catch (Exception e1){
            throw new Exception(e1.getMessage());
        }

    }

    public void removeRent(String rentId) throws Exception {
        Rent rent = soundgoodDB.getRentById(rentId);

        try{
            rent.terminate();
            soundgoodDB.terminateRent(rentId);
        }catch (Exception e1){
            throw new Exception(e1.getMessage());
        }



    }

}
