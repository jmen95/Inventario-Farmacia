package Pojo;
// Generated 9/02/2016 02:16:40 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Notificaciones generated by hbm2java
 */
public class Notificaciones  implements java.io.Serializable {


     private Integer noticodigo;
     private String notidescripcion;
     private Date notifecha;
     private String notivisto;
     private String notilink;
     private String notiestado;

    public Notificaciones() {
    }

    public Notificaciones(String notidescripcion, Date notifecha, String notivisto, String notilink, String notiestado) {
       this.notidescripcion = notidescripcion;
       this.notifecha = notifecha;
       this.notivisto = notivisto;
       this.notilink = notilink;
       this.notiestado = notiestado;
    }
   
    public Integer getNoticodigo() {
        return this.noticodigo;
    }
    
    public void setNoticodigo(Integer noticodigo) {
        this.noticodigo = noticodigo;
    }
    public String getNotidescripcion() {
        return this.notidescripcion;
    }
    
    public void setNotidescripcion(String notidescripcion) {
        this.notidescripcion = notidescripcion;
    }
    public Date getNotifecha() {
        return this.notifecha;
    }
    
    public void setNotifecha(Date notifecha) {
        this.notifecha = notifecha;
    }
    public String getNotivisto() {
        return this.notivisto;
    }
    
    public void setNotivisto(String notivisto) {
        this.notivisto = notivisto;
    }
    public String getNotilink() {
        return this.notilink;
    }
    
    public void setNotilink(String notilink) {
        this.notilink = notilink;
    }
    public String getNotiestado() {
        return this.notiestado;
    }
    
    public void setNotiestado(String notiestado) {
        this.notiestado = notiestado;
    }




}

