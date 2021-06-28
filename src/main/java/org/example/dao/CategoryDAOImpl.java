package org.example.dao;

import org.example.entity.Book;
import org.example.entity.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Category> getCategories() {
        //sesja hibernate
        Session currentSession = sessionFactory.getCurrentSession();
        //zapytanie
        Query<Category> query = currentSession.createQuery(" from Category", Category.class);
        List<Category> categories = query.getResultList();
        return categories;
    }

    @Override
    public void saveCategory(Category category) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(category);
    }

    @Override
    public Category getCategory(int categoryId) {
        //sesja hibernate
        Session session = sessionFactory.getCurrentSession();
        //zapytanie
        return session.get(Category.class, categoryId);
    }

    @Override
    public void deleteCategory(int categoryId) {
        //sesja hibernate
        Session session = sessionFactory.getCurrentSession();
        //zapytanie
        session.delete(getCategory(categoryId));
    }
}
