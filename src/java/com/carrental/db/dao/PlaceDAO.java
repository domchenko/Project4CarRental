/*
 * PlaceDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.Place;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a payment model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class PlaceDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( PlaceDAO.class.getName() );
    
    /**
     * Returns places sorted by name in English
     * 
     * @return list of the places
     */
    public List<Place> getPlaces() {
        final String sql = "select * from places order by name_en";
    	List<Place> l = new LinkedList<>();
    	try ( Connection connection = getConnection() ) {  
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery( sql );
            while ( rs.next() ) {
                l.add( new Place( 
                    rs.getLong( "id" ),
                    rs.getLong( "idCity" ),
                    rs.getString( "name_en" ),
                    rs.getString( "name_uk" ),
                    rs.getString( "address_en" ),
                    rs.getString( "address_uk" ) ) );                        
            }            
        } catch ( SQLException e ) {
            LOGGER.error( e );            
    	} 
    	return l;
    }
    
    /**
     * Loads the place with the given id
     * 
     * @param id the place id
     * @return 
     */
    public Place getPlace( long id ) {
        final String sql = "select * from places where id = ?";
        try ( Connection connection = getConnection() ) {
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, id );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return new Place(
                    rs.getLong( "id" ),
                    rs.getLong( "idCity" ),
                    rs.getString( "name_en" ),
                    rs.getString( "name_uk" ),
                    rs.getString( "address_en" ),
                    rs.getString( "address_uk" ) );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }
}
