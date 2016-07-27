package Models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by GRAY1 on 7/27/2016.
 */
public class ShoppingCart {
    List<Book> cartItems;

    public ShoppingCart(){
        cartItems = new ArrayList<>();
    }

    public List<Book> getCartItems()
    {
        return cartItems;
    }

    public void addToCart(Book book)
    {
        cartItems.add(book);
    }
}
