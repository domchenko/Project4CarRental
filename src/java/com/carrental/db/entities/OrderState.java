/*
 * OrderState
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.servlets.LangType;

/**
 * Describes the entity of the order status object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class OrderState {
    private long id;        // the order status unique identifier
    private String nameEN;  // the order status name in English
    private String nameUK;  // the order status name in Ukrainian
    
    /**
     * Class constructor specifying all object properties
     * 
     * @param id        the unique identifier
     * @param nameEN    the name in English
     * @param nameUK    the name in Ukrainian
     */
    public OrderState( long id, String nameEN, String nameUK ) {
        this.id = id;
        this.nameEN = nameEN;
        this.nameUK = nameUK;
    }

    /**
     * Gets the orders status unique identifier
     * 
     * @return the unique identifier
     */
    public long getId() {
        return id;
    }

    /**
     * Sets this order status unique identifier with the given long value
     * 
     * @param id the unique identifier to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets the order state name in English
     * 
     * @return the name in English
     */
    public String getNameEN() {
        return nameEN;
    }

    /**
     * Sets this order state name in English with given value
     * 
     * @param nameEN the name in English to set
     */
    public void setNameEN(String nameEN) {
        this.nameEN = nameEN;
    }

    /**
     * Gets the order state name in Ukrainian
     * 
     * @return the name in Ukrainian
     */
    public String getNameUK() {
        return nameUK;
    }

    /**
     * Sets this order state name in Ukrainian with given value
     * 
     * @param nameUK the name in Ukrainian to set
     */
    public void setNameUK(String nameUK) {
        this.nameUK = nameUK;
    }

    /**
     * Returns the order name in specified language
     * 
     * @param lang the language
     * @return the name
     */
    public String getName( LangType lang ) {
        String stateName;
        if ( lang == LangType.UK ) {
            stateName = getNameUK();
            if ( stateName == null || stateName.isEmpty() ) {
                stateName = getNameEN();
            }
        }
        else {
            stateName = getNameEN();
        }
        return stateName;
    }
}
