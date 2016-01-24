/*
 * OrderStateEnum
 *
 * Version 1
 */
package com.carrental.db.entities;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;


/**
 * Declares the order status object 
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public enum OrderStateEnum {
    NEW(1),         // the application is confirmed
    PAID(3),        // the payment of the ren is paid
    UNPAID(4),      // the payment of the ren was not paid
    EXECUTING(5),   // the car is give out
    DONE(2),        // the car is returned
    ACCIDENT(6);    // the car was damaged and a peyment for repair is opened
    
    private static final Map<Integer,OrderStateEnum> data = new HashMap<>();

    static {
        for ( OrderStateEnum state: EnumSet.allOf( OrderStateEnum.class ) ) {
           data.put( state.getId(), state );
        }
    }

    private int id;

    private OrderStateEnum( int id ) {
        this.id = id;
    }

    public int getId() { 
        return id; 
    }

    public static OrderStateEnum get( int id ) { 
        return data.get( id ); 
    }
}
