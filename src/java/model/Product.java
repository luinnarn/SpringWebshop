package model;

import javax.validation.constraints.*;
import org.hibernate.validator.constraints.*;
/**
 *
 * @author Nikola Dragić
 */
public class Product {

    private int id;
    
    @NotEmpty
    private String name;
    
    @NotNull
    private double price;
    
    @NotEmpty
    private String description;
    
    private String image;
    
    @NotNull
    private int quantity;

    //Public getter methods
    public int getId() {
        return id;
    }

    public double getPrice() {
        return price;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getImage() {
        return image;
    }

    public int getQuantity() {
        return quantity;
    }

    //Public setter methods
    public void setId(int id) {
        this.id = id;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
