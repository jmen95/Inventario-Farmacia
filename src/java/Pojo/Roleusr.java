package Pojo;
// Generated 16/05/2016 08:25:28 PM by Hibernate Tools 4.3.1



/**
 * Roleusr generated by hbm2java
 */
public class Roleusr  implements java.io.Serializable {


     private Integer ruid;
     private Role role;
     private Users users;

    public Roleusr() {
    }

    public Roleusr(Role role, Users users) {
       this.role = role;
       this.users = users;
    }
   
    public Integer getRuid() {
        return this.ruid;
    }
    
    public void setRuid(Integer ruid) {
        this.ruid = ruid;
    }
    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }




}


