package Pojo;
// Generated 16/05/2016 08:25:28 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Vencimiento generated by hbm2java
 */
public class Vencimiento  implements java.io.Serializable {


     private Integer venCodigo;
     private Producto producto;
     private String venLote;
     private Date venFecha;
     private Date venFechaVencimiento;
     private Integer venCantidad;
     private String venValorVenta;
     private String venValorCompra;

    public Vencimiento() {
    }

	
    public Vencimiento(Date venFecha) {
        this.venFecha = venFecha;
    }
    public Vencimiento(Producto producto, String venLote, Date venFecha, Date venFechaVencimiento, Integer venCantidad, String venValorVenta, String venValorCompra) {
       this.producto = producto;
       this.venLote = venLote;
       this.venFecha = venFecha;
       this.venFechaVencimiento = venFechaVencimiento;
       this.venCantidad = venCantidad;
       this.venValorVenta = venValorVenta;
       this.venValorCompra = venValorCompra;
    }
   
    public Integer getVenCodigo() {
        return this.venCodigo;
    }
    
    public void setVenCodigo(Integer venCodigo) {
        this.venCodigo = venCodigo;
    }
    public Producto getProducto() {
        return this.producto;
    }
    
    public void setProducto(Producto producto) {
        this.producto = producto;
    }
    public String getVenLote() {
        return this.venLote;
    }
    
    public void setVenLote(String venLote) {
        this.venLote = venLote;
    }
    public Date getVenFecha() {
        return this.venFecha;
    }
    
    public void setVenFecha(Date venFecha) {
        this.venFecha = venFecha;
    }
    public Date getVenFechaVencimiento() {
        return this.venFechaVencimiento;
    }
    
    public void setVenFechaVencimiento(Date venFechaVencimiento) {
        this.venFechaVencimiento = venFechaVencimiento;
    }
    public Integer getVenCantidad() {
        return this.venCantidad;
    }
    
    public void setVenCantidad(Integer venCantidad) {
        this.venCantidad = venCantidad;
    }
    public String getVenValorVenta() {
        return this.venValorVenta;
    }
    
    public void setVenValorVenta(String venValorVenta) {
        this.venValorVenta = venValorVenta;
    }
    public String getVenValorCompra() {
        return this.venValorCompra;
    }
    
    public void setVenValorCompra(String venValorCompra) {
        this.venValorCompra = venValorCompra;
    }




}


