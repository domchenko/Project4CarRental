/*
 * User
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.db.dao.ClientDAO;

/**
 * Describes the entity of the user object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class User {
    private long id;            // the unique identifier
    private String login;       // the user login
    private String password;    // the user password
    private boolean isAdmin;    // the sign that user has administrator rights 
    
    private Client client;      // the client/customer data

    /**
     * Class constructor specifying all object properties
     * 
     * @param id        the user unique identifier
     * @param login     the user login
     * @param password  the user password
     * @param isAdmin   the sign of the administrator rights
     */
    public User( long id, String login, String password, boolean isAdmin ) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.isAdmin = isAdmin;
    }
    
    /**
     * Gets the user unique identifier 
     * 
     * @return the user id
     */
    public long getId() {
        return id;
    }

    /**
     * Sets this user unique identifier with the given long value
     * 
     * @param id the user id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets the user login
     * 
     * @return the user login
     */
    public String getLogin() {
        return login;
    }

    /**
     * Sets this user login with the given String value
     * 
     * @param login the user login
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * Gets the user password
     * 
     * @return the user password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets this user password with the given String value
     * 
     * @param password the user password
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    /**
     * Returns <code>true</code> if and only if this user has the administrator rights
     * 
     * @return <code>true</code> - if user has administrator rights, otherwise - <code>false</code>
     */
    public boolean getIsAdmin() {
        return isAdmin;
    }

    /**
     * Sets this user has administrator rights if given boolean value is <code>true</code>
     * 
     * @param isAdmin the sign of the administrator rights
     */
    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    /**
     * Gets this user passport details such as an address, passport number, date of issue, valid date etc
     * 
     * @return the customer data
     */
    public Client getClient() {
        if ( client == null ) {
            ClientDAO cd = new ClientDAO();
            Client c = cd.getClient( id );
            if ( c == null ) {
                c = new Client();
                c.setIdUser( id );
            }
            setClient( c );
        }
        return client;
    }

    /**
     * Sets this user passport details 
     * 
     * @param client the customer data to set
     */
    public void setClient(Client client) {
        this.client = client;
        this.client.setIdUser( id );
    }

}
