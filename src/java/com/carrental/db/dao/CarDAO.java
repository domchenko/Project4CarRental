/*
 * CarDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.Car;
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
 * Implements operations to be performed on a car model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class CarDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( CarDAO.class.getName() );
    
    /**
     * Searches a car by id
     * 
     * @param id car id
     * @return 
     */
    public Car getCar( long id ) {
        final String sql = "select * from cars where id = ?";
    	try ( Connection connection = getConnection() ) {  
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, id );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return new Car(
                    rs.getLong( "id" ),
                    rs.getString( "model" ),
                    rs.getFloat( "price" ) );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }

    /**
     * Returns free cars in the specified place during the given period
     * The result list contains only different models for each day
     * 
     * @param placeId the place id
     * @param dateFrom the period begin
     * @param dateTo the period end
     * @return 
     */
    public List<Car> getAvailableCars( long placeId, Date dateFrom, Date dateTo ) {
        final String callSP = "{call get_FreeCarsByPlace( ?,?,? )}";
        List<Car> list = new ArrayList<>(); 
        try ( Connection connection = getConnection() ) {
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, placeId );
            cs.setDate( 2, new java.sql.Date( dateFrom.getTime() ) );
            cs.setDate( 3, new java.sql.Date( dateTo.getTime() ) );
            cs.execute();
            ResultSet rs = cs.getResultSet();                       
            while ( rs.next() ) {
                Car car = new Car(
                        rs.getLong( "id"), 
                        rs.getString( "model"),
                        rs.getFloat( "price" ) );
                list.add( car );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
        } 
        return list;
    }
    
}
