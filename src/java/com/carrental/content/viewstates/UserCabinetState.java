/*
 * UserCabinetState
 *
 * Version 1
 */
package com.carrental.content.viewstates;

import com.carrental.content.service.ContentManager;
import com.carrental.content.service.PageConfigManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Configures the composite page for viewing user cabinet 
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class UserCabinetState extends State {
    
    /**
     * Default constructor
     * @param manager 
     */
    public UserCabinetState(ContentManager manager) {
        super(manager);
    }

    /**
     * Defines the page components
     * 
     * @param request servlet request
     */
    @Override
    public void init(HttpServletRequest request) {
        pageName = PageConfigManager.getPagePath( "pagepath.main" );        
        HttpSession s = request.getSession();
        s.setAttribute( PARAM_CONTENT, PageConfigManager.getPagePath( "pagepath.cabinet" ) );
        s.setAttribute( PARAM_MENU_CONTENT, PageConfigManager.getPagePath( "pagepath.menu.main" ) );  
        s.setAttribute( PARAM_MENU_MODE, true );
    }

}
