package Models;

import net.jextra.fauxjo.Home;
import net.jextra.fauxjo.Schema;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class OrdersHome extends Home<Orders> {

    public static final String TABLE_NAME = "orders";

    public OrdersHome(Schema schema)
    {
        super(schema, Orders.class, TABLE_NAME);
    }

    // access methods here

}
