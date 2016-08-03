package Models;

import com.amirsys.dbgoodies.fauxjo.SchemaSupplier;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class BookSchema {

    // ============================================================
    // Fields
    // ============================================================

    public static SchemaSupplier<BookSchemaInstance> ss;

    // ============================================================
    // Constructors
    // ============================================================

    static {
        ss = new SchemaSupplier<>(BookSchemaInstance.class);
    }

    // ============================================================
    // Methods
    // ============================================================

    // ----------
    // public
    // ----------

    public static BookSchemaInstance use(String instanceName) { return ss.use(instanceName); }

    public static BookSchemaInstance use() { return ss.use(); }

    public static void setInstance(BookSchemaInstance schema) { ss.setInstance(schema); }

    public static void setInstance(String instanceName, BookSchemaInstance schema)
    {
        ss.setInstance(instanceName, schema);
    }



}
