package controllers;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Nikola Dragić
 */

@Controller
@RequestMapping("/")
public class SiteController {
    
    @Autowired
    DataSource dataSource;
    
    @RequestMapping(value = {"/index", "/"})
    public String homepage(HttpSession session){
        if(session.getAttribute("username") == null){
            session.setAttribute("id", 0);
            session.setAttribute("username","guest");
        }
        return "index";
    }
    
    @RequestMapping(value = "/products")
    public String products(ModelMap model) throws SQLException{
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products");
        List<Product> products = new ArrayList<>();
        
        while (rs.next()){
            Product p = new Product();
            p.setId(rs.getInt("product_id"));
            p.setName(rs.getString("product_name"));
            p.setPrice(rs.getDouble("product_price"));
            p.setDescription(rs.getString("product_description"));
            p.setImage(rs.getString("product_image"));
            p.setQuantity(rs.getInt("product_quantity"));
            products.add(p);
        }
        model.addAttribute("products", products);
        return "products";
    }
    
    @RequestMapping("/product/{id}")
    public String product(@PathVariable Integer id, ModelMap model) throws SQLException{
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products WHERE product_id='"+id+"'");
        rs.next();
        Product p = new Product();
         p.setId(rs.getInt("product_id"));
            p.setName(rs.getString("product_name"));
            p.setPrice(rs.getDouble("product_price"));
            p.setDescription(rs.getString("product_description"));
            p.setImage(rs.getString("product_image"));
            p.setQuantity(rs.getInt("product_quantity"));
            model.addAttribute("product", p);
        return "product";
    }
    
    @RequestMapping("/newproduct")
    public String newproduct(@Valid Product product, BindingResult result,ModelMap model){
        model.addAttribute("product", new Product());
        return "newproduct";
    }
    
    @RequestMapping("/addnewproduct")
    public String addnewproduct(@ModelAttribute("product") @Valid Product product, BindingResult result, ModelMap model) throws SQLException{
        
        if (result.hasErrors()){
            return "newproduct";
        }
        dataSource.getConnection().createStatement().execute("INSERT INTO products VALUES (null,'"
                +product.getName()+"','"+product.getPrice()+"','"+product.getDescription()+"','"+product.getImage()+"','"+product.getQuantity()+"')");
        
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products");
        List<Product> products = new ArrayList<>();
        
        while (rs.next()){
            Product p = new Product();
            p.setId(rs.getInt("product_id"));
            p.setName(rs.getString("product_name"));
            p.setPrice(rs.getDouble("product_price"));
            p.setDescription(rs.getString("product_description"));
            p.setImage(rs.getString("product_image"));
            p.setQuantity(rs.getInt("product_quantity"));
            products.add(p);
        }
        model.addAttribute("products", products);
        return "products";
    }
    
    @RequestMapping("/editproduct/{id}")
    public String editproduct(@PathVariable Integer id, ModelMap model) throws SQLException{
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products WHERE product_id='"+id+"'");
        rs.next();
        Product p = new Product();
         p.setId(rs.getInt("product_id"));
            p.setName(rs.getString("product_name"));
            p.setPrice(rs.getDouble("product_price"));
            p.setDescription(rs.getString("product_description"));
            p.setImage(rs.getString("product_image"));
            p.setQuantity(rs.getInt("product_quantity"));
            
            model.addAttribute("product", p);
        
        return "editproduct";
    }
    @RequestMapping("/editproductapply")
    public String editproduct(@ModelAttribute Product product, ModelMap model) throws SQLException{
        String desc = product.getDescription();
        desc = desc.replace("'", "\\'");
        String query = "UPDATE products SET  product_name ='"
                +product.getName()+"', product_price = '"+product.getPrice()+"', product_description = '"+desc+"', product_image ='"+product.getImage()+"', product_quantity = '"+product.getQuantity()+"' WHERE product_id ='"+product.getId()+"'";
        System.out.println(query);
        dataSource.getConnection().createStatement().execute(query);
       
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products");
        List<Product> products = new ArrayList<>();
        
        while (rs.next()){
            Product p = new Product();
            p.setId(rs.getInt("product_id"));
            p.setName(rs.getString("product_name"));
            p.setDescription(rs.getString("product_description"));
            p.setPrice(rs.getDouble("product_price"));
            p.setImage(rs.getString("product_image"));
            p.setQuantity(rs.getInt("product_quantity"));
            products.add(p);
        }
        model.addAttribute("products", products);
        return "products";
    }
    
