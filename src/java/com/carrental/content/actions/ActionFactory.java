/*
 * ActionFactory
 *
 * Version 1
 */
package com.carrental.content.actions;

import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * A factory of the commands/actions
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ActionFactory {
    // action name parameter
    private static final String ACTION_NAME = "act";
    
    private static final Logger LOGGER = LogManager.getLogger( ActionFactory.class.getName() );
    
    /**
     * Defines an action by the input parameter
     * 
     * @param request the servlet request 
     * @return the action
     */
    public Action defineAction( HttpServletRequest request ){
       Action current = null;
       String action = request.getParameter( ACTION_NAME );

       try {
           ActionType actionType = ActionType.valueOf( action.toUpperCase() );
           current = actionType.getActionType();
       } catch( IllegalArgumentException e ){
           LOGGER.error( e );
       }
       return current;
    }

}
