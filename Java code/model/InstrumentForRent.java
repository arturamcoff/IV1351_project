package model;

public class InstrumentForRent {

    private int id;
    private String brand;
    private int price;
    private int rentId;

    public InstrumentForRent(int id, String brand, int price, int rentId){
        this.id = id;
        this.brand = brand;
        this.price = price;
        this.rentId = rentId;
    }

    public InstrumentForRent(int id, String brand, int price){
        this(id,brand,price,-1);
    }


    public void allowRent(String rentMonth) throws Exception {
        if(rentId!=0){
            throw new Exception("Already rented!");
        }
        if(Integer.parseInt(rentMonth) > 12){
            throw new Exception("Lease time to long!");
        }
        if(Integer.parseInt(rentMonth) < 1){
            throw new Exception("Lease to short!");
        }
    }

    public int getID(){
        return this.id;
    }

    public String getBrand() {
        return this.brand;
    }

    public int getPrice() {
        return this.price;
    }


}