    @RequestMapping("/removeproduct/{id}")
    public String removeproduct(@PathVariable Integer id, ModelMap model) throws SQLException{
        
        dataSource.getConnection().createStatement().executeUpdate("DELETE FROM products WHERE product_id='"+id+"'");
        
         ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products");
        List<Product> products = new ArrayList<>();
        
        while (rs.next()){
            Product p = new Product();
            p.setId(rs.getInt("product_id"));
            p.setName(rs.getString("product_name"));
            p.setPrice(rs.getDouble("product_price"));
            p.setDescription(rs.getString("product_description"));
            p.setImage(rs.getString("product_image"));
            p.setQuantity(rs.getInt("product_quantity"));
            products.add(p);
        }
        model.addAttribute("products", products);
        return "products";
        
    }
    
    @RequestMapping("/customers")
    public String customers(ModelMap model) throws SQLException{
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers");
        
        List<Customer> customers = new ArrayList<>();
        
        while(rs.next()){
            Customer b = new Customer();
            b.setId(rs.getInt("customer_id"));
            b.setUsername(rs.getString("customer_username"));
            b.setPassword(rs.getString("customer_password"));
            b.setFirstname(rs.getString("customer_firstname"));
            b.setLastname(rs.getString("customer_lastname"));
            b.setAddress(rs.getString("customer_address"));
            customers.add(b);
        }
        model.addAttribute("customers", customers);
        
        return "customers";
    }
    
    @RequestMapping(value = "/newcustomer", method = RequestMethod.GET)
    public String newcustomer(@Valid Customer customer, BindingResult result,ModelMap model){
        model.addAttribute("customer", new Customer());
        return "newcustomer";
    }
    
    @RequestMapping("/addnewcustomer")
    public String addnewcustomer(@ModelAttribute("customer") @Valid Customer customer, BindingResult result, ModelMap model) throws SQLException{
        
        if (result.hasErrors()) {
            return "newcustomer";
        }
        
        dataSource.getConnection().createStatement().executeUpdate("INSERT INTO customers VALUES (null, '"+customer.getUsername()+"',"
                + "'"+customer.getPassword()+"','"+customer.getFirstname()+"','"+customer.getLastname()+"','"+customer.getAddress()+"')");
        
        
         ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers");
        
        List<Customer> customers = new ArrayList<>();
        
        while(rs.next()){
            Customer b = new Customer();
            b.setId(rs.getInt("customer_id"));
            b.setUsername(rs.getString("customer_username"));
            b.setPassword(rs.getString("customer_password"));
            b.setFirstname(rs.getString("customer_firstname"));
            b.setLastname(rs.getString("customer_lastname"));
            b.setAddress(rs.getString("customer_address"));
            customers.add(b);
        }
        model.addAttribute("customers", customers);
        return "customers";
    }
    
    @RequestMapping("/editcustomer/{id}")
    public String editcustomer(@PathVariable Integer id, ModelMap model) throws SQLException{
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers WHERE customer_id='"+id+"'");
        if(rs.next()){
            Customer customer = new Customer();
            customer.setId(id);
            customer.setUsername(rs.getString("customer_username"));
            customer.setPassword(rs.getString("customer_password"));
            customer.setFirstname(rs.getString("customer_firstname"));
            customer.setLastname(rs.getString("customer_lastname"));
            customer.setAddress(rs.getString("customer_address"));
            model.addAttribute("customer", customer);
            System.out.println(customer.getId());
        }
        return "editcustomer";
    }
    
    @RequestMapping("/editcustomerapply")
    public String editcustomerapply(@ModelAttribute Customer customer, ModelMap model) throws SQLException{
        
        System.out.println(customer.getFirstname()+" , "+customer.getId());
        dataSource.getConnection().createStatement().execute("UPDATE customers SET customer_username='"+customer.getUsername()+"', customer_password ='"+customer.getPassword()+"'"
                + ", customer_firstname = '"+customer.getFirstname()+"', customer_lastname='"+customer.getLastname()+"', customer_address ='"+customer.getAddress()+"' WHERE customer_id='"+customer.getId()+"'");
       
         ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers");
        
        List<Customer> customers = new ArrayList<>();
        
        while(rs.next()){
            Customer b = new Customer();
            b.setId(rs.getInt("customer_id"));
            b.setUsername(rs.getString("customer_username"));
            b.setPassword(rs.getString("customer_password"));
            b.setFirstname(rs.getString("customer_firstname"));
            b.setLastname(rs.getString("customer_lastname"));
            b.setAddress(rs.getString("customer_address"));
            customers.add(b);
        }
        model.addAttribute("customers", customers);
        return "customers";
    }
    
    @RequestMapping("/removecustomer/{id}")
    public String removecustomer(@PathVariable Integer id, ModelMap model) throws SQLException{
        
        dataSource.getConnection().createStatement().executeUpdate("DELETE FROM customers WHERE customer_id='"+id+"'");
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers");
        
        List<Customer> customers = new ArrayList<>();
        
        while(rs.next()){
            Customer b = new Customer();
            b.setId(rs.getInt("customer_id"));
            b.setUsername(rs.getString("customer_username"));
            b.setPassword(rs.getString("customer_password"));
            b.setFirstname(rs.getString("customer_firstname"));
            b.setLastname(rs.getString("customer_lastname"));
            b.setAddress(rs.getString("customer_address"));
            customers.add(b);
        }
        model.addAttribute("customers", customers);
        return "customers";
    }
    
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    
    @RequestMapping("/logincheck")
    public String logincheck(@RequestParam String username, @RequestParam String password, HttpSession session) throws SQLException{
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers WHERE customer_username ='"+username+"' AND customer_password ='"+password+"'");
        if (rs.next()){
            session.setAttribute("id", rs.getInt("customer_id"));
            session.setAttribute("username", rs.getString("customer_username"));
        }
        return "index";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();

        return "index";
    }
    
    public String getCustomerName(int id) throws SQLException{
         ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers WHERE customer_id = '"+id+"'");
         String username ="";
         if(rs.next()){
             username = rs.getString("customer_username");
         }
         System.out.println(username);
         return username;
    }
    
    int getCustomerId(String username) throws SQLException{
        ResultSet rs =dataSource.getConnection().createStatement().executeQuery("SELECT * FROM customers WHERE customer_username = '"+username+"'");
        int id = 0;
        if(rs.next()){
            id = rs.getInt("customer_id");
        }
        return id;
    }
    
    public String getProductName(int id) throws SQLException{
         ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products WHERE product_id = '"+id+"'");
         String name ="";
         if(rs.next()){
             name = rs.getString("product_name");
         }
         return name;
    }
    
    public int getProductQuantity(int id) throws SQLException{
          ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM products WHERE product_id = '"+id+"'");
          int quantity = 1;
          if(rs.next()){
              quantity = rs.getInt("product_quantity");
          }
          return quantity;
    }
    
    @RequestMapping("/sales")
    public String sales(ModelMap model) throws SQLException{
        
        ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM sales");
        List<SaleData> salesData = new ArrayList<>();
        while(rs.next()){
            SaleData sd = new SaleData();
            sd.setCustomer(getCustomerName(rs.getInt("sale_customer_id")));
            sd.setProduct(getProductName(rs.getInt("sale_product_id")));
            sd.setDate(rs.getString("sale_date"));
            salesData.add(sd);
        }
        model.addAttribute("salesData", salesData);
        
        return "sales";
    }
    
    @RequestMapping("/buyproduct/{productid}")
    public String buyproduct(@PathVariable Integer productid, ModelMap model, HttpSession session) throws SQLException{
        
        String customerUsername = (String)session.getAttribute("username");
        int customerId = getCustomerId(customerUsername);
        
        dataSource.getConnection().createStatement().execute("INSERT INTO sales VALUES (null, '"+customerId+"','"+productid+"',NOW())");
            int newQuantity = getProductQuantity(productid) - 1;
            dataSource.getConnection().createStatement().execute("UPDATE products SET product_quantity = '"+newQuantity+"' WHERE product_id = '"+productid+"'");
            
        
            ResultSet rs = dataSource.getConnection().createStatement().executeQuery("SELECT * FROM sales");
        List<SaleData> salesData = new ArrayList<>();
        while(rs.next()){
           SaleData sd = new SaleData();
            sd.setCustomer(getCustomerName(rs.getInt("sale_customer_id")));
            sd.setProduct(getProductName(rs.getInt("sale_product_id")));
            sd.setDate(rs.getString("sale_date"));
            salesData.add(sd);
        }
        model.addAttribute("salesData", salesData);
        return "sales";
    }
    
}
