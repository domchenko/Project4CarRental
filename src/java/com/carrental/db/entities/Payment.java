/*
 * Payment
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.db.dao.OrderDAO;
import java.sql.Date;

/**
 * Describes the entity of the payment object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class Payment {
    private long id;                // the payment unique identifier
    private long idClient;          // the customer/client identifier
    private float sum;              // the sum to pay
    private String currencyCode;    // the currency code
    private Date dateOpen;          // the date when the payment was created
    private Date dateClose;         // the date when the payment was paid
    private String note;            // the payment additional information
                                    // such as bank, account number, MFI, purpose
    
    private Order order;            // the order linked with this payment
    
    /**
     * Class constructor specifying all object properties
     * 
     * @param id        the payment unique identifier
     * @param idClient  the customer identifier
     * @param sum       the sum of the payment
     * @param currencyCode  the currency code
     * @param dateOpen  the date payment was created
     * @param dateClose the date payment was paid
     * @param note      the payment additional information
     */
    public Payment( long id, long idClient, float sum, String currencyCode,
            Date dateOpen, Date dateClose, String note ) {
        this.id = id;
        this.idClient = idClient;
        this.sum = sum;
        this.currencyCode = currencyCode;
        this.dateOpen = dateOpen;
        this.dateClose = dateClose;
        this.note = note;
    }
    
    /**
     * Gets this payment unique identifier
     * 
     * @return payment id
     */
    public long getId() {
        return id;
    }
    
    /**
     * Sets this payment unique identifier with the given long value
     * 
     * @param id an unique identifier
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets the client identifier of this payment
     * 
     * @return the client identifier
     */
    public long getIdClient() {
        return idClient;
    }

    /**
     * Sets the client identifier with given value
     * 
     * @param idClient the client identifier to set
     */
    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    /**
     * Gets the payment amount
     * 
     * @return the sum of the payment
     */
    public float getSum() {
        return sum;
    }

    /**
     * Sets the payment amount with given float value
     * 
     * @param sum the sum of the payment to set
     */
    public void setSum(float sum) {
        this.sum = sum;
    }

    /**
     * Gets the currency of this payment
     * 
     * @return the currency code
     */
    public String getCurrencyCode() {
        return currencyCode;
    }

    /**
     * Sets the currency of this payment with the given value
     * 
     * @param currencyCode the currency code to set
     */
    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    /**
     * Gets the date of payment creation
     * 
     * @return the date of creation
     */
    public Date getDateOpen() {
        return dateOpen;
    }

    /**
     * Sets the date of creation of this payment with the given Date value
     * 
     * @param dateOpen the date to set
     */
    public void setDateOpen(Date dateOpen) {
        this.dateOpen = dateOpen;
    }

    /**
     * Gets the date of payment
     * 
     * @return the date of payment
     */
    public Date getDateClose() {
        return dateClose;
    }

    /**
     * Sets the date of payment with the given Date value
     * 
     * @param dateClose the date to set
     */
    public void setDateClose(Date dateClose) {
        this.dateClose = dateClose;
    }

    /**
     * Gets the payment note
     * 
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * Sets this payment note with the given value
     * 
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }


    /**
     * Gets the linked order
     * 
     * @return the order
     */
    public Order getOrder() {
        if ( order == null ) {
            OrderDAO od = new OrderDAO();
            order = od.getOrderByPayment( getId() );
        }
        return order;
    }

}
