/*
 * Place
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.servlets.LangType;
import java.util.Comparator;

/**
 * Describes the entity of the parking place object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class Place {
    private long id;            // the parking place unique identifier
    private long idCity;        // the city identifier 
    private String nameEN;      // the place name in English
    private String nameUK;      // the place name in Ukrainian
    private String addressEN;   // the place address in English
    private String addressUK;   // the place address in Ukrainian
    
    /**
     * Class constructor specifying all object properties
     * 
     * @param id        the place unique identifier
     * @param idCity    the city identifier
     * @param nameEN    the place name in English
     * @param nameUK    the place name in Ukrainian
     * @param addressEN the place address in English
     * @param addressUK the place address in Ukrainian
     */
    public Place( long id, long idCity, String nameEN, String nameUK,
            String addressEN, String addressUK ) {
        this.id = id;
        this.idCity = idCity;
        this.nameEN = nameEN;
        this.nameUK = nameUK;
        this.addressEN = addressEN;
        this.addressUK = addressUK;
    }
    
    /**
     * Gets this parking place unique identifier
     * 
     * @return place id
     */
    public long getId() {
        return id;
    }

    /**
     * Sets this parking unique identifier with the given long value
     * 
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }
    
    /**
     * Gets this parking place name in English
     * 
     * @return the name in English
     */
    public String getNameEN() {
        return nameEN;
    }

    /**
     * Sets this parking place name in English with given value
     * 
     * @param nameEN the name in English to set
     */
    public void setNameEN(String nameEN) {
        this.nameEN = nameEN;
    }

    /**
     * Gets this parking place name in Ukrainian
     * 
     * @return the name in Ukrainian
     */
    public String getNameUK() {
        return nameUK;
    }

    /**
     * Sets this parking place name in Ukrainian with the given value
     * 
     * @param nameUK the name in Ukrainian to set
     */
    public void setNameUK(String nameUK) {
        this.nameUK = nameUK;
    }

    /**
     * Gets the address in English of this parking place
     * 
     * @return the address in English
     */
    public String getAddressEN() {
        return addressEN;
    }

    /**
     * Sets the address in English of this place with given value
     * 
     * @param addressEN the address in English to set
     */
    public void setAddressEN(String addressEN) {
        this.addressEN = addressEN;
    }

    /**
     * Gets the address in Ukrainian of this parking place
     * 
     * @return the address in Ukrainian
     */
    public String getAddressUK() {
        return addressUK;
    }

    /**
     * Sets the address in Ukrainian of this place with given value
     * 
     * @param addressUK the address in Ukrainian to set
     */
    public void setAddressUK(String addressUK) {
        this.addressUK = addressUK;
    }

    /**
     * Gets the city identifier of this parking place
     * 
     * @return the city identifier
     */
    public long getIdCity() {
        return idCity;
    }

    /**
     * Sets the city identifier of this place with given long value
     * 
     * @param idCity the city identifier to set
     */
    public void setIdCity(long idCity) {
        this.idCity = idCity;
    }

    /**
     * Sorts the parking places by their names in Ukrainian
     * 
     * @return comparator  
     */
    public static Comparator<Place> getComparatorUK() {
        return new Comparator() {
            
            @Override
            public int compare(Object o1, Object o2) {
                return ( (Place) o1 ).getNameUK().compareToIgnoreCase( 
                        ( (Place) o2 ).getNameUK() );
            }
        };
    }
    
    /**
     * Returns the place name in specified language
     * 
     * @param lang the language
     * @return the name
     */
    public String getName( LangType lang ) {
        String placeName;
        if ( lang == LangType.UK ) {
            placeName = getNameUK();
            if ( placeName == null || placeName.isEmpty() ) {
                placeName = getNameEN();
            }
        }
        else {
            placeName = getNameEN();
        }
        return placeName;
    }
    
    /**
     * Returns the place address in specified language
     * 
     * @param lang the language
     * @return the address
     */
    public String getAddress( LangType lang ) {
        String address;
        if ( lang == LangType.UK ) {
            address = getAddressUK();
            if ( address == null || address.isEmpty() ) {
                address = getAddressEN();
            }
        }
        else {
            address = getAddressEN();
        }
        return address;
    }
    
}
