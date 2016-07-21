package Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by GRAY1 on 7/14/2016.
 */
//@Entity
public class Book implements Serializable{
    //@Id @GeneratedValue
    public int ID;
    public String title;
    //@OneToMany
    public ArrayList<String> authors;
    //@OneToMany
    public List<Genre> genres;
    public String publisher;
    public Date datePublished;
    public float price;
    public String ISBN;
    public String edition;
    public List<BookFormat> formats;
    public int numberOfPages;
    public String description;

    public Book()
    {

    }

    public String getTitle()
    {
        return title;
    }

    public List<String> getAuthors()
    {
        return authors;
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
