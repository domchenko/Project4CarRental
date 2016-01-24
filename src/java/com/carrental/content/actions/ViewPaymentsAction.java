/*
 * ViewPaymentsAction
 *
 * Version 1
 */
package com.carrental.content.actions;

import com.carrental.content.service.ContentManager;
import com.carrental.content.viewstates.PaymentsState;
import com.carrental.content.viewstates.UserCabinetState;
import com.carrental.content.viewstates.ViewOrderState;
import com.carrental.db.dao.OrderDAO;
import com.carrental.db.dao.PaymentDAO;
import com.carrental.db.entities.OrderStateEnum;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Provides a procedure for viewing payments
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ViewPaymentsAction implements Action {
    // input parameters
    private static final String IN_PARAM_ACTIVE_STATE = "payment_stateid_active";
    
    private static final String BTN_VIEW_ORDER = "viewOrder";
    private static final String BTN_PAYMENT_CONFIRM = "confirmPayment";
    private static final String BTN_PAYMENT_REJECT = "rejectPayment";
    private static final String BTN_REPAIR_PAID = "repairPayment";
    
    // result messages
    private static final String MSG_CONFIRM_ERROR = "errormsg.editPayment.confirm";
    private static final String MSG_REJECT_ERROR = "errormsg.editPayment.reject";
    
    private static final Logger LOGGER = LogManager.getLogger( ViewPaymentsAction.class.getName() );

    /**
     * Allows to view payments and change the states of the linked orders
     * 
     * @param request the servlet request 
     * @return the service object
     */
    @Override
    public ContentManager execute(HttpServletRequest request) {
        try {
            HttpSession s = request.getSession();
            ContentManager manager = (ContentManager) s.getAttribute( PARAM_MANAGER );        
            manager.setCurrentState( new PaymentsState( manager ) );
            
            String param;
            // view order details
            if ( ( param = request.getParameter( BTN_VIEW_ORDER ) ) != null 
                    && Long.valueOf( param ) > 0 ) {
                manager.viewOrderByApplication( Long.valueOf( param ) );
                manager.setCurrentState( new ViewOrderState( manager ) );
            }
            // modify payment
            if ( ( param = request.getParameter( BTN_PAYMENT_CONFIRM ) ) != null
                    && Long.valueOf( param ) > 0 ) {
                if ( !confirmPayment( Long.valueOf( param ) ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_CONFIRM_ERROR );                
                }             
            }
            if ( ( param = request.getParameter( BTN_PAYMENT_REJECT ) ) != null
                    && Long.valueOf( param ) > 0 ) {
                if ( !rejectPayment( 
                        Long.valueOf( param ),
                        manager.getMessages().get( "errormsg.order.unpaid" ) ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_REJECT_ERROR );                
                }            
            }
            if ( ( param = request.getParameter( BTN_REPAIR_PAID ) ) != null
                    && Long.valueOf( param ) > 0 ) {
                PaymentDAO pd = new PaymentDAO();
                if ( !pd.setAsPaid( Long.valueOf( param ) ) ) {
                    manager.setCurrentState( new UserCabinetState( manager ) );
                    s.setAttribute( PARAM_USERCABINET_MSG, MSG_CONFIRM_ERROR );                
                }             
            }
            
            // update payments data 
            if ( manager.getCurrentState() instanceof PaymentsState ) {
                param = request.getParameter( IN_PARAM_ACTIVE_STATE );
                OrderStateEnum state = null;
                if ( param != null && !param.isEmpty() ) {
                    state = OrderStateEnum.get( Integer.valueOf( param ) );
                    s.setAttribute( IN_PARAM_ACTIVE_STATE, param );
                }
                if ( manager.getUser().getIsAdmin() ) {
                    manager.loadPayments( state != null ? state : OrderStateEnum.NEW );
                }
                else {
                    manager.loadUserPayments( state != null ? state : OrderStateEnum.NEW );
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
     * Sets the order state to paid and closes the payment
     * 
     * @param paymentId the payment id
     * @return <code>true</code> if ok
     */
    private boolean confirmPayment( long paymentId ) {
        OrderDAO od = new OrderDAO();
        return od.confirmOrder( paymentId );
    }

    /**
     * Sets the order state to unpaid and sets the application state as rejected
     * 
     * @param paymentId the payment id
     * @param note the payment note
     * @return <code>true</code> if ok
     */
    private boolean rejectPayment( long paymentId, String note ) {
        OrderDAO od = new OrderDAO();
        return od.rejectOrder( paymentId, note );
    }

}
