/*
 * State
 *
 * Version 1
 */
package com.carrental.content.viewstates;

import com.carrental.content.service.ContentManager;
import javax.servlet.http.HttpServletRequest;

/**
 * The base class to configure the composite page 
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public abstract class State {
    // the main part of the site (content part)
    protected static final String PARAM_CONTENT = "contentPath";
    // the main (right) part of the user cabinet page
    // (there is a menu bar on the left side)
    protected static final String PARAM_MENU_CONTENT = "menuContentPath";
    // the user menu mode
    protected static final String PARAM_MENU_MODE = "menuMode";
    
    protected ContentManager manager;   // the service object that contains all the data                                         
    protected String pageName = "";     // the main page name
    
    /**
     * Default constructor
     * 
     * @param manager 
     */
    public State( ContentManager manager ) {
        this.manager = manager;
    }
    
    /**
     * Defines the page components
     * 
     * @param request servlet request
     */
    public abstract void init( HttpServletRequest request );
    
    /**
     * Returns the path of the page that is going to be shown next 
     * (after executing some command/action)
     * 
     * @return the page path
     */
    public String getNextPage() {
        return pageName;
    }
    
}
