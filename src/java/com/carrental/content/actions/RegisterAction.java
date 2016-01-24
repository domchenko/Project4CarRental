/*
 * RegisterAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.RegisterState;
import static com.carrental.content.actions.Action.PARAM_MANAGER;
import com.carrental.content.viewstates.BaseState;
import com.carrental.db.dao.UserDAO;
import com.carrental.db.entities.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for registering a new user
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class RegisterAction implements Action {
    // messages that indicate wrong login or password
    private static final String MSG_ACCOUNT_EXISTS = "errormsg.register.accountExists";
    private static final String MSG_REGISTRATION_ERROR = "errormsg.register.failed";
    private static final String MSG_LOGIN_EMPTY = "errormsg.logIn.loginEmpty";
    private static final String MSG_PASSWORD_EMPTY = "errormsg.logIn.passwordEmpty";
    private static final String MSG_PASSWORDS_DIFFERENT = "errormsg.register.passwordsNotEqual";
    
    private static final Logger LOGGER = LogManager.getLogger( RegisterAction.class.getName() );
   
    /**
     * Checks if there is a user with given login and password in the database
     * If there is no user - register a new user and sets him as a current user
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new RegisterState( manager ) ); 

            if ( manager.getUser() == null 
                    && request.getParameter( IN_PARAM_REGISTERED ) != null ) {
                String login = request.getParameter( IN_PARAM_LOGIN );
                String password = request.getParameter( IN_PARAM_PASSWORD );
                String passwordConfirm = request.getParameter( IN_PARAM_PASSWORDCONFIRM );

                if ( verify( s, login, password, passwordConfirm ) ) {
                    UserDAO ud = new UserDAO();
                    // checks if login is already used
                    if ( ud.isRegistered( login ) ) {
                        s.setAttribute( PARAM_ERRORMSG_REG, MSG_ACCOUNT_EXISTS );
                    }
                    else {
                        // add new user
                        if ( ud.insert( login, password, false ) ) {
                            User u = ud.getUser( login, password );
                            manager.setUser( u );
                            manager.setCurrentState( new BaseState( manager ) );
                        }
                        else {
                            s.setAttribute( PARAM_ERRORMSG_REG, MSG_REGISTRATION_ERROR );
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
    
    private boolean verify( HttpSession session, 
            String login, String pass, String passConfirm ) {
        if ( login.isEmpty() ) {
            session.setAttribute( PARAM_ERRORMSG_REG, MSG_LOGIN_EMPTY );
            return false;
        }
        if ( pass.isEmpty() ) {
            session.setAttribute( PARAM_ERRORMSG_REG, MSG_PASSWORD_EMPTY );
            return false;
        }
        if ( !pass.equals( passConfirm ) ) {
            session.setAttribute( PARAM_ERRORMSG_REG, MSG_PASSWORDS_DIFFERENT );
            return false;
        }
        return true;
    }

}
