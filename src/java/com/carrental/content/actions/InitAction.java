/*
 * InitAction
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
 * Creates a service object and opens a new session 
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class InitAction implements Action {
    private static final Logger LOGGER = LogManager.getLogger( InitAction.class.getName() );

    /**
     * Opens a new session and initializes main parameters
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession( true );
            ContentManager manager = new ContentManager();        

            // sets the language
            String lang = request.getParameter( PARAM_LANG );
            if ( lang == null ) {
                lang = request.getLocale().getLanguage();            
            }
            s.setAttribute( PARAM_LANG, lang );
            manager.setLang( lang );

            manager.setCurrentState( new BaseState( manager ) );
            manager.reinit( request );
            // sets the service object
            s.setAttribute( PARAM_MANAGER, manager );
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

}
