/*
 * PageConfigManager
 *
 * Version 1
 */
package com.carrental.content.service;

import java.util.ResourceBundle;

/**
 * Provides paths for pages from the property file
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class PageConfigManager {
    private final static ResourceBundle resBundle = 
            ResourceBundle.getBundle( "com.carrental.locale.pageconfig" );
    
    /**
     * Returns the page path
     * 
     * @param property the page name
     * @return the page path
     */
    public static String getPagePath( String property ) {
        return resBundle.getString( property );
    }
}
