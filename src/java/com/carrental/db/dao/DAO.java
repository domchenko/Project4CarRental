/*
 * DAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import java.sql.Connection;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides the connection 
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public abstract class DAO implements AutoCloseable {
    private Connection connection;
    
    private static final Logger LOGGER = LogManager.getLogger( DAO.class.getName() );

    /**
     * Default constructor
     */
    public DAO() { 
        
    }
    
    /**
     * Returns the connection to database
     * 
     * @return 
     */
    public Connection getConnection() {
        return JDBCConnection.getInstance().getConnection();
    }
    
    /**
     * Closes the current connection
     * 
     * @throws Exception if this connection cannot be closed
     */
    @Override
    public void close() throws Exception {
        connection.close();
    }
}

