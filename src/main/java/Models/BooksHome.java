package Models;

import net.jextra.fauxjo.Home;
import net.jextra.fauxjo.Schema;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class BooksHome extends Home<Book> {

    public static final String TABLE_NAME = "books";

    public BooksHome(Schema schema)
    {
        super(schema, Book.class, TABLE_NAME);
    }

    // access methods here

}
