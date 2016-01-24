/*
 * ViewApplicationsAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import static com.carrental.content.actions.Action.PARAM_USERCABINET_MSG;
import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.ApplicationsState;
import com.carrental.content.viewstates.UserCabinetState;
import com.carrental.content.viewstates.ViewOrderState;
import com.carrental.db.dao.ApplicationDAO;
import com.carrental.db.dao.OrderDAO;
import com.carrental.db.entities.Application;
import com.carrental.db.entities.ApplicationStateEnum;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for viewing applications
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ViewApplicationsAction implements Action {
    // input parameters
    private static final String IN_PARAM_ACTIVE_STATE = "app_stateid_active";
    
    private static final String BTN_APPLICATION_CANCEL = "cancelApplication";
    private static final String BTN_APPLICATION_CONFIRM = "confirmApplication";
    private static final String BTN_APPLICATION_REJECT = "rejectApplication";
    private static final String BTN_VIEW_ORDER = "viewOrder";
    
    // result messages
    private static final String MSG_CANCEL_ERROR = "errormsg.editApplication.cancel";
    private static final String MSG_CONFIRM_ERROR = "errormsg.editApplication.confirm";
    private static final String MSG_REJECT_ERROR = "errormsg.editApplication.reject";

    private static final Logger LOGGER = LogManager.getLogger( ViewApplicationsAction.class.getName() );
    
    /**
     * Allows to view applications and change their states
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new ApplicationsState( manager ) );
            
            String activeState = request.getParameter( IN_PARAM_ACTIVE_STATE );
            
            String param;
            // view order
            if ( ( param = request.getParameter( BTN_VIEW_ORDER ) ) != null 
                    && Long.valueOf( param ) > 0 ) {
                manager.viewOrderByApplication( Long.valueOf( param ) );
                manager.setCurrentState( new ViewOrderState( manager ) );
            }
            // modify application
            if ( ( param = request.getParameter( BTN_APPLICATION_CANCEL ) ) != null 
                    && Long.valueOf( param ) > 0 ) {
                if ( !changeApplicationState( 
                        Long.valueOf( param ),
                        ApplicationStateEnum.CANCELED,
                        null ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_CANCEL_ERROR );           
                }                                
            }
            if ( ( param = request.getParameter( BTN_APPLICATION_CONFIRM ) ) != null
                    && Long.valueOf( param ) > 0 ) {
                if ( !confirmApplication( 
                        Long.valueOf( param ),
                        request.getParameter( "note" + param ) ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_CONFIRM_ERROR );   
                }
            }
            if ( ( param = request.getParameter( BTN_APPLICATION_REJECT ) ) != null
                    && Long.valueOf( param ) > 0 ) {
                if ( !changeApplicationState( 
                        Long.valueOf( param ),
                        ApplicationStateEnum.REJECTED,
                        request.getParameter( "note" + param ) ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_REJECT_ERROR );   
                }
            }
            
            // update applications data
            if ( manager.getCurrentState() instanceof ApplicationsState ) {
                ApplicationStateEnum state = null;
                if ( activeState != null && !activeState.isEmpty() ) {
                    state = ApplicationStateEnum.get( Integer.valueOf( activeState ) );
                    s.setAttribute( IN_PARAM_ACTIVE_STATE, activeState );
                }
                if ( manager.getUser().getIsAdmin() ) {
                    manager.loadApplications( state != null ? state : ApplicationStateEnum.NEW );
                }
                else {
                    manager.loadUserApplications( state != null ? state : ApplicationStateEnum.NEW );
                }
            }
            
            manager.reinit( request );
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

    /**
     * Sets the application state to <code>newState</code>
     * 
     * @param id the application id
     * @param newState the new application state
     * @param note the application note
     * @return <code>true</code> if OK
     */
    private boolean changeApplicationState( long id, 
        ApplicationStateEnum newState, String note ) {
        ApplicationDAO ad = new ApplicationDAO();
        return ad.updateApplicationState( id, newState.getId(), note );
    } 
    
    /**
     * Changes the application state, creates a new order and a new payment
     * 
     * @param applicationId the application id
     * @param note the application note
     * @return <code>true</code> if OK
     */
    private boolean confirmApplication( long applicationId, String note ) {
        OrderDAO od = new OrderDAO();
        ApplicationDAO ad = new ApplicationDAO();
        Application app = ad.getApplication( applicationId );
        return od.createOrder( 
                applicationId,
                app.getSumm(),
                note ) > 0;
    }
}
