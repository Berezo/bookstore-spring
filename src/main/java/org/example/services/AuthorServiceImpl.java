package org.example.services;

import org.example.dao.AuthorDAO;
import org.example.dao.BookDAO;
import org.example.entity.Author;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AuthorServiceImpl implements AuthorService{
    private AuthorDAO authorDAO;

    @Autowired
    public void setAuthorDAO(AuthorDAO authorDAO) { this.authorDAO = authorDAO; }

    @Override
    @Transactional
    public List<Author> getAuthors() { return authorDAO.getAuthors(); }

    @Override
    @Transactional
    public void saveAuthor(Author author) { authorDAO.saveAuthor(author); }

    @Override
    @Transactional
    public Author getAuthor(int authorId) { return authorDAO.getAuthor(authorId); }

    @Override
    @Transactional
    public void deleteAuthor(int authorId) { authorDAO.deleteAuthor(authorId); }
}
