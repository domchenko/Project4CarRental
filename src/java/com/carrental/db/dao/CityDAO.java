/*
 * CityDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.City;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a city model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class CityDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( CityDAO.class.getName() );

    /**
     * Returns cities sorted by name in English
     * 
     * @return 
     */
    public List<City> getCities() {
        final String sql = "select * from cities order by name_en";
        List<City> l = new LinkedList<>();
    	try ( Connection connection = getConnection() ) {  
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery( sql );
            while ( rs.next() ) {
                City c = new City( 
                    rs.getLong( "id" ),
                    rs.getString( "name_en" ),
                    rs.getString( "name_uk" ) );
                l.add( c );                        
            }            
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return l;
    }
}
