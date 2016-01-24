/*
 * ApplicationStateEnum
 *
 * Version 1
 */
package com.carrental.db.entities;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

/**
 * Declares the application status object 
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public enum ApplicationStateEnum {
    NEW(1),         // the application is filled up by user
    CONFIRMED(2),   // the application is confirmed by administrator
    REJECTED(3),    // the application is rejected by administrator
    DONE(4),        // the payment for rent is paid
    CANCELED(5);    // the application is canceled by user
    
    private static final Map<Integer,ApplicationStateEnum> data = new HashMap<>();

    static {
        for ( ApplicationStateEnum state: EnumSet.allOf( ApplicationStateEnum.class ) ) {
           data.put( state.getId(), state );
        }
    }

    private int id;

    private ApplicationStateEnum( int id ) {
        this.id = id;
    }

    public int getId() { 
        return id; 
    }

    public static ApplicationStateEnum get( int id ) { 
        return data.get( id ); 
    }
}
