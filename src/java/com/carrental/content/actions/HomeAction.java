/*
 * HomeAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.BaseState;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Redirect to home page
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class HomeAction implements Action {
    private static final Logger LOGGER = LogManager.getLogger( HomeAction.class.getName() );

    /**
     * Sets the home page state
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();        
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );
            manager.setCurrentState( new BaseState( manager ) );
            manager.reinit( request );
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

}
