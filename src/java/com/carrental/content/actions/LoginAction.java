/*
 * LoginAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.BaseState;
import com.carrental.content.viewstates.LogInState;
import com.carrental.db.dao.UserDAO;
import com.carrental.db.entities.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for user logging
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class LoginAction implements Action {
    // messages that indicate wrong login or password
    private static final String MSG_LOGIN_EMPTY = "errormsg.logIn.loginEmpty";
    private static final String MSG_PASSWORD_EMPTY = "errormsg.logIn.passwordEmpty";
    private static final String MSG_USER_NOT_FOUND = "errormsg.logIn.notFound";
    
    private static final Logger LOGGER = LogManager.getLogger( LoginAction.class.getName() );
    
    /**
     * Checks if there is a user with given login and password in the database
     * If login and password are correct - loads this user and sets as a current user
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new LogInState( manager ) ); 

            if ( manager.getUser() == null 
                    && request.getParameter( IN_PARAM_LOGGED ) != null ) {
                String login = request.getParameter( IN_PARAM_LOGIN );
                String password = request.getParameter( IN_PARAM_PASSWORD );                       

                if ( login.isEmpty() ) {
                    s.setAttribute( PARAM_ERRORMSG_LOGIN, MSG_LOGIN_EMPTY );
                }
                else {
                    if ( password.isEmpty() ) {
                        s.setAttribute( PARAM_ERRORMSG_LOGIN, MSG_PASSWORD_EMPTY );
                    }
                    else {
                        UserDAO ud = new UserDAO();
                        User u = ud.getUser( login, password );
                        if ( u != null ) {
                            manager.setUser( u );
                            manager.setCurrentState( new BaseState( manager ) );                        
                        }
                        else {
                            s.setAttribute( PARAM_ERRORMSG_LOGIN, MSG_USER_NOT_FOUND );
                        }
                    }
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
