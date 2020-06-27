 
package com.mycompany.bakerysystem.dao;

import com.mycompany.bakerysystem.entities.Category;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.*;
import org.hibernate.query.Query;
 
public class categoryDao {
    private SessionFactory factory;

    public categoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //save category to db
    public int saveCategory(Category category) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        int categoryId=(int) session.save(category);
        tx.commit();
        
        session.close();
        return categoryId;
    }
    
    public List<Category> getCategory() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
    
    public Category getCategoryById(int CategoryId) {
        Category cat=null;
        try {
            Session session=this.factory.openSession();
            cat=session.get(Category.class, CategoryId);
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }   
}
