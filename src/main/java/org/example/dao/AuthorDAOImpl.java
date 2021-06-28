package org.example.dao;

import org.example.entity.Author;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuthorDAOImpl implements AuthorDAO{

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Author> getAuthors() {
        //sesja hibernate
        Session currentSession = sessionFactory.getCurrentSession();
        //zapytanie
        Query<Author> query = currentSession.createQuery(" from Author", Author.class);
        List<Author> authors = query.getResultList();
        return authors;
    }

    @Override
    public void saveAuthor(Author author) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(author);
    }

    @Override
    public Author getAuthor(int authorId) {
        //sesja hibernate
        Session session = sessionFactory.getCurrentSession();
        //zapytanie
        return session.get(Author.class, authorId);
    }

    @Override
    public void deleteAuthor(int authorId) {
        Session session = sessionFactory.getCurrentSession();
        //zapytanie
        session.delete(getAuthor(authorId));
    }
}

