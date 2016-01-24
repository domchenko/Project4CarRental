/*
 * City
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.servlets.LangType;
import java.util.Comparator;

/**
 * Describes the entity of the city object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class City {
    private long id;        // the city unique identifier
    private String nameEN;  // the city name in English
    private String nameUK;  // the city name in Ukrainian

    /**
     * Class constructor specifying all object properties
     * 
     * @param id        the unique identifier
     * @param nameEN    the name in English
     * @param nameUK    the name in Ukrainian
     */
    public City( long id, String nameEN, String nameUK ) {
        this.id = id;
        this.nameEN = nameEN;
        this.nameUK = nameUK;
    }
    
    /**
     * Gets the city unique identifier
     * 
     * @return the unique identifier
     */
    public long getId() {
        return id;
    }

    /**
     * Sets this city unique identifier with the given long value
     * 
     * @param id the unique identifier to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets this city name in Ukrainian
     * 
     * @return the name in Ukrainian
     */
    public String getNameUK() {
        return nameUK;
    }

    /**
     * Sets the city name in Ukrainian with given value
     * 
     * @param name the name in Ukrainian to set
     */
    public void setNameUK(String name) {
        this.nameUK = name;
    }
    
    /**
     * Gets this city name in English
     * 
     * @return the name in English
     */
    public String getNameEN() {
        return nameEN;
    }

    /**
     * Sets the city name in English with given value
     * 
     * @param name the name in English to set
     */
    public void setNameEN(String name) {
        this.nameEN = name;
    }
    
    /**
     * Returns comparator that sorts cities by their names in Ukrainian
     * 
     * @return comparator in Ukrainian 
     */
    public static Comparator<City> getComparatorUK() {
        return new Comparator() {
            
            @Override
            public int compare(Object o1, Object o2) {
                return ( (City) o1 ).getNameUK().compareToIgnoreCase( 
                        ( (City) o2 ).getNameUK() );
            }
        };
    }
    
    /**
     * Returns city name in the specified language
     * 
     * @param lang the language
     * @return the name of the city
     */
    public String getName( LangType lang ) {
        String cityName;
        if ( lang == LangType.UK ) {
            cityName = getNameUK();
            if ( cityName == null || cityName.isEmpty() ) {
                cityName = getNameEN();
            }
        }
        else {
            cityName = getNameEN();
        }
        return cityName;
    }
}

