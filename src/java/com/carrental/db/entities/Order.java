/*
 * Order
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.db.dao.ApplicationDAO;
import com.carrental.db.dao.OrderStateDAO;
import com.carrental.db.dao.PaymentDAO;
import java.util.List;

/**
 * Describes the entity of the order object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class Order {
    private long idApplication; // the application identifier
    private long idPayment;     // the payment identifier
    private long idState;       // the status of the order at the current moment
    
    private Application application;    // the linked application
    private OrderState state;           // the order status loaded by <code>idState</code>
    
    /** Class constructor specifying all object properties
     * 
     * @param idApplication the application identifier
     * @param idPayment     the payment identifier 
     * @param idState       the current order state identifier
     */
    public Order( long idApplication, long idPayment, long idState ) {        
        this.idPayment = idPayment;
        this.idApplication = idApplication;
        this.idState = idState;
    }

    /**
     * Gets the application identifier of this order
     * 
     * @return the application id
     */
    public long getIdApplication() {
        return idApplication;
    }

    /**
     * Sets the application identifier of this order
     * 
     * @param idApplication the application id to set
     */
    public void setIdApplication(long idApplication) {
        this.idApplication = idApplication;
    }

    /**
     * Gets the payment identifier of this order
     * 
     * @return the payment id
     */
    public long getIdPayment() {
        return idPayment;
    }

    /**
     * Sets the payment identifier of this order
     * 
     * @param idPayment the payment id to set
     */
    public void setIdPayment(long idPayment) {
        this.idPayment = idPayment;
    }

    /**
     * Gets the order state identifier
     * 
     * @return the state id
     */
    public long getIdState() {
        return idState;
    }

    /**
     * Sets the order state identifier
     * 
     * @param idState the state id to set
     */
    public void setIdState(long idState) {
        this.idState = idState;
    }

    /**
     * Gets the order state
     * 
     * @return the state
     */
    public OrderState getState() {
        if ( state == null || idState != state.getId() ) {
            OrderStateDAO osd = new OrderStateDAO();
            state = osd.getState( idState );
        }
        return state;
    }

    /**
     * Sets the order state
     * 
     * @param state the state to set
     */
    public void setState(OrderState state) {
        this.state = state;
        this.idState = state.getId();
    }
    
    /**
     * Returns all payments of this order (for rent and repair)
     * 
     * @return all payments 
     */
    public List<Payment> getPayments() {
        PaymentDAO pd = new PaymentDAO();
        return pd.getOrderPayments( idApplication );
    }
    
    /**
     * Gets the linked application
     * 
     * @return the application of this order
     */
    public Application getApplication() {
        if ( application == null ) {
            ApplicationDAO ad = new ApplicationDAO();
            application = ad.getApplication( idApplication );
        }
        return application;
    }
}
