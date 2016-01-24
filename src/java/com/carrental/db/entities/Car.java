/*
 * Car
 *
 * Version 1
 */
package com.carrental.db.entities;

/**
 * Describes the entity of the car object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class Car {
    private long id;        // the car unique identifier
    private String model;   // the car model name
    private float price;    // the rental fee per day

    /**
     * Class constructor specifying all object properties
     * 
     * @param id    the unique identifier
     * @param model the model name
     * @param price the rental fee per day 
     */
    public Car( long id, String model, float price ) {
        this.id = id;
        this.model = model;
        this.price = price;
    }
    
    /**
     * Gets this car unique identifier
     * 
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * Sets this car unique identifier with the given long value
     * 
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets this car model name
     * 
     * @return the model
     */
    public String getModel() {
        return model;
    }

    /**
     * Sets the car model name with given value
     * 
     * @param model the model to set
     */
    public void setModel(String model) {
        this.model = model;
    }

    /**
     * Gets this car rental fee per day
     * 
     * @return the rental fee
     */
    public float getPrice() {
        return price;
    }

    /**
     * Sets the car rental fee
     * 
     * @param price the rental fee to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

}
