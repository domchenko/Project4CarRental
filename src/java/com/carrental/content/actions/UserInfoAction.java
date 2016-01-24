/*
 * UserInfoAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import static com.carrental.content.actions.Action.PARAM_MANAGER;
import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.UserCabinetState;
import com.carrental.content.viewstates.UserInfoState;
import com.carrental.db.dao.ClientDAO;
import com.carrental.db.entities.User;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for viewing user passport data
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class UserInfoAction implements Action {
    // input parameters
    private static final String BTN_INFO_SAVE = "userInfo";
    
    // result messages
    private static final String MSG_SAVE_FAILED = "errormsg.userInfo.save";
    
    private static final Logger LOGGER = LogManager.getLogger( UserInfoAction.class.getName() );

    /**
     * Allows to view and modify user passport data
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new UserInfoState( manager ) );
            manager.reinit( request );

            if ( request.getParameter( BTN_INFO_SAVE ) != null ) {
                User u = saveUser( manager.getUser(), request );
                if ( u != null ) {
                    manager.setUser( u );
                }
                else {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_SAVE_FAILED );
                }
            }
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

    /**
     * Updates the user passport data
     * 
     * @param user the current user
     * @param request the servlet request
     * @return the user object
     */
    private User saveUser( User user, HttpServletRequest request ) {
        ClientDAO cd = new ClientDAO();
        if ( cd.saveOrUpdate(
                user.getId(), 
                request.getParameter( "surname" ), 
                request.getParameter( "firstName" ), 
                request.getParameter( "secondName" ), 
                request.getParameter( "passportNumber" ), 
                castAsDate( request.getParameter( "dateOfIssue" ) ), 
                castAsDate( request.getParameter( "validUntil" ) ), 
                request.getParameter( "issuedBy" ), 
                castAsDate( request.getParameter( "birthday" ) ), 
                request.getParameter( "address" ) ) ) {
            user.setClient( cd.getClient( user.getId() ) );                
            return user;
        }
        else {
            return null;
        }
    }
    
    /**
     * Converts a string with date into the Date
     * 
     * @param value 
     * @return Date
     */
    private Date castAsDate( String value ) {
        Date date = null;
        if ( value != null && !value.isEmpty() ) {
            date = Date.valueOf( value );        
        }
        return date;
    }
}
