package org.example.controller;


import org.example.entity.Author;
import org.example.services.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/authors")
public class AuthorsController {
    private AuthorService authorService;

    @Autowired
    public void setAuthorService(AuthorService authorService) { this.authorService = authorService; }

    //Lista wszyskich autorów
    @GetMapping("/list")
    public String list(Model model) {
        List<Author> authors = authorService.getAuthors();
        model.addAttribute("authors", authors);
        return "authors/list";
    }

    //Dodawanie autora
    @GetMapping("/add")
    public String add(Model model){
        Author author = new Author();
        model.addAttribute("author", author);
        return "authors/add";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("author") Author author){
        authorService.saveAuthor(author);
        return "redirect:/authors/list";
    }

    //Usuwanie autora
    @GetMapping("/delete")
    public String delete(@RequestParam("authorId") int authorId) {
        authorService.deleteAuthor(authorId);
        return "redirect:/authors/list";
    }

    //Edycja autora
    @GetMapping("/edit")
    public String edit(@RequestParam("authorId") int authorId, Model model){
        Author author = authorService.getAuthor(authorId);
        model.addAttribute("author", author);
        return "authors/edit";
    }

    //Widok książek przypisanych do Autora
    @GetMapping("/books")
    public String details(@RequestParam("authorId") int authorId, Model model){
        Author author = authorService.getAuthor(authorId);
        model.addAttribute("author",author);
        return "authors/books";
    }
}
