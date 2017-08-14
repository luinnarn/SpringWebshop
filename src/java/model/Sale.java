package model;

/**
 *
 * @author Nikola Dragić
 */
public class Sale {

    private int id;
    private int customerId;
    private int productId;
    private String date;

    //Public getter methods
    public int getId() {
        return id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public int getProductId() {
        return productId;
    }

    public String getDate() {
        return date;
    }

    //Pubic setter methods
    public void setId(int id) {
        this.id = id;
    }

    public void setCustomerId(int customerid) {
        this.customerId = customerid;
    }

    public void setProduct(int productId) {
        this.productId = productId;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
