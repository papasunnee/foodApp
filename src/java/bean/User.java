/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;


/**
 *
 * @author Sunday
 */
public class User {
    private int id;
    private String fname;
    private String lname;
    private String mname;
    private String phone;
    private String email;
    private String address;
    private String username;
    private String password;
    private String employmentdate;
    private String dob;
    private String gender;
    private int role_id ;
    private String name ;
    
    public User() {
    }

    public User(int id, String fname, String lname, String mname, String phone, String email, String address, String username, String password, String gender, int role_id) {
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.mname = mname;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.role_id = role_id;
    }
    
    //User u = new User(0, fname, lname,  mname, phone, email, address, username,  password, gender, roleId) ;
    public User(int id, String fname, String lname, String mname, String phone, String email, String address, String username, String password, String gender, int role_id, String name) {
        this.id = id ;
        this.fname = fname;
        this.lname = lname;
        this.mname = mname;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.role_id = role_id ;
        this.name = name ;
    }
    
    public int getId() {
        return id ;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getFname() {
        return fname ;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }
    public String getLname() {
        return lname ;
    }
    
    public void setLname(String lname) {
        this.lname = lname;
    }
    public String getMname() {
        return mname ;
    }
    
    public void setMname(String mname) {
        this.mname = mname;
    }
    public String getPhone() {
        return phone ;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email ;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAddress() {
        return address ;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getPassword() {
        return password ;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getUsername() {
        return username ;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getEmploymentString() {
        return employmentdate ;
    }
    
    public void setEmploymentdate(String employmentdate) {
        this.employmentdate = employmentdate;
    }
    
    public String getGender() {
        return gender ;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public String getDOB() {
        return dob ;
    }
    
    public void setDOB(String dob) {
        this.dob = dob;
    }
    public int getRoleId() {
        return role_id ;
    }
    
    public void setRoleId(int role_id) {
        this.role_id = role_id;
    }
}
