package org.example.controller;

import org.example.entity.Book;
import org.example.entity.Category;
import org.example.model.CartInfo;
import org.example.model.ProductInfo;
import org.example.services.AuthorService;
import org.example.services.BookService;
import org.example.services.CategoryService;
import org.example.services.UserService;
import org.example.utils.FileUploadUtil;
import org.example.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BooksController {
    private BookService bookService;
    private CategoryService categoryService;
    private AuthorService authorService;
    private UserService userService;
    private String bookCover = null;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setAuthorService(AuthorService authorService) {
        this.authorService = authorService;
    }

    @Autowired
    public void setUserService(UserService userService) { this.userService = userService; }

    @GetMapping("/list")
    public String list(Model model) {
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "books/list";
    }

    //  Wersja z kategoriami i autorami
    @GetMapping("/add")
    public String add(Model model){
        Book book = new Book();
        model.addAttribute("book", book);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("authors", authorService.getAuthors());
        return "books/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("book") Book book, @ModelAttribute("category") Category category, @RequestParam("image") MultipartFile multipartFile) throws IOException {
        book.setCover(bookCover);

        if (!multipartFile.isEmpty()){
            String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
            book.setCover(fileName);

            String uploadDir = "src/main/webapp/resources/covers/";

            FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
        }

        if (category.getId() == 3 || category.getId() == 7){
            book.setQuantity(-1);
        }

        book.setPrice(BigDecimal.valueOf(book.getPrice()).setScale(2, RoundingMode.HALF_UP).floatValue());

        bookService.saveBook(book);
        return "redirect:/books/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("bookId") int bookId) {
        bookService.deleteBook(bookId);
        return "redirect:/books/list";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("bookId") int bookId, Model model){
        Book book = bookService.getBook(bookId);
        model.addAttribute("book", book);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("authors", authorService.getAuthors());
        bookCover = book.getCover();
        return "books/edit";
    }

    @GetMapping("/details")
    public String details(@RequestParam("bookId") int bookId, Model model){
        Book book = bookService.getBook(bookId);
        model.addAttribute("book",book);
        return "books/details";
    }

    @RequestMapping("/buy")
    public String listProductHandler(@RequestParam(value = "bookId", defaultValue = "") int bookId,
                                     HttpServletRequest request,
                                     Model model) {

        Book book = bookService.getBook(bookId);
        if (book != null) {
            String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();

            CartInfo cartInfo = Utils.getCartInSession(request, userService.getUser(currentUserName));

            ProductInfo productInfo = new ProductInfo(book.getId(), book.getName(), book.getPublisher(), book.getPrice(), book.getCategory(), book.getQuantity());

            if (book.getQuantity() > 0){
                book.setQuantity(book.getQuantity() - 1);
                cartInfo.addProduct(productInfo, 1);
            } else if (book.getQuantity() == -1){
                if (cartInfo.findLineById(bookId) == null){
                    cartInfo.addProduct(productInfo, 1);
                }
            }
        }
        return "redirect:/cart";
    }

    @RequestMapping("/remove")
    public String removeProductHandler(@RequestParam(value = "bookId", defaultValue = "") int bookId,
                                       HttpServletRequest request,
                                       Model model) {
        Book book = bookService.getBook(bookId);
        if (book != null) {
            String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();

            CartInfo cartInfo = Utils.getCartInSession(request, userService.getUser(currentUserName));

            ProductInfo productInfo = new ProductInfo(book.getId(), book.getName(), book.getPublisher(), book.getPrice(), book.getCategory(), book.getQuantity());
            if (book.getQuantity() != -1){
                book.setQuantity(book.getQuantity() + cartInfo.findLineById(bookId).getQuantity());
            }

            cartInfo.removeProduct(productInfo);
        }

        return "redirect:/cart";
    }

}