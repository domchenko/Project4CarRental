/*
 * ViewOrderAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import static com.carrental.content.actions.Action.PARAM_MANAGER;
import static com.carrental.content.actions.Action.PARAM_USERCABINET_MSG;
import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.UserCabinetState;
import com.carrental.content.viewstates.ViewOrderState;
import com.carrental.db.dao.OrderDAO;
import com.carrental.db.entities.OrderStateEnum;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for viewing order details
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ViewOrderAction implements Action {
    // input parameters
    private static final String BTN_CAR_GIVEOUT = "giveOutCar";
    private static final String BTN_CAR_RETURN = "returnCar";
    private static final String BTN_CAR_REPAIR = "repairCar";
    
    // result messages
    private static final String MSG_GIVEOUT_ERROR = "errormsg.editOrder.giveout";
    private static final String MSG_RETURN_ERROR = "errormsg.editOrder.return";
    private static final String MSG_REPAIR_ERROR = "errormsg.editOrder.repair";
    
    private static final Logger LOGGER = LogManager.getLogger( ViewOrderAction.class.getName() );

    /**
     * Shows the order data and allows to give out a car, return a car or add a payment for a car repair 
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new ViewOrderState( manager ) );
            
            long applicationId = 0;
            // modify order: give out a car
            String param = request.getParameter( BTN_CAR_GIVEOUT );
            if ( param != null && Long.valueOf( param ) > 0 ) {
                applicationId = Long.valueOf( param );
                if ( !changeOrderState( 
                        applicationId,
                        OrderStateEnum.EXECUTING,
                        0 ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_GIVEOUT_ERROR );                
                }            
            }
            // modify order: return a car
            param = request.getParameter( BTN_CAR_RETURN );
            if ( param != null && Long.valueOf( param ) > 0 ) {
                applicationId = Long.valueOf( param );
                if ( !changeOrderState( 
                        applicationId,
                        OrderStateEnum.DONE,
                        0 ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_RETURN_ERROR );                
                }            
            }
            // modify order: return a car and add a payment for repair
            param = request.getParameter( BTN_CAR_REPAIR );
            if ( param != null && Long.valueOf( param ) > 0 ) {
                applicationId = Long.valueOf( param );
                if ( !changeOrderState( 
                        applicationId,
                        OrderStateEnum.ACCIDENT,
                        Float.valueOf( request.getParameter( "damages" ) ) ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_REPAIR_ERROR );                
                }
            }
            
            // update order data
            if ( applicationId > 0 ) {
                manager.viewOrderByApplication( applicationId );
            } 
            manager.reinit( request );
            return manager;
        } catch ( Exception e ) {
            LOGGER.error( e );
        }
        return null;
    }

    /**
     * Updates order state
     * 
     * @param applicationId the application id
     * @param state the state to set
     * @param damageSum the sum of the repair
     * @return <code>true</code> if OK
     */
    private boolean changeOrderState( long applicationId, OrderStateEnum state,
            float damageSum ) {
        OrderDAO od = new OrderDAO();
        if ( state == OrderStateEnum.EXECUTING ) {
            return od.updateState( applicationId, state.getId() );
        }
        else {
            return od.closeOrder( applicationId, state.getId(), damageSum );
        }
    }
}
