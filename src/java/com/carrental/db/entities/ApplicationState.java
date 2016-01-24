/*
 * ApplicationState
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.servlets.LangType;

/**
 * Describes the entity of the application status object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ApplicationState {
    private long id;        // the application status unique identifier
    private String nameEN;  // the application status name in English
    private String nameUK;  // the application status name in Ukrainian
    
    /**
     * Class constructor specifying all object properties
     * 
     * @param id        the unique identifier
     * @param nameEN    the name in English
     * @param nameUK    the name in Ukrainian
     */
    public ApplicationState( long id, String nameEN, String nameUK) {
        this.id = id;
        this.nameEN = nameEN;
        this.nameUK = nameUK;
    }
    
    /**
     * Gets this application state unique identifier
     * 
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * Sets this application state unique identifier with the given long value
     * 
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets this state name in English
     * 
     * @return the name in English
     */
    public String getNameEN() {
        return nameEN;
    }

    /**
     * Sets the state name in English with the given value
     * 
     * @param nameEN the name in English to set
     */
    public void setNameEN(String nameEN) {
        this.nameEN = nameEN;
    }

    /**
     * Gets this state name in Ukrainian
     * 
     * @return the name in Ukrainian
     */
    public String getNameUK() {
        return nameUK;
    }

    /**
     * Sets the state name in Ukrainian with the given value
     * 
     * @param nameUK the name in Ukrainian to set
     */
    public void setNameUK(String nameUK) {
        this.nameUK = nameUK;
    }

    /**
     * Gets this state name in specified language
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
