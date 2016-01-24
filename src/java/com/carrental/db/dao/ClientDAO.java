/*
 * ClientDAO
 *
 * Version 1
 */
package com.carrental.db.dao;

import com.carrental.db.entities.Client;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Implements operations to be performed on a client model object
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ClientDAO extends DAO {
    private static final Logger LOGGER = LogManager.getLogger( ClientDAO.class.getName() );
    
    /**
     * Searches for user passport data by user id
     * 
     * @param id user id
     * @return 
     */
    public Client getClient( long id ) {
        final String sql = "select * from clients where idUser = ?";
    	try ( Connection connection = getConnection() ){  
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, id );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return new Client(
                    rs.getLong( "idUser" ),
                    rs.getString( "surname" ),
                    rs.getString( "firstName" ),
                    rs.getString( "secondName" ),
                    rs.getString( "passportNumber" ),
                    rs.getDate( "dateOfIssue" ),
                    rs.getDate( "validUntil" ),
                    rs.getString( "issuedBy" ),
                    rs.getDate( "birthday" ),
                    rs.getString( "address" ) );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return null;
    }
    
    /**
     * Add user passport data
     * 
     * @param id the user id
     * @param surname the user surname
     * @param firstName the user first name
     * @param secondName the user second name
     * @param passportNumber the user passport number
     * @param dateOfIssue the date of issue
     * @param validUntil the passport expiry
     * @param issuedBy the issuing authority name
     * @param birthday the user birthday
     * @param address the user address
     * @return 
     */
    public boolean insert( Long id,
            String surname, String firstName, String secondName,
            String passportNumber, Date dateOfIssue, Date validUntil,
            String issuedBy, Date birthday, String address ) {
    	final String sql = "{call add_Client( ?,?,?,?,?,?,?,?,?,? )}";
        try ( Connection connection = getConnection() ) {  
            CallableStatement cs = connection.prepareCall( sql );
            cs.setLong( "idUser", id );
            cs.setString( "surname", surname );
            cs.setString( "firstName", firstName );
            if ( secondName != null ) {
                cs.setString( "secondName", secondName );
            }
            else {
                cs.setNull( "secondName", java.sql.Types.VARCHAR );
            }
            cs.setString( "passportNumber", passportNumber );
            cs.setDate( "dateOfIssue", new java.sql.Date( dateOfIssue.getTime() ) );
            if ( validUntil != null ) {
                cs.setDate( "validUntil", new java.sql.Date( validUntil.getTime() ) );
            }
            else {
                cs.setNull( "validUntil", java.sql.Types.DATE );
            }
            cs.setString( "issuedBy", issuedBy );
            cs.setDate( "birthday", new java.sql.Date( birthday.getTime() ) );
            cs.setString( "address", address );
            cs.execute();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return false;    
    }

    /**
     * Update user passport data 
     * 
     * @param id the user id
     * @param surname the user surname
     * @param firstName the user first name
     * @param secondName the user second name
     * @param passportNumber the user passport number
     * @param dateOfIssue the date of issue
     * @param validUntil the passport expiry
     * @param issuedBy the issuing authority name
     * @param birthday the user birthday
     * @param address the user address
     * @return 
     */
    public boolean update( Long id,
            String surname, String firstName, String secondName,
            String passportNumber, Date dateOfIssue, Date validUntil,
            String issuedBy, Date birthday, String address ) {
    	final String sql = "update clients "
                + "set surname=?, firstName=?, secondName=?, "
                + "passportNumber=?, dateOfIssue=?, validUntil=?, issuedBy=?, "
                + "birthday=?, address=? "
                + "where idUser=? ";
        try ( Connection connection = getConnection() ) {
            PreparedStatement st = connection.prepareStatement( sql );
            st.setString( 1, surname );
            st.setString( 2, firstName );
            st.setString( 3, secondName );
            st.setString( 4, passportNumber );
            st.setDate( 5, new java.sql.Date( dateOfIssue.getTime() ) );
            if ( validUntil == null ) {
                st.setNull( 6, java.sql.Types.DATE );
            }
            else {
                st.setDate( 6, new java.sql.Date( validUntil.getTime() ) );
            }
            st.setString( 7, issuedBy );
            st.setDate( 8, new java.sql.Date( birthday.getTime() ) );
            st.setString( 9, address );
            st.setLong( 10, id );
            st.executeUpdate();
            return true;
        } catch ( SQLException e ) {
            LOGGER.error( e );
        }
        return false;
    }
    
    /**
     * Searches for user details in database 
     * and inserts it if user hasn't fill up his passport information yet
     * or update it if user filled up it earlier
     * 
     * @param id the user id
     * @param surname the user surname
     * @param firstName the user first name
     * @param secondName the user second name
     * @param passportNumber the user passport number
     * @param dateOfIssue the date of issue
     * @param validUntil the passport expiry
     * @param issuedBy the issuing authority name
     * @param birthday the user birthday
     * @param address the user address
     * @return 
     */
    public boolean saveOrUpdate( Long id,
            String surname, String firstName, String secondName,
            String passportNumber, Date dateOfIssue, Date validUntil,
            String issuedBy, Date birthday, String address ) {
        final String sql = "select * from clients where idUser = ?";
    	try ( Connection connection = getConnection() ) {  
            PreparedStatement ps = connection.prepareStatement( sql );
            ps.setLong( 1, id );
            ResultSet rs = ps.executeQuery();
            if ( rs.next() ) {
                return update( id, surname, firstName, secondName, 
                        passportNumber, dateOfIssue, validUntil, issuedBy, 
                        birthday, address );
            }
            else {
                return insert( id, surname, firstName, secondName, 
                        passportNumber, dateOfIssue, validUntil, issuedBy, 
                        birthday, address );
            }
        } catch ( SQLException e ) {
            LOGGER.error( e );
    	} 
    	return false;
    }
}
