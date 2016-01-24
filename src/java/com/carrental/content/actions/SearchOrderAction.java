/*
 * SearchOrderAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import static com.carrental.content.actions.Action.PARAM_MANAGER;
import static com.carrental.content.actions.Action.PARAM_USERCABINET_MSG;
import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.SearchOrderState;
import com.carrental.content.viewstates.UserCabinetState;
import com.carrental.content.viewstates.ViewOrderState;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for searching the order
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class SearchOrderAction implements Action {
    // input parameters
    private static final String BTN_SEARCH_APPLICATION = "searchApplication";
    private static final String IN_PARAM_APP_ID = "applicationNumber";
    
    // result messages
    private static final String MSG_NUMBER_EMPTY = "errormsg.searchOrder.empty";

    private static final Logger LOGGER = LogManager.getLogger( SearchAction.class.getName() );
    
    /**
     * Searches for an order by given application number
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new SearchOrderState( manager ) );
            
            // search order form
            if ( request.getParameter( BTN_SEARCH_APPLICATION ) != null ) {
                String appId = request.getParameter( IN_PARAM_APP_ID );
                if ( appId != null && !appId.isEmpty() && Long.valueOf( appId ) > 0 ) {
                    manager.viewOrderByApplication( Long.valueOf( appId ) );
                    manager.setCurrentState( new ViewOrderState( manager ) );
                }
                else {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_NUMBER_EMPTY );
                }
            }
            manager.reinit( request );
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

}
