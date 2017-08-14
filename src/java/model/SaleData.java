package model;

/**
 *
 * @author Nikola Dragić
 */
public class SaleData {
    private String customer;
    private String product;
    private String date;
    
    //Public getter methods
    public String getCustomer(){
        return customer;
    }
    
    public String getProduct(){
        return product;
    }
    
    public String getDate(){
        return date;
    }
    
    //Public setter methods
    
    public void setCustomer(String customer){
        this.customer = customer;
    }
    
    public void setProduct(String product){
        this.product = product;
    }
    
    public void setDate(String date){
        this.date = date;
    }
    
}
