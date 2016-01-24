/*
 * RentAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import static com.carrental.content.actions.Action.PARAM_MANAGER;
import com.carrental.content.viewstates.UserCabinetState;
import com.carrental.db.dao.ApplicationDAO;
import com.carrental.db.entities.ApplicationStateEnum;
import java.sql.Date;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for rent a vehicle
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class RentAction implements Action {
    private static final Logger LOGGER = LogManager.getLogger( RentAction.class.getName() );
    
    // the result messages
    private static final String MSG_APPLICATION_SEND_FAILED = "errormsg.userCabinet.sendApplication";
    private static final String MSG_APPLICATION_SEND_OK = "confirmmsg.userCabinet.sendApplication";

    /**
     * Creates a new application with data filled up in the form for searching a car
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new UserCabinetState( manager ) );

            long carId = Long.valueOf( request.getParameter( IN_PARAM_RENT_CAR_ID ) );

            ApplicationDAO ad = new ApplicationDAO();
            boolean b = ad.insert( 
                    manager.getUser().getId(), 
                    carId, 
                    manager.getPeriodBegin(), 
                    manager.getPeriodEnd(), 
                    manager.getTakePlace(), 
                    manager.getReturnPlace(), 
                    new Date( Calendar.getInstance().getTime().getTime() ), 
                    ApplicationStateEnum.NEW.getId(), 
                    "" );

            if ( b ) {
                s.setAttribute( PARAM_USERCABINET_MSG, MSG_APPLICATION_SEND_OK );
            }
            else {
                s.setAttribute( PARAM_USERCABINET_MSG, MSG_APPLICATION_SEND_FAILED );
            }

            manager.reinit( request );
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

}
