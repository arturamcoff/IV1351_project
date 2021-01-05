package integration;

import model.InstrumentForRent;
import model.Rent;
import model.Student;

import java.sql.*;
import java.util.ArrayList;

public class SoundGoodDataAccess {

    private Connection connection;

    public SoundGoodDataAccess(){
        initializeConnection();
    }

    private void initializeConnection(){
        try {
            connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/soundgood?user=java&password=hej123456");
            connection.setAutoCommit(false);
        }catch(SQLException e1){
            e1.printStackTrace();
        }
    }


    public ArrayList<InstrumentForRent> getInstrumentsAvailableForRentByType(String type){
        ArrayList<InstrumentForRent> resultList = new ArrayList<>();
        String query = String.format("SELECT PFK_id,brand,rent_price FROM insrument_for_rent WHERE rent_id IS NULL AND instrument_type='%s' ORDER BY rent_price ASC", type);
        ResultSet res = null;
        try{
        PreparedStatement statement = connection.prepareStatement(query);
        res = statement.executeQuery();

            while(res.next()){
                InstrumentForRent ifr = new InstrumentForRent(res.getInt("PFK_id"), res.getString("brand"), res.getInt("rent_price"));
                resultList.add(ifr);
            }

        }catch (SQLException e1){
            e1.printStackTrace();
        }
        return resultList;
    }


    public Student getStudentById(String studentId){
        String query2 = String.format("SELECT COUNT(student_id) AS c FROM rent WHERE returned='false' AND student_id=%s", studentId);
        Student result = null;
        int iID = 0;
        try {
            PreparedStatement statement2 = connection.prepareStatement(query2);

            ResultSet resultSet2 =statement2.executeQuery();

            while(resultSet2.next()){
                 iID = resultSet2.getInt("c");
            }

            result = new Student(Integer.parseInt(studentId), iID);
        }catch (SQLException e1){
            e1.printStackTrace();
        }
        return result;
    }

    public InstrumentForRent getInstrumentForRentById(String instrumentId){
        String query1 = String.format("SELECT PFK_id,brand,rent_price,rent_id FROM insrument_for_rent WHERE PFK_id=%s", instrumentId);
        InstrumentForRent result = null;
        try {
            PreparedStatement statement1 = connection.prepareStatement(query1);
            ResultSet res=statement1.executeQuery();

            res.next();
            result = new InstrumentForRent(res.getInt("PFK_id"), res.getString("brand"), res.getInt("rent_price"), res.getInt("rent_id"));
        }catch (SQLException e1){
            e1.printStackTrace();
        }
        return result;


    }


    public void insertRent(Student student, InstrumentForRent instrumentForRent, String rentMonths) throws SQLException {

        try{
            String query1 = String.format("INSERT INTO rent(PK_id,rent_date,rent_until,student_id,returned) VALUES (0,NOW(),DATE_ADD(NOW(), INTERVAL %s MONTH),%s,'false')", rentMonths,student.getID());
            PreparedStatement statement = connection.prepareStatement(query1);
            statement.executeQuery();

            String queryGetLastItem = String.format("SELECT PK_id FROM rent ORDER BY PK_id DESC LIMIT 1");
            statement = connection.prepareStatement(queryGetLastItem);
            ResultSet res = statement.executeQuery();
            res.next();

        String query2 = String.format("UPDATE insrument_for_rent SET rent_id=%s WHERE PFK_id=%s", res.getInt("PK_id"),instrumentForRent.getID());
        statement = connection.prepareStatement(query2);
        statement.executeQuery();
        connection.commit();
        }catch (SQLException e1){
            rollback();
            e1.printStackTrace();
        }


    }

    public Rent getRentById(String rentId) throws SQLException {
        Rent result = null;

        try {
            String query = String.format("SELECT PK_id, student_id FROM rent WHERE PK_id=%s", rentId);
            PreparedStatement statement = connection.prepareStatement(query);
            statement.executeQuery();
            ResultSet res = statement.getResultSet();

            res.next();
            result = new Rent(res.getInt("PK_id"), res.getInt("student_id"));

        }catch (SQLException e1){
            rollback();
            e1.printStackTrace();
        }

        return result;

    }

    public void terminateRent(String rentId) throws SQLException {
        String query1 = String.format("UPDATE rent SET returned='true' WHERE PK_id=%s", rentId);
        String query2 = String.format("UPDATE insrument_for_rent SET rent_id=NULL WHERE rent_id=%s", rentId);

        try {
            PreparedStatement statement = connection.prepareStatement(query1);
            PreparedStatement statement1 = connection.prepareStatement(query2);
            statement.executeQuery();
            statement1.executeQuery();
            connection.commit();

        }catch (SQLException e1){
            rollback();
            e1.printStackTrace();
        }

    }



    private void rollback() throws SQLException {
        connection.rollback();
    }


    public static void main(String args[]){


    }

}





