package Models;

import java.util.Date;
import java.util.List;

/**
 * Created by GRAY1 on 7/14/2016.
 */
public class Book {
    public int ID;
    public String title;
    public List<String> authors;
    public List<Genre> genres;
    public String publisher;
    public Date datePublished;
    public float price;
    public String ISBN;
    public String edition;
    public List<BookFormat> formats;
    public int numberOfPages;
    public String description;

}
