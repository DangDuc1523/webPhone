/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author dangd
 */
public class Bought {
   private int boughtid;
   private String model;
   private float price;
   private String name;
   private String address;
   private String phonenumber;
   private int processed;

    public Bought() {
    }

    public int getBoughtid() {
        return boughtid;
    }

    public void setBoughtid(int boughtid) {
        this.boughtid = boughtid;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public int getProcessed() {
        return processed;
    }

    public void setProcessed(int processed) {
        this.processed = processed;
    }

    public Bought(int boughtid, String model, float price, String name, String address, String phonenumber, int processed) {
        this.boughtid = boughtid;
        this.model = model;
        this.price = price;
        this.name = name;
        this.address = address;
        this.phonenumber = phonenumber;
        this.processed = processed;
    }

   
   
}
