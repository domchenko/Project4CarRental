/*
 * Action
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import javax.servlet.http.HttpServletRequest;

/**
 * Declares the base methods and constants of action/command 
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public interface Action {
    public static final String PARAM_MANAGER = "contentManager";
    public static final String PARAM_LANG = "lang";
    public static final String PARAM_LOCALE = "locale";
    
    // login & register
    // - login
    public static final String IN_PARAM_LOGGED = "loginProc";
    public static final String IN_PARAM_LOGIN = "login";
    public static final String IN_PARAM_PASSWORD = "password";
    public static final String PARAM_ERRORMSG_LOGIN = "logInErrorCode";    
    // - register
    public static final String IN_PARAM_REGISTERED = "registerProc";
    public static final String IN_PARAM_PASSWORDCONFIRM = "passwordConfirm";
    public static final String PARAM_ERRORMSG_REG = "registerErrorCode";
    
    // search
    public static final String PARAM_CITIES = "cities";
    public static final String PARAM_PLACES = "places";
    
    // search -> catalog
    public static final String PARAM_CARS = "cars";
    public static final String IN_PARAM_DATE_FROM = "dateFrom";
    public static final String IN_PARAM_DATE_TO = "dateTo";
    public static final String IN_PARAM_PLACE_FROM = "ddlPlaceFrom"; 
    public static final String IN_PARAM_PLACE_TO = "ddlPlaceTo";    
    public static final String IN_PARAM_RENT_CAR_ID = "rentCar";
    
    // cabinet
    public static final String PARAM_USERCABINET_MSG = "userCabinetMessage";
    
    /**
     * Makes something useful to execute assigned procedure
     * 
     * @param request the servlet request
     * @return the service object
     */
    public ContentManager execute( HttpServletRequest request );
}
