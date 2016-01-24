/*
 * SearchAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.CatalogState;
import static com.carrental.content.actions.Action.PARAM_MANAGER;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for making an application to rent a car
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class SearchAction implements Action {
    private static final Logger LOGGER = LogManager.getLogger( SearchAction.class.getName() );

    /**
     * Saves the data filled up in the form for searching a car
     * and shows a list of available vehicles
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new CatalogState( manager ) );

            String dateFrom = request.getParameter( IN_PARAM_DATE_FROM );
            String placeFromId = request.getParameter( IN_PARAM_PLACE_FROM );
            String dateTo = request.getParameter( IN_PARAM_DATE_TO );
            String placeToId = request.getParameter( IN_PARAM_PLACE_TO );
            
            manager.searchCars( 
                    Date.valueOf( dateFrom ), 
                    Date.valueOf( dateTo ), 
                    Long.valueOf( placeFromId ), 
                    Long.valueOf( placeToId ) );

            manager.reinit( request );
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

}
