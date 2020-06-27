 
package com.mycompany.bakerysystem.dao;

import com.mycompany.bakerysystem.entities.User;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
      
    public User getUserByEmailAndPsssword(String email,String password) {
        User user=null;
        
        try {
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            
            Query q;
            q = session.createQuery(query);    
            q.setParameter("e", email);
            q.setParameter("p", password);
            user=(User)q.uniqueResult();
            session.close();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
    
}
