package Models;

import net.jextra.fauxjo.Home;
import net.jextra.fauxjo.Schema;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class WishlistBooksHome extends Home<WishlistBooks> {

    public static final String TABLE_NAME = "wishlistbooks";

    public WishlistBooksHome(Schema schema)
    {
        super(schema, WishlistBooks.class, TABLE_NAME);
    }

    // access methods here

}
