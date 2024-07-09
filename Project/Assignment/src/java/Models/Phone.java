/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author dangd
 */
public class Phone {

    private int phoneid;
    private String model;
    private String ram;
    private String rom;
    private String chip;
    private String battery;
    private String camera;                                
    private float price;
    private String imgProd;

    public Phone() {

    }

    public Phone(int phoneid, String model, String ram, String rom, String chip, String battery, String camera, float price, String imgProd) {
        this.phoneid = phoneid;
        this.model = model;
        this.ram = ram;
        this.rom = rom;
        this.chip = chip;
        this.battery = battery;
        this.camera = camera;
        this.price = price;
        this.imgProd = imgProd;
    }

    public int getPhoneid() {
        return phoneid;
    }

    public void setPhoneid(int phoneid) {
        this.phoneid = phoneid;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getRom() {
        return rom;
    }

    public void setRom(String rom) {
        this.rom = rom;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public String getBattery() {
        return battery;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public String getCamera() {
        return camera;
    }

    public void setCamera(String camera) {
        this.camera = camera;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImgProd() {
        return imgProd;
    }

    public void setImgProd(String imgProd) {
        this.imgProd = imgProd;
    }

    

}