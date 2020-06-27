 
package com.mycompany.bakerysystem.entities;
 
import java.util.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String CategoryTitle;
    private String CategoryDescription;
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();
    
    public Category() {
    }

    public Category(int categoryId, String CategoryTitle, String CategoryDescription) {
        this.categoryId = categoryId;
        this.CategoryTitle = CategoryTitle;
        this.CategoryDescription = CategoryDescription;
    }

    public Category(String CategoryTitle, String CategoryDescription, List<Product> products) {
        this.CategoryTitle = CategoryTitle;
        this.CategoryDescription = CategoryDescription;
        this.products=products;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitle() {
        return CategoryTitle;
    }

    public void setCategoryTitle(String CategoryTitle) {
        this.CategoryTitle = CategoryTitle;
    }

    public String getCategoryDescription() {
        return CategoryDescription;
    }

    public void setCategoryDescription(String CategoryDescription) {
        this.CategoryDescription = CategoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    
    
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", CategoryTitle=" + CategoryTitle + ", CategoryDescription=" + CategoryDescription + '}';
    }
    
    

}
