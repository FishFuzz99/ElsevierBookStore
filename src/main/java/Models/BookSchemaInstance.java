package Models;

import com.amirsys.dbgoodies.fauxjo.AbstractSchema;
import net.jextra.fauxjo.connectionsupplier.ConnectionSupplier;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class BookSchemaInstance extends AbstractSchema {

    private ConnectionSupplier connectionSupplier;

    public BookSchemaInstance()
    {
        setSchemaName("book");

        addHome(BooksHome.class, new BooksHome(this));

    }

    public BooksHome getBookHome() { return getHome(BooksHome.class); }


}
