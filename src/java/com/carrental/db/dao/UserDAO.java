/*
 * UserDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a user model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class UserDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( UserDAO.class.getName() );
    
    /**
     * Searches the user object by its login and password
     * 
     * @param login the user login
     * @param password  the user password
     * @return the user object
     */
    public User getUser( String login, String password ) {
        final String sql = "{call get_UserAccount( ?,? )}";
        try ( Connection connection = getConnection() ) {              
            CallableStatement cs = connection.prepareCall( sql );
            cs.setString( "login", login );
            cs.setString( "password", password );
            cs.execute();
            ResultSet rs = cs.getResultSet();
            if ( rs.next() ) {
                User u = new User(
                    rs.getLong( "id" ),
                    rs.getString( "login" ),
                    rs.getString( "password" ),
                    rs.getBoolean( "isAdmin" ) );
                return u;
            }            
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }
    
    /**
     * Returns <code>true</code> if there is already any user registered with the same login, 
     * or <code>false</code> if there is no user with the given login 
     * 
     * @param login the user login
     * @return <code>true</code> if login is in use, or <code>false</code> if login is not used
     */
    public boolean isRegistered( String login ) {
        final String sql = "select id from users where login = ?";
        try ( Connection connection = getConnection() ) {  
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setString( 1, login );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return true;
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return false;
    }
    
    /**
     * Add a new user 
     * 
     * @param login the user login
     * @param password the user password
     * @param isAdmin the sign that user is an administrator
     * @return 
     */
    public boolean insert( String login, String password, boolean isAdmin ) {
    	final String sql = "{call add_User( ?,?,? )}";
        try ( Connection connection = getConnection()  ) {  
            CallableStatement cs = connection.prepareCall( sql );
            cs.setString( "login", login );
            cs.setString( "password", password );
            cs.setBoolean( "isAdmin", isAdmin );
            cs.execute();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return false;
    }
    
}
