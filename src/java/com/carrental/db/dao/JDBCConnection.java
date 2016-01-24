/*
 * JDBCConnection
 *
 * Version 1
 */
package com.carrental.db.dao;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides the connection for DAO
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public final class JDBCConnection {
    private static final Logger LOGGER = LogManager.getLogger( JDBCConnection.class.getName() );
    
    private static JDBCConnection instance;

    /**
     * @return the instance
     */
    public static JDBCConnection getInstance() {
        if ( instance == null ) {
            instance = new JDBCConnection();
        }  
        return instance;
    }    

    /**     
     * Provides connection pooling
     * 
     * @return the connection
     */
    public Connection getConnection() {
        try {           
            InitialContext context = new InitialContext();
            String datasource = "jdbc/carrental";
            DataSource ds = (DataSource) context.lookup( datasource );
            return ds.getConnection();
        } catch (NamingException | SQLException ex) {
            LOGGER.error( ex );
        }
        return null;
    }
}
