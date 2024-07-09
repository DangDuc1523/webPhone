/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import Models.Bought;
import Models.Order;
import Models.Phone;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author dangd
 */
public class DAO extends DBContext {

    public static DAO INSTANCE = new DAO();
    private Connection conn;

    private DAO() {
        if (INSTANCE == null) {
            conn = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }
//==============List Phone & Static========

    public ArrayList<Phone> getPhone() {
        ArrayList<Phone> phones = new ArrayList<>();
        try {
            String sql = "Select * from PhoneList";

            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Phone p = new Phone();
                p.setPhoneid(rs.getInt("PhoneID"));
                p.setModel(rs.getString("Model"));
                p.setRam(rs.getString("Ram"));
                p.setRom(rs.getString("Rom"));
                p.setChip(rs.getString("Chip"));
                p.setBattery(rs.getString("Battery"));
                p.setCamera(rs.getString("Camera"));
                p.setPrice(rs.getFloat("Price"));
                p.setImgProd(rs.getString("Img"));
                phones.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return phones;
    }

    public ArrayList<Account> getInfoAccount() {
        ArrayList<Account> accounts = new ArrayList<>();

        try {
            String sql = "select * from CustomerAccount Where Role = 2";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setUserid(rs.getInt("UserID"));
                acc.setUsername(rs.getString("Username"));
                acc.setPassword(rs.getString("Password"));
                acc.setRole(rs.getInt("Role"));
                acc.setName(rs.getString("Name"));
                acc.setPhonenumber(rs.getString("Phonenumber"));
                acc.setAddress(rs.getString("Address"));
                accounts.add(acc);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return accounts;
    }

    public void editInfoAcc(int userdid, String name, String phone, String address) {
        try {
        String sql = "UPDATE CustomerAccount\n"
                + "SET Name = '"+name+"', Phonenumber = '"+phone+"', Address = '"+address+"'\n"
                + "WHERE UserID = "+userdid+";";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    //-----------------------Detail & Search---------
    public Phone getDetail(int idphone) {
        Phone p = null;
        try {
            String sql = "SELECT * FROM PhoneList WHERE PhoneID = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, idphone);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                p = new Phone();
                p.setPhoneid(rs.getInt("PhoneID"));
                p.setModel(rs.getString("Model"));
                p.setRam(rs.getString("Ram"));
                p.setRom(rs.getString("Rom"));
                p.setChip(rs.getString("Chip"));
                p.setBattery(rs.getString("Battery"));
                p.setCamera(rs.getString("Camera"));
                p.setPrice(rs.getFloat("Price"));
                p.setImgProd(rs.getString("Img"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return p;
    }

    public ArrayList<Phone> getSearch(String name) {
        ArrayList<Phone> phones = new ArrayList<>();
        try {
            String sql = "Select * from PhoneList where Model like '%" + name + "%'";

            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Phone p = new Phone();
                p.setPhoneid(rs.getInt("PhoneID"));
                p.setModel(rs.getString("Model"));
                p.setRam(rs.getString("Ram"));
                p.setRom(rs.getString("Rom"));
                p.setChip(rs.getString("Chip"));
                p.setBattery(rs.getString("Battery"));
                p.setCamera(rs.getString("Camera"));
                p.setPrice(rs.getFloat("Price"));
                p.setImgProd(rs.getString("Img"));
                phones.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return phones;
    }

    //----------------------------Account Custom------------------------  
    public Account getCustomAccount(String user, String pass) {
        Account acc = null; // Khởi tạo acc là null

        try {
            String sql = "select * from CustomerAccount where Username like ? and Password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, user);
            statement.setString(2, pass);
            ResultSet rs = statement.executeQuery();

            // Di chuyển ResultSet đến bản ghi đầu tiên (nếu có)
            if (rs.next()) {
                acc = new Account(); // Khởi tạo acc nếu có kết quả

                // Gán dữ liệu từ ResultSet vào đối tượng Account
                acc.setUserid(rs.getInt("UserID"));
                acc.setUsername(rs.getString("Username"));
                acc.setPassword(rs.getString("Password"));
                acc.setRole(rs.getInt("Role"));
                acc.setName(rs.getString("Name"));
                acc.setAddress(rs.getString("Address"));
                acc.setPhonenumber(rs.getString("Phonenumber"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc; // Trả về acc, có thể là null nếu không có kết quả
    }
    
    public Account getUserName(String user) {
        Account acc = null; // Khởi tạo acc là null

        try {
            String sql = "select * from CustomerAccount where Username like ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, user);
            ResultSet rs = statement.executeQuery();

            // Di chuyển ResultSet đến bản ghi đầu tiên (nếu có)
            if (rs.next()) {
                acc = new Account(); // Khởi tạo acc nếu có kết quả

                // Gán dữ liệu từ ResultSet vào đối tượng Account
                acc.setUserid(rs.getInt("UserID"));
                acc.setUsername(rs.getString("Username"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc; // Trả về acc, có thể là null nếu không có kết quả
    }
    

    //-------------------------------Add Acount & check PhoneNumber--------------------------
    public void addAcc(String user, String pass, String yourname, String phonenumber, String address) {
        try {
            String sql = "INSERT INTO CustomerAccount (Username, Password, Role, Name, Phonenumber, Address) VALUES (?,?,2,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, user);
            statement.setString(2, pass);
            statement.setString(3, yourname);
            statement.setString(4, phonenumber);
            statement.setString(5, address);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account getPhoneAccount(String numberphone) {
        Account info = null;

        try {
            String sql = "select * from CustomerAccount where Phonenumber = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, numberphone);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                info = new Account();
                info.setUsername(rs.getString("username"));
                info.setPhonenumber(rs.getString("Phonenumber"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return info;
    }

    //--------------------------------- Order------------------------------------------ 
    public ArrayList<Order> getOrder(int id) {
        ArrayList<Order> orderList = new ArrayList<>();
        try {
            String sql = "SELECT O.OrderID, O.UserID, O.PhoneID, PL.Price, PL.Model FROM Orders O JOIN CustomerAccount CA ON O.UserID = CA.UserID JOIN PhoneList PL ON O.PhoneID = PL.PhoneID Where O.UserID = " + id + "";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderid(rs.getInt("OrderID"));
                o.setUserid(rs.getInt("UserID"));
                o.setPhoneid(rs.getInt("PhoneID"));
                o.setModel(rs.getString("Model"));
                o.setPrice(rs.getFloat("Price"));
                orderList.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderList;
    }

    public void DeleteOrder(int idorder) {
        try {
            String sql = "DELETE FROM Orders WHERE OrderID = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, idorder);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error deleting phone: " + e.getMessage());
        }
    }

    public void addOrder(int userid, int phoneid) {
        try {
            String sql = "INSERT INTO Orders (UserID, PhoneID) VALUES (?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, userid);
            statement.setInt(2, phoneid);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //=======================Bought===================
    public ArrayList<Bought> getBought(int id) {
        ArrayList<Bought> boughtList = new ArrayList<>();
        try {
            String sql = "SELECT so.BoughtID, so.Processed, pl.Model, ca.Name, ca.Address, ca.Phonenumber, so.Price\n"
                    + "FROM SuccessfulOrders so\n"
                    + "INNER JOIN PhoneList pl ON so.PhoneID = pl.PhoneID\n"
                    + "INNER JOIN CustomerAccount ca ON so.UserID = ca.UserID Where so.UserID = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Bought bought = new Bought();
                bought.setBoughtid(rs.getInt("BoughtID"));
                bought.setModel(rs.getString("Model"));
                bought.setPrice(rs.getFloat("Price"));
                bought.setName(rs.getString("Name"));
                bought.setAddress(rs.getString("Address"));
                bought.setPhonenumber(rs.getString("Phonenumber"));
                bought.setProcessed(rs.getInt("Processed"));
                boughtList.add(bought);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return boughtList;
    }

    public void addBought(int userid, int phoneid, float price) {
        try {
            String sql = "INSERT INTO SuccessfulOrders (UserID, PhoneID,Price, Processed)\n"
                    + "VALUES (?,?,?,1);";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, userid);
            statement.setInt(2, phoneid);
            statement.setFloat(3, price);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //------------------Admin add,edit,delete Product // manager Order-------------------
    public void addPhone(String model, String ram, String rom, String chip, String battery, String camera, float price,String img) {
        try {
            String sql = "INSERT INTO PhoneList (Model, Ram, Rom, Chip, Battery, Camera, Price,Img) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, model);
            statement.setString(2, ram);
            statement.setString(3, rom);
            statement.setString(4, chip);
            statement.setString(5, battery);
            statement.setString(6, camera);
            statement.setFloat(7, price);
            statement.setString(8, img);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void EditPhone(int idphone, String model, String ram, String rom, String chip, String battery, String camera, float price,String img) {
        try {
            String sql = "UPDATE PhoneList SET Model=?, Ram=?, Rom=?, Chip=?, Battery=?, Camera=?, Price=?, Img=? WHERE PhoneID=?";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, model);
            statement.setString(2, ram);
            statement.setString(3, rom);
            statement.setString(4, chip);
            statement.setString(5, battery);
            statement.setString(6, camera);
            statement.setFloat(7, price);
            statement.setString(8, img);
            statement.setInt(9, idphone);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error editing phone: " + e.getMessage());
        }
    }

    public void DeletePhone1(int idphone) {
        try {
            String sql = "DELETE FROM Orders WHERE PhoneID = " + idphone + "; DELETE FROM PhoneList WHERE PhoneID = " + idphone + ";";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error deleting phone: " + e.getMessage());
        }
    }
     public void DeletePhone2(int idphone) {
        try {
            String sql = "DELETE FROM PhoneList WHERE PhoneID = " + idphone + ";";
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error deleting phone: " + e.getMessage());
        }
    }

    public ArrayList<Bought> adminBought() {
        ArrayList<Bought> boughtList = new ArrayList<>();
        try {
            String sql = "SELECT so.BoughtID, so.Processed, pl.Model, ca.Name, ca.Address, ca.Phonenumber, so.Price\n"
                    + "FROM SuccessfulOrders so\n"
                    + "INNER JOIN PhoneList pl ON so.PhoneID = pl.PhoneID\n"
                    + "INNER JOIN CustomerAccount ca ON so.UserID = ca.UserID ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Bought bought = new Bought();
                bought.setBoughtid(rs.getInt("BoughtID"));
                bought.setModel(rs.getString("Model"));
                bought.setPrice(rs.getFloat("Price"));
                bought.setName(rs.getString("Name"));
                bought.setAddress(rs.getString("Address"));
                bought.setPhonenumber(rs.getString("Phonenumber"));
                bought.setProcessed(rs.getInt("Processed"));
                boughtList.add(bought);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return boughtList;
    }

    public void changeBought(int idbought, int process) {
        try {
            String sql = "UPDATE SuccessfulOrders SET Processed = ? WHERE BoughtID = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, process);
            statement.setInt(2, idbought);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//================================Main Test===================
    public static void main(String[] args) {

        DAO c = DAO.INSTANCE;


//        Account a = c.getPhoneAccount("0987654322");
//        System.out.println(a.getPhonenumber());
        //c.adminBought();
//        c.addBought(2);
//        ArrayList<GetBought> g = c.adminBought();
//        for(int i = 0 ; i < g.size(); i++){
//       System.out.println(g.get(i).getBoughtid());
//        System.out.println(g.get(i).getModel());
//        System.out.println(g.get(i).getPrice());
//        System.out.println(g.get(i).isProcessed());
//        }
//        Account o = c.getCustomAccount("quangml","111");
//        c.addAcc("a"," b"," c", "098", "e");
//        System.out.println(o.getUsername());
//        System.out.println(o.getPassword());
//        Account acc = c.getPhoneAccount("123456789");
//        System.out.println(acc.getPhonenumber());
//       Account A = c.getPhoneAccount("1");
//        System.out.println(A);
//        c.DeleteOrder(1);
//          ArrayList<Bought> b =  c.getBought(1);
//         System.out.println(b.get(0).getModel());
//        System.out.println(b.get(0).getPrice());
//         System.out.println(b.get(0).isProcessed());
    }

}
