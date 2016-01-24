/*
 * ApplicationDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.Application;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a application model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ApplicationDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( ApplicationDAO.class.getName() );

    /**
     * Loads the application with the given id
     * 
     * @param id the application id
     * @return the loaded application or null 
     */
    public Application getApplication( long id ) {
        final String sql = "select * from applications where id = ?";
    	try ( Connection connection = getConnection() ) {  
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, id );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return new Application(
                        rs.getLong( "id"), 
                        rs.getLong( "idClient"),
                        rs.getLong( "idCar"),
                        rs.getDate( "dateFrom" ),
                        rs.getDate( "dateTo" ),
                        rs.getLong( "idPlaceFrom"),
                        rs.getLong( "idPlaceTo"),
                        rs.getDate( "dateOperation" ),
                        rs.getLong( "idState"),
                        rs.getString( "note" ) );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }
    
    /**
     * Loads the user applications with given state
     * 
     * @param userId the user id
     * @param stateId the application state id
     * @return the list of the applications
     */
    public List<Application> getUserApplications( long userId, int stateId ) {
        final String callSP = "{call get_ApplicationsByUser( ?,? )}";
        List<Application> l = new ArrayList<>();
        try ( Connection connection = getConnection() ) {
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, userId );
            cs.setInt( 2, stateId );
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while ( rs.next() ) {
                Application app = new Application(
                        rs.getLong( "id"), 
                        rs.getLong( "idClient"),
                        rs.getLong( "idCar"),
                        rs.getDate( "dateFrom" ),
                        rs.getDate( "dateTo" ),
                        rs.getLong( "idPlaceFrom"),
                        rs.getLong( "idPlaceTo"),
                        rs.getDate( "dateOperation" ),
                        rs.getLong( "idState"),
                        rs.getString( "note" ) );
                l.add( app );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
        } 
        return l;
    }
    
    /**
     * Loads all applications with the given state
     * 
     * @param stateId the state id
     * @return the list of the applications
     */
    public List<Application> getApplications( int stateId ) {
        final String callSP = "{call get_ApplicationsByState( ? )}";
        List<Application> l = new ArrayList<>();        
        try ( Connection connection = getConnection() ) {
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setInt( 1, stateId );
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while ( rs.next() ) {
                Application app = new Application(
                        rs.getLong( "id"), 
                        rs.getLong( "idClient"),
                        rs.getLong( "idCar"),
                        rs.getDate( "dateFrom" ),
                        rs.getDate( "dateTo" ),
                        rs.getLong( "idPlaceFrom"),
                        rs.getLong( "idPlaceTo"),
                        rs.getDate( "dateOperation" ),
                        rs.getLong( "idState"),
                        rs.getString( "note" ) );
                l.add( app );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
        } 
        return l;
    }
    
    /**
     * Adds the new application with the given properties
     * 
     * @param clientId the user id
     * @param carId the car id
     * @param dateFrom the rental period begin
     * @param dateTo the rental period end
     * @param placeFromId the pick-up parking place id
     * @param placeToId the return parking place id
     * @param dateOperation the filling date
     * @param stateId the application state id
     * @param note the application note
     * @return <code>true</code> if action succeeded, or <code>false</code> if failed
     */
    public boolean insert(
            long clientId, long carId,
            Date dateFrom, Date dateTo,
            long placeFromId, long placeToId,
            Date dateOperation, int stateId, String note ) {
    	final String sql = "{call add_Application( ?,?,?,?,?,?,?,?,? )}";
        try ( Connection connection = getConnection() ) {
            CallableStatement cs = connection.prepareCall( sql );
            cs.setLong( "idClient", clientId );
            cs.setLong( "idCar", carId );
            cs.setDate( "dateFrom", new java.sql.Date( dateFrom.getTime() ) );
            cs.setDate( "dateTo", new java.sql.Date( dateTo.getTime() ) );
            cs.setLong( "idPlaceFrom", placeFromId );
            cs.setLong( "idPlaceTo", placeToId );
            cs.setDate( "dateOperation", new java.sql.Date( dateOperation.getTime() ) );
            cs.setLong( "idState", stateId );
            if ( note != null ) {
                cs.setString( "note", note );
            }
            else {
                cs.setNull( "note", java.sql.Types.VARCHAR );
            }
            cs.execute();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return false;    
    }
    
    /**
     * Changes the application state to <code>newStateId</code>
     * 
     * @param applicationId the application id
     * @param newStateId the state id
     * @param newNote the note
     * @return <code>true</code> if action succeeded, or <code>false</code> if failed
     */
    public boolean updateApplicationState( long applicationId, long newStateId,
            String newNote ) {
        final String sql;
        if ( newNote == null ) {
            sql = "update applications set idState=? "
                    + "where id=? ";
        }
        else {
            sql = "update applications set idState=?, note=? "
                    + "where id=? ";
        }
        try ( Connection connection = getConnection() ) {
            PreparedStatement st = connection.prepareStatement( sql );
            st.setLong( 1, newStateId );            
            if ( newNote == null ) {
                st.setLong( 2, applicationId );
            }
            else {                
                st.setString( 2, newNote );
                st.setLong( 3, applicationId );
            }
            st.executeUpdate();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return false;
    }
    
}
