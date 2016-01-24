/*
 * LogInState
 *
 * Version 1
 */
package com.carrental.content.viewstates;

import com.carrental.content.service.ContentManager;
import com.carrental.content.service.PageConfigManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Configures the composite page for viewing log in form
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class LogInState extends State {

    /**
     * Default constructor
     * @param manager 
     */
    public LogInState(ContentManager manager) {
        super(manager);
    }
    
    /**
     * Defines the page components
     * 
     * @param request servlet request
     */
    @Override
    public void init( HttpServletRequest request ) {
        pageName = PageConfigManager.getPagePath( "pagepath.main" );
        HttpSession s = request.getSession();
        s.setAttribute( PARAM_CONTENT, 
                PageConfigManager.getPagePath( "pagepath.login" ) );
        s.setAttribute( PARAM_MENU_MODE, false );
    }

}
