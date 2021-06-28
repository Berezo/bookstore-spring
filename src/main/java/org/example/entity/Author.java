package org.example.entity;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="autorzy")
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ID")
    private int id;
    @Column(name="imie")
    private String name;
    @Column(name="nazwisko")
    private String surname;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name="autorzy_to_ksiazki",
            joinColumns = @JoinColumn(name="autor_id"),
            inverseJoinColumns = @JoinColumn(name="ksiazka_id")
    )
    private Set<Book> books;

    public Author() {}
    public Author(String id){ this.id = Integer.parseInt(id); }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSurname() { return surname; }
    public void setSurname(String surname) { this.surname = surname; }
    public Set<Book> getBooks() { return books; }
    public void setBooks(Set<Book> book) { this.books = books; }

    public void addBook(Book book) {
        if (books == null) {
            books = new HashSet<Book>();
        }
        books.add(book);
    }

    @Override
    public String toString() { return name + " " + surname; }
}
