package Models;

import net.jextra.fauxjo.Home;
import net.jextra.fauxjo.Schema;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class UsersHome extends Home<User> {

    public static final String TABLE_NAME = "users";

    public UsersHome(Schema schema)
    {
        super(schema, User.class, TABLE_NAME);
    }

    // access methods here

}
