/*
 * OrderDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.Order;
import com.carrental.db.entities.OrderStateEnum;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a order model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class OrderDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( OrderDAO.class.getName() );
    
    /**
     * Searches a payment by its id
     * 
     * @param paymentId the payment id
     * @return 
     */
    public Order getOrderByPayment( long paymentId ) {
        final String sql = "select * from orders where idPayment = ?";
    	try ( Connection connection = getConnection() ) {  
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, paymentId );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return new Order(
                    //rs.getLong( "id" ),
                    rs.getLong( "idApplication" ),
                    rs.getLong( "idPayment" ),
                    rs.getLong( "idState" ) );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }

    /**
     * Searches a payment by application number
     * 
     * @param applicationId the application id
     * @return 
     */
    public Order getOrderByApplication( long applicationId ) {
        final String sql = "select * from orders where idApplication = ?";
    	try ( Connection connection = getConnection() ) {  
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, applicationId );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return new Order(
                    //rs.getLong( "id" ),
                    rs.getLong( "idApplication" ),
                    rs.getLong( "idPayment" ),
                    rs.getLong( "idState" ) );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }
    
    /**
     * Creates a new order for lease, changes application state and creates a payment for rent
     * 
     * @param applicationId the application id
     * @param sum the sum of the lease
     * @param note the application note
     * @return 
     */
    public long createOrder( long applicationId, float sum, String note ) {
        final String callSP = "{call add_Order( ?,?,?,? )}";
        try ( Connection connection = getConnection() ){
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, applicationId );
            cs.setFloat( 2, sum );
            if ( note != null ) {
                cs.setString( 3, note );
            }
            else {
                cs.setNull( 3, java.sql.Types.VARCHAR );
            }
            cs.registerOutParameter( 4, java.sql.Types.INTEGER );
            cs.executeUpdate();
            return cs.getLong( 4 );
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return 0;
    }
    
    /**
     * Changes the order state to paid and closes the payment
     * 
     * @param paymentId the payment id
     * @return 
     */
    public boolean confirmOrder( long paymentId ) {
        final String callSP = "{call set_OrderPaid( ? )}";
        try ( Connection connection = getConnection() ){
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, paymentId );
            cs.executeUpdate();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return false;
    }
    
    /**
     * Changes the order state to unpaid and sets the application state as rejected
     * 
     * @param paymentId the payment id
     * @param note the application note
     * @return 
     */
    public boolean rejectOrder( long paymentId, String note ) {
        final String callSP = "{call set_OrderUnpaid( ?,? )}";
        try ( Connection connection = getConnection() ){
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, paymentId );
            cs.setString( 2, note );
            cs.executeUpdate();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return false;
    }
    
    /**
     * Sets order state to done and creates a payment for repair if damageSum is more than 0
     * 
     * @param applicationId the application id
     * @param stateId the order state to set
     * @param damageSum the sum of the repair
     * @return 
     */
    public boolean closeOrder( long applicationId, int stateId,
            float damageSum ) {
        final String callSP = "{call set_OrderReturnCar( ?,?,? )}";
        try ( Connection connection = getConnection() ){
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, applicationId );
            cs.setLong( 2, stateId );
            if ( stateId == OrderStateEnum.ACCIDENT.getId() ) {
                cs.setFloat( 3, damageSum );
            }
            else {
                cs.setNull( 3, java.sql.Types.FLOAT );
            }
            cs.executeUpdate();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return false;
    }
    
    /**
     * Changes order state
     * 
     * @param applicationId the application id
     * @param stateId the order state to set
     * @return 
     */
    public boolean updateState( long applicationId, int stateId ) {
        final String sql = 
                "update orders set idState=? where idApplication=? ";
        try ( Connection connection = getConnection() ) {
            PreparedStatement st = connection.prepareStatement( sql );
            st.setLong( 1, stateId );
            st.setLong( 2, applicationId );
            st.executeUpdate();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return false;
    }
}
