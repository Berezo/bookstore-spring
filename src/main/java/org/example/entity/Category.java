package org.example.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="kategorie")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ID")
    private int id;
    @Column(name="nazwa")
    private String name;
    @OneToMany(mappedBy = "category", cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH}, fetch = FetchType.EAGER, orphanRemoval = true)
    List<Book> books;

    public Category(){}
    public Category(String id){ this.id = Integer.parseInt(id);}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public List<Book> getBooks() { return books; }
    public void setBooks(List<Book> ksiazki) { this.books = ksiazki; }

    @Override
    public String toString() {
        return "Kategoria{" +
                "id=" + id + ",\n\t" +
                "name='" + name + '\n' +
                '}';
    }
}
