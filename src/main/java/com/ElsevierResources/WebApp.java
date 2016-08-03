package com.ElsevierResources;

import Models.BookSchema;
import com.amirsys.ws.AbstractWebApp;
import javax.servlet.*;
import com.amirsys.projectdb.*;
import com.amirsys.rbacdb.*;
import com.amirsys.sessiondb.*;
import com.amirsys.structuredb.*;
import com.amirsys.wfdb.*;
import com.amirsys.ws.*;

import java.sql.SQLException;


/**
 * Created by GRAY1 on 8/2/2016.
 */
public class WebApp extends AbstractWebApp {

    // ============================================================
    // Fields
    // ============================================================

    private static WebApp instance;

    // ============================================================
    // Constructors
    // ============================================================

    public WebApp() throws SQLException {
        instance = this;
    }

    // ============================================================
    // Methods
    // ============================================================

    // ----------
    // public
    // ----------

    public static WebApp getInstance() { return instance; }

    @Override
    public void initialize(ServletContextEvent event) throws Exception {
        //
        // Setup Connection Suppliers
        //
        trace("Setting up ConnectionSuppliers");
        setupConnectionSupplier(DB_PRIMARY);
        setupConnectionSupplier(DB_TRANSIENT);

        //
        // Setup Schemata
        //

        trace("Setting up database schemata");


        SessionSchema.use().setConnectionSupplier(getConnectionSupplier(DB_TRANSIENT));
        BookSchema.use().setConnectionSupplier(getConnectionSupplier(DB_PRIMARY));

    }
}
