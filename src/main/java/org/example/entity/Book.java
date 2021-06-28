package org.example.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="ksiazki")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ID")
    private int id;
    @Column(name="nazwa")
    private String name;
    @Column(name="wydawnictwo")
    private String publisher;
    @Column(name="cena")
    private float price;
    @ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name="kategorie_id")
    private Category category;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name="autorzy_to_ksiazki",//nazwa tabeli
            joinColumns = @JoinColumn(name="ksiazka_id"), //co laczymy
            inverseJoinColumns = @JoinColumn(name="autor_id") //z czym laczymy

    )
    private Set<Author> authors;
    @Column(name="ilosc")
    private int quantity;
    @Column(name="okladka")
    private String cover;
    @Column(name="opis")
    private String description;

    public Book(){}

    public Book(String name, String publisher, float price, Category category, int quantity, String cover, String description){
        this.name=name;
        this.publisher=publisher;
        this.price=price;
        this.category=category;
        this.quantity = quantity;
        this.cover = cover;
        this.description = description;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }
    public float getPrice() { return price; }
    public void setPrice(float price) { this.price = price; }
    public void setCategory(Category category) { this.category = category; }
    public Category getCategory() { return category; }
    public Set<Author> getAuthors() { return authors; }
    public void setAuthors(Set<Author> autors) { this.authors = autors; }
    public void addAuthor(Author autor){
        if (authors == null)
            authors = new HashSet<Author>();

        authors.add(autor);
    }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public int getQuantity() { return quantity; }
    public void setCover(String cover) { this.cover = cover; }
    public String getCover() { return cover; }
    public void setDescription(String description) { this.description = description; }
    public String getDescription() { return description; }

    @Override
    public String toString() {
        return "Ksiazka{" +
                "id=" + id + ",\n\t" +
                "name='" + name + ",\n\t" +
                "publisher='" + publisher + ",\n\t" +
                "price=" + price + ",\n";
    }
}
