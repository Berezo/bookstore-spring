package org.example.dao;

import org.example.entity.Book;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO{

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    //pobranie i zwrocenie wszystkich ksiazek z bazy za pomoca zapytania SQL
    @Override
    public List<Book> getBooks() {
        //sesja hibernate
        Session currentSession = sessionFactory.getCurrentSession();
        //zapytanie
        Query<Book> query = currentSession.createQuery(" from Book", Book.class);
        List<Book> books = query.getResultList();
        return books;
    }

    //zapis ksiazki do bazy za pomoca zapytania SQL
    @Override
    public void saveBook(Book book) {
        //sesja hibernate
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(book);
    }

    //pobranie i zwrocenie ksiazki po id z bazy za pomoca zapytania SQL
    @Override
    public Book getBook(int bookId) {
        //sesja hibernate
        Session session = sessionFactory.getCurrentSession();
        //zapytanie
        return session.get(Book.class, bookId);

    }

    //usuniecie ksiaki po id z bazy za pomoca zapytania SQL
    @Override
    public void deleteBook(int bookId) {
        //sesja hibernate
        Session session = sessionFactory.getCurrentSession();
        session.delete(getBook(bookId));
    }
}
