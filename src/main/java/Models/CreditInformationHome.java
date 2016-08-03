package Models;

import net.jextra.fauxjo.Home;
import net.jextra.fauxjo.Schema;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class CreditInformationHome extends Home<CreditInformation> {

    public static final String TABLE_NAME = "books";

    public CreditInformationHome(Schema schema)
    {
        super(schema, CreditInformation.class, TABLE_NAME);
    }

    // access methods here

}
