package Models;

import net.jextra.fauxjo.Home;
import net.jextra.fauxjo.Schema;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class OrderBooksHome extends Home<OrderBooks> {

    public static final String TABLE_NAME = "orderbooks";

    public OrderBooksHome(Schema schema)
    {
        super(schema, OrderBooks.class, TABLE_NAME);
    }

    // access methods here

}
