/*
 * PaymentDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.OrderStateEnum;
import com.carrental.db.entities.Payment;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a payment model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class PaymentDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( PaymentDAO.class.getName() );
    
    /**
     * Loads the user payments with given state
     * 
     * @param userId the user id
     * @param state the order state
     * @return the list of the payments
     */
    public List<Payment> getUserPayments( long userId, OrderStateEnum state ) {
        final String callSP = "{call get_PaymentsByUser( ?,? )}";
        List<Payment> l = new ArrayList<>();
        try ( Connection connection = getConnection() ) {
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, userId );
            cs.setInt( 2, state.getId() );
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while ( rs.next() ) {
                Payment p = new Payment(
                        rs.getLong( "id"), 
                        rs.getLong( "idClient"),
                        rs.getFloat( "sum"),
                        rs.getString( "currencyCode" ),
                        rs.getDate( "dateOpen" ),
                        rs.getDate( "dateClose" ),
                        rs.getString( "note" ) );
                l.add( p );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
        } 
        return l;
    }
    
    /**
     * Loads all payments with given state
     * 
     * @param state the order state
     * @return the list of the payments
     */
    public List<Payment> getPayments( OrderStateEnum state ) {
        final String callSP = "{call get_PaymentsByState( ? )}";
        List<Payment> l = new ArrayList<>();        
        try ( Connection connection = getConnection() ) {
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setInt( 1, state.getId() );
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while ( rs.next() ) {
                Payment p = new Payment(
                        rs.getLong( "id"), 
                        rs.getLong( "idClient"),
                        rs.getFloat( "sum"),
                        rs.getString( "currencyCode" ),
                        rs.getDate( "dateOpen" ),
                        rs.getDate( "dateClose" ),
                        rs.getString( "note" ) );
                l.add( p );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
        } 
        return l;
    }
    
    /**
     * Loads the payments with the given application number
     * 
     * @param applicationId the application id
     * @return the list of the payments
     */
    public List<Payment> getOrderPayments( long applicationId ) {
        final String callSP = "{call get_PaymentsByApplication( ? )}";
        List<Payment> l = new ArrayList<>();
        try ( Connection connection = getConnection() ) {
            CallableStatement cs = connection.prepareCall( callSP );
            cs.setLong( 1, applicationId );
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while ( rs.next() ) {
                Payment p = new Payment(
                        rs.getLong( "id"), 
                        rs.getLong( "idClient"),
                        rs.getFloat( "sum"),
                        rs.getString( "currencyCode" ),
                        rs.getDate( "dateOpen" ),
                        rs.getDate( "dateClose" ),
                        rs.getString( "note" ) );
                l.add( p );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
        } 
        return l;
    }
    
    /**
     * Notes payment as paid
     * 
     * @param paymentId the payment id
     * @return <code>true</code> if the payment was updated, otherwise - <code>false</code>
     */
    public boolean setAsPaid( long paymentId ) {
        final String sql = 
                "update payments set dateClose=? where id=? ";
        try ( Connection connection = getConnection() ) {
            PreparedStatement st = connection.prepareStatement( sql );
            st.setDate( 1, new Date( Calendar.getInstance().getTime().getTime() ) );
            st.setLong( 2, paymentId );
            st.executeUpdate();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return false;
    }
}
