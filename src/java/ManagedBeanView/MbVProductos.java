/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ManagedBeanView;

import Clases.Imagen;
import Dao.DaoProducto;
import HibernateUtil.HibernateUtil;
import Pojo.Grupo;
import Pojo.Marca;
import Pojo.Producto;
import Pojo.Tipodescarga;
import Pojo.Vencimiento;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.primefaces.context.RequestContext;
import org.primefaces.model.UploadedFile;

/**
 *
 * @author J-MeN
 */
@ManagedBean
@ViewScoped
public class MbVProductos {

    private Producto producto;
    private String codMarca;
    private String codGrupo;
    private String codTipoDescarga;
    private List<Marca> listaMarca;
    private List<Grupo> listaGrupo;
    private List<Tipodescarga> listaTipodescarga;
    private UploadedFile file;
    private List<Vencimiento> listaVencimiento;
    private Vencimiento vencimiento;
    String ruta;
    String rutaini;
    Session session;
    Transaction transaction;

    public MbVProductos() {
        try {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            String relativeWebPath = "/resources/imgproductos/";
            ServletContext servletContext = (ServletContext) facesContext.getExternalContext().getContext();
            ruta = servletContext.getRealPath(relativeWebPath);
            rutaini = ruta;
            DaoProducto daoProducto = new DaoProducto();
            session = HibernateUtil.getSessionFactory().openSession();
            producto = new Producto();
            listaGrupo = daoProducto.getGrupos(session);
            listaMarca = daoProducto.getMarcas(session);
            listaTipodescarga = daoProducto.getTipodescargas(session);
            vencimiento = new Vencimiento();
            listaVencimiento = new ArrayList<>();
        } catch (Exception ex) {
            if (this.transaction != null) {
                this.transaction.rollback();
            }

            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error:", "Por favor contacte con su administrador " + ex.getMessage()));
        } finally {
            if (session.isOpen()) {
                session.close();
            }

        }
    }

    public String reinit() {
        vencimiento = new Vencimiento();
        return null;
    }

    public void register() {
        session = null;
        transaction = null;
        try {
            if(this.listaVencimiento.isEmpty()){
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error:", "Debe ingresar al menos un lote"));
                return;
            }
            DaoProducto daoProducto = new DaoProducto();
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            if (daoProducto.getByCodigoBarra(session, producto.getProCodigoBarra()) != null) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error:", "El Código de barras ya se encuentra registrado por en el sistema"));
                return;
            }
            Marca marca;
            Grupo grupo;
            Tipodescarga tipodescarga;
            marca = daoProducto.getByCodigoMarca(session, Integer.parseInt(codMarca));
            grupo = daoProducto.getByCodigoGrupo(session, Integer.parseInt(codGrupo));
            tipodescarga = daoProducto.getByCodigoDescarga(session, Integer.parseInt(codTipoDescarga));

            if (this.file.getSize() > 0 && (!(this.file.getFileName().toLowerCase().endsWith(".png") || this.file.getFileName().toLowerCase().endsWith(".gif") || this.file.getFileName().toLowerCase().endsWith(".jpg") || this.file.getFileName().toLowerCase().endsWith(".jpeg")))) {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error:", "Tipo de imagen no admitida"));
                return;
            }

            if (this.file.getSize() > 0) {
                Imagen.copyFile(producto.getProCodigoBarra() + "." + file.getContentType().split("/")[1], file.getInputstream(), "imgproductos");
            }

            producto.setGrupo(grupo);
            producto.setMarca(marca);
            producto.setTipodescarga(tipodescarga);
            producto.setProImagen(producto.getProCodigoBarra() + "." + file.getContentType().split("/")[1]);
            daoProducto.register(session, producto);
            for (Vencimiento venc : listaVencimiento) {
                venc.setProducto(producto);
                daoProducto.regVencimiento(session, venc);
            }
            transaction.commit();
            producto = new Producto();
            codGrupo = null;
            codMarca = null;
            codTipoDescarga = null;
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Correcto:", "El registro fue realizado correctamente.");
            RequestContext.getCurrentInstance().showMessageInDialog(message);
        } catch (Exception ex) {
            if (this.transaction != null) {
                this.transaction.rollback();
            }

            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error:", "Por favor contacte con su administrador " + ex.getMessage()));
        } finally {
            if (session.isOpen()) {
                session.close();
            }
            ruta = rutaini;
        }
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public String getCodMarca() {
        return codMarca;
    }

    public void setCodMarca(String codMarca) {
        this.codMarca = codMarca;
    }

    public String getCodGrupo() {
        return codGrupo;
    }

    public void setCodGrupo(String codGrupo) {
        this.codGrupo = codGrupo;
    }

    public String getCodTipoDescarga() {
        return codTipoDescarga;
    }

    public void setCodTipoDescarga(String codTipoDescarga) {
        this.codTipoDescarga = codTipoDescarga;
    }

    public List<Marca> getListaMarca() {
        return listaMarca;
    }

    public void setListaMarca(List<Marca> listaMarca) {
        this.listaMarca = listaMarca;
    }

    public List<Grupo> getListaGrupo() {
        return listaGrupo;
    }

    public void setListaGrupo(List<Grupo> listaGrupo) {
        this.listaGrupo = listaGrupo;
    }

    public List<Tipodescarga> getListaTipodescarga() {
        return listaTipodescarga;
    }

    public void setListaTipodescarga(List<Tipodescarga> listaTipodescarga) {
        this.listaTipodescarga = listaTipodescarga;
    }

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }

    public List<Vencimiento> getListaVencimiento() {
        return listaVencimiento;
    }

    public void setListaVencimiento(List<Vencimiento> listaVencimiento) {
        this.listaVencimiento = listaVencimiento;
    }

    public Vencimiento getVencimiento() {
        return vencimiento;
    }

    public void setVencimiento(Vencimiento vencimiento) {
        this.vencimiento = vencimiento;
    }

}
