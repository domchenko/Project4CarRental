/*
 * ApplicationStateDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.ApplicationState;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a application state model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ApplicationStateDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( ApplicationStateDAO.class.getName() );
    
    /**
     * Gets the application state by its id
     * 
     * @param id the state id
     * @return 
     */
    public ApplicationState getState( long id ) {
        final String sql = "select * from application_states where id = ?";
    	try ( Connection connection = getConnection() ) {
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, id );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return new ApplicationState(
                    rs.getLong( "id" ),
                    rs.getString( "name_en" ),
                    rs.getString( "name_uk" ) );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }
    
    /**
     * Returns all application states
     * 
     * @return 
     */
    public List<ApplicationState> getStates() {
        final String sql = "select * from application_states";
        List<ApplicationState> l = new ArrayList<>();
    	try ( Connection connection = getConnection() ) {  
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery( sql );
            while ( rs.next() ) {
                ApplicationState s = new ApplicationState( 
                    rs.getLong( "id" ),
                    rs.getString( "name_en" ),
                    rs.getString( "name_uk" ) );
                l.add( s );                        
            }            
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return l;
    }
}
