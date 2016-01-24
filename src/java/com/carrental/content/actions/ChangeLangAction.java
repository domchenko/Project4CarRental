/*
 * ChangeLangAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import static com.carrental.content.actions.Action.PARAM_MANAGER;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for changing language
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ChangeLangAction implements Action {
    private static final Logger LOGGER = LogManager.getLogger( ChangeLangAction.class.getName() );

    /**
     * Switches the current language
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );

            String lang = request.getParameter( PARAM_LANG ).toLowerCase();            
            s.setAttribute( PARAM_LANG, lang );
            manager.setLang( lang );
            s.setAttribute( PARAM_LOCALE, manager.getLocale() );            

            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

}
