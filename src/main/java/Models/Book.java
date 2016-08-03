package Models;

import net.jextra.fauxjo.FauxjoField;
import net.jextra.fauxjo.FauxjoImpl;
import net.jextra.fauxjo.FauxjoPrimaryKey;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

/**
 * Created by GRAY1 on 7/14/2016.
 */
//@Entity
public class Book extends FauxjoImpl {
    //@Id @GeneratedValue

    @FauxjoPrimaryKey
    @FauxjoField("bookId")
    private UUID bookId;

    @FauxjoField("title")
    public String title;



    //@OneToMany
    @FauxjoField("author")
    public String author;
    //@OneToMany
    @FauxjoField("genre")
    public String genre;

    @FauxjoField("publisher")
    public String publisher;

    @FauxjoField("datePublished")
    public Date datePublished;

    @FauxjoField("price")
    public float price;

    @FauxjoField("ISBN")
    public String ISBN;

    @FauxjoField("edition")
    public String edition;

    @FauxjoField("format")
    public String format;

    @FauxjoField("numberOfPages")
    public int numberOfPages;

    @FauxjoField("description")
    public String description;

    @FauxjoField("imageURL")
    public String imageURL;

    public Book()
    {
        bookId = UUID.randomUUID();
    }


    public UUID getBookId() {
        return bookId;
    }

    public void setBookId(UUID bookId) {
        this.bookId = bookId;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }




    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getDatePublished() {
        return datePublished;
    }

    public void setDatePublished(Date datePublished) {
        this.datePublished = datePublished;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public int getNumberOfPages() {
        return numberOfPages;
    }

    public void setNumberOfPages(int numberOfPages) {
        this.numberOfPages = numberOfPages;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getTitle()
    {
        return title;
    }

    public Book(String title)
    {
        this.title = title;
    }

    @Override
    public String toString()
    {
        return title;
    }

}
