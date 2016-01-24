/*
 * CarPark
 *
 * Version 1
 */
package com.carrental.db.entities;

/**
 * Describes the entity of the car park object in the database
 * Associates a car and its location
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class CarPark {
    private long id;        // the unique identifier
    private long idCar;     // the car identifier
    private long idPlace;   // the parking place identifier
    
    private Car car;        // the linked car object
    private Place place;    // the linked parking place object

    /**
     * Gets the unique identifier
     * 
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * Sets unique identifier with the given long value
     * 
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets the car 
     * 
     * @return the car
     */
    public Car getCar() {
        return car;
    }

    /**
     * Sets the car
     * 
     * @param car the car to set
     */
    public void setCar(Car car) {
        this.car = car;
    }

    /**
     * Gets the location of the car
     * 
     * @return the place
     */
    public Place getPlace() {
        return place;
    }

    /**
     * Sets the location of the car
     * 
     * @param place the place to set
     */
    public void setPlace(Place place) {
        this.place = place;
    }

}
