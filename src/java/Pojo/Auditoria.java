package Pojo;
// Generated 9/02/2016 02:16:40 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Auditoria generated by hbm2java
 */
public class Auditoria  implements java.io.Serializable {


     private Integer codigo;
     private Users users;
     private Date fecha;
     private Date hora;
     private String accion;

    public Auditoria() {
    }

    public Auditoria(Users users, Date fecha, Date hora, String accion) {
       this.users = users;
       this.fecha = fecha;
       this.hora = hora;
       this.accion = accion;
    }
   
    public Integer getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public Date getHora() {
        return this.hora;
    }
    
    public void setHora(Date hora) {
        this.hora = hora;
    }
    public String getAccion() {
        return this.accion;
    }
    
    public void setAccion(String accion) {
        this.accion = accion;
    }




}


