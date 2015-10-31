/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Joel
 */
public class Vendor {
    
    private String username;
    private String password;
    private String id;
    
    public Vendor(String username, String password, String id){
        this.username = username;
        this.password = password;
        this.password = id;
    }
    
    public String getUsername(){
        return username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public String getId(){
        return id;
    }
    
    public void setUsername(){
        this.username = username;
    }
    
    public void setPassword(){
        this.password = password;
    }
    
    public void setId(){
        this.id = id;
    }
}
