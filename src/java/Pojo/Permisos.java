package Pojo;
// Generated 16/05/2016 08:25:28 PM by Hibernate Tools 4.3.1



/**
 * Permisos generated by hbm2java
 */
public class Permisos  implements java.io.Serializable {


     private Integer perid;
     private Paginas paginas;
     private Role role;
     private String peredita;

    public Permisos() {
    }

    public Permisos(Paginas paginas, Role role, String peredita) {
       this.paginas = paginas;
       this.role = role;
       this.peredita = peredita;
    }
   
    public Integer getPerid() {
        return this.perid;
    }
    
    public void setPerid(Integer perid) {
        this.perid = perid;
    }
    public Paginas getPaginas() {
        return this.paginas;
    }
    
    public void setPaginas(Paginas paginas) {
        this.paginas = paginas;
    }
    public Role getRole() {
        return this.role;
    }
    
    public void setRole(Role role) {
        this.role = role;
    }
    public String getPeredita() {
        return this.peredita;
    }
    
    public void setPeredita(String peredita) {
        this.peredita = peredita;
    }




}


