package Pojo;
// Generated 16/05/2016 08:25:28 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Marca generated by hbm2java
 */
public class Marca  implements java.io.Serializable {


     private Integer marCodigo;
     private String marNombre;
     private String marDescripcion;
     private String marEstado;
     private Set productos = new HashSet(0);

    public Marca() {
    }

	
    public Marca(String marNombre) {
        this.marNombre = marNombre;
    }
    public Marca(String marNombre, String marDescripcion, String marEstado, Set productos) {
       this.marNombre = marNombre;
       this.marDescripcion = marDescripcion;
       this.marEstado = marEstado;
       this.productos = productos;
    }
   
    public Integer getMarCodigo() {
        return this.marCodigo;
    }
    
    public void setMarCodigo(Integer marCodigo) {
        this.marCodigo = marCodigo;
    }
    public String getMarNombre() {
        return this.marNombre;
    }
    
    public void setMarNombre(String marNombre) {
        this.marNombre = marNombre;
    }
    public String getMarDescripcion() {
        return this.marDescripcion;
    }
    
    public void setMarDescripcion(String marDescripcion) {
        this.marDescripcion = marDescripcion;
    }
    public String getMarEstado() {
        return this.marEstado;
    }
    
    public void setMarEstado(String marEstado) {
        this.marEstado = marEstado;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }




}


