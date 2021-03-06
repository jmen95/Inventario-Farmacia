package Pojo;
// Generated 16/05/2016 08:25:28 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Producto generated by hbm2java
 */
public class Producto  implements java.io.Serializable {


     private String proCodigoBarra;
     private Grupo grupo;
     private Marca marca;
     private Tipodescarga tipodescarga;
     private String proNombre;
     private Integer proValorCompra;
     private Integer proStockMaximo;
     private Integer proStockMinimo;
     private Integer proStockBodega;
     private String proEstado;
     private Date proFechaIngreso;
     private String proUbicacion;
     private String proImagen;
     private Date proFechaVencimiento;
     private String proReferencia;
     private String proLote;
     private Integer proIdUsuario;
     private Set movimientoses = new HashSet(0);
     private Set vencimientos = new HashSet(0);

    public Producto() {
    }

	
    public Producto(String proCodigoBarra, String proEstado, Date proFechaIngreso) {
        this.proCodigoBarra = proCodigoBarra;
        this.proEstado = proEstado;
        this.proFechaIngreso = proFechaIngreso;
    }
    public Producto(String proCodigoBarra, Grupo grupo, Marca marca, Tipodescarga tipodescarga, String proNombre, Integer proValorCompra, Integer proStockMaximo, Integer proStockMinimo, Integer proStockBodega, String proEstado, Date proFechaIngreso, String proUbicacion, String proImagen, Date proFechaVencimiento, String proReferencia, String proLote, Integer proIdUsuario, Set movimientoses, Set vencimientos) {
       this.proCodigoBarra = proCodigoBarra;
       this.grupo = grupo;
       this.marca = marca;
       this.tipodescarga = tipodescarga;
       this.proNombre = proNombre;
       this.proValorCompra = proValorCompra;
       this.proStockMaximo = proStockMaximo;
       this.proStockMinimo = proStockMinimo;
       this.proStockBodega = proStockBodega;
       this.proEstado = proEstado;
       this.proFechaIngreso = proFechaIngreso;
       this.proUbicacion = proUbicacion;
       this.proImagen = proImagen;
       this.proFechaVencimiento = proFechaVencimiento;
       this.proReferencia = proReferencia;
       this.proLote = proLote;
       this.proIdUsuario = proIdUsuario;
       this.movimientoses = movimientoses;
       this.vencimientos = vencimientos;
    }
   
    public String getProCodigoBarra() {
        return this.proCodigoBarra;
    }
    
    public void setProCodigoBarra(String proCodigoBarra) {
        this.proCodigoBarra = proCodigoBarra;
    }
    public Grupo getGrupo() {
        return this.grupo;
    }
    
    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }
    public Marca getMarca() {
        return this.marca;
    }
    
    public void setMarca(Marca marca) {
        this.marca = marca;
    }
    public Tipodescarga getTipodescarga() {
        return this.tipodescarga;
    }
    
    public void setTipodescarga(Tipodescarga tipodescarga) {
        this.tipodescarga = tipodescarga;
    }
    public String getProNombre() {
        return this.proNombre;
    }
    
    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }
    public Integer getProValorCompra() {
        return this.proValorCompra;
    }
    
    public void setProValorCompra(Integer proValorCompra) {
        this.proValorCompra = proValorCompra;
    }
    public Integer getProStockMaximo() {
        return this.proStockMaximo;
    }
    
    public void setProStockMaximo(Integer proStockMaximo) {
        this.proStockMaximo = proStockMaximo;
    }
    public Integer getProStockMinimo() {
        return this.proStockMinimo;
    }
    
    public void setProStockMinimo(Integer proStockMinimo) {
        this.proStockMinimo = proStockMinimo;
    }
    public Integer getProStockBodega() {
        return this.proStockBodega;
    }
    
    public void setProStockBodega(Integer proStockBodega) {
        this.proStockBodega = proStockBodega;
    }
    public String getProEstado() {
        return this.proEstado;
    }
    
    public void setProEstado(String proEstado) {
        this.proEstado = proEstado;
    }
    public Date getProFechaIngreso() {
        return this.proFechaIngreso;
    }
    
    public void setProFechaIngreso(Date proFechaIngreso) {
        this.proFechaIngreso = proFechaIngreso;
    }
    public String getProUbicacion() {
        return this.proUbicacion;
    }
    
    public void setProUbicacion(String proUbicacion) {
        this.proUbicacion = proUbicacion;
    }
    public String getProImagen() {
        return this.proImagen;
    }
    
    public void setProImagen(String proImagen) {
        this.proImagen = proImagen;
    }
    public Date getProFechaVencimiento() {
        return this.proFechaVencimiento;
    }
    
    public void setProFechaVencimiento(Date proFechaVencimiento) {
        this.proFechaVencimiento = proFechaVencimiento;
    }
    public String getProReferencia() {
        return this.proReferencia;
    }
    
    public void setProReferencia(String proReferencia) {
        this.proReferencia = proReferencia;
    }
    public String getProLote() {
        return this.proLote;
    }
    
    public void setProLote(String proLote) {
        this.proLote = proLote;
    }
    public Integer getProIdUsuario() {
        return this.proIdUsuario;
    }
    
    public void setProIdUsuario(Integer proIdUsuario) {
        this.proIdUsuario = proIdUsuario;
    }
    public Set getMovimientoses() {
        return this.movimientoses;
    }
    
    public void setMovimientoses(Set movimientoses) {
        this.movimientoses = movimientoses;
    }
    public Set getVencimientos() {
        return this.vencimientos;
    }
    
    public void setVencimientos(Set vencimientos) {
        this.vencimientos = vencimientos;
    }




}


