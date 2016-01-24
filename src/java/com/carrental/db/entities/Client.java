/*
 * Client
 *
 * Version 1
 */
package com.carrental.db.entities;

import java.sql.Date;

/**
 * Describes the entity of the customer data in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class Client {
    private long idUser;        // the user identifier
    private String surname;     // the user surname
    private String firstName;   // the user first name
    private String secondName;  // the user second name
    private String passportNumber;  // the passport number
    private Date dateOfIssue;   // the passport issue date
    private Date validUntil;    // the passport expiry
    private String issuedBy;    // the passport issuing authority
    private Date birthday;      // the user birthday
    private String address;     // the user address

    /**
     * Default class constructor 
     */
    public Client() {
        
    }
    
    /**
     * Class constructor specifying all object properties
     * 
     * @param idUser            the user identifier
     * @param surname           the user surname on native language
     * @param firstName         the user first name 
     * @param secondName        the user second name
     * @param passportNumber    the user passport number
     * @param dateOfIssue       the passport date of issue
     * @param validUntil        the passport expiry
     * @param issuedBy          the passport issuing authority
     * @param birthday          the user birthday
     * @param address           the user address
     */
    public Client( long idUser, String surname, String firstName, String secondName,
        String passportNumber, Date dateOfIssue, Date validUntil, String issuedBy,
        Date birthday, String address ) {
        this.idUser = idUser;
        this.surname = surname;
        this.firstName = firstName;
        this.secondName = secondName;
        this.passportNumber = passportNumber;
        this.dateOfIssue = dateOfIssue;
        this.validUntil = validUntil;
        this.issuedBy = issuedBy;
        this.birthday = birthday;
        this.address = address;
    }
    
    /** 
     * Gets this user identifier
     * 
     * @return the user identifier
     */
    public Long getIdUser() {
        return idUser;
    }

    /**
     * Sets this user identifier with the given long value
     * 
     * @param idUser the user identifier to set
     */
    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    /**
     * Gets the user surname
     * 
     * @return the surname
     */
    public String getSurname() {
        return surname;
    }

    /**
     * Sets this user surname
     * 
     * @param surname the surname to set
     */
    public void setSurname(String surname) {
        this.surname = surname;
    }

    /**
     * Gets the user first name
     * 
     * @return the first name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets this user first name
     * 
     * @param firstName the first name to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Get the user second name 
     * 
     * @return the second name
     */
    public String getSecondName() {
        return secondName;
    }

    /**
     * Sets this user second name
     * 
     * @param secondName the second name to set
     */
    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    /**
     * Gets the passport number of the user
     * 
     * @return the passport number
     */
    public String getPassportNumber() {
        return passportNumber;
    }

    /**
     * Sets this user passport number like CCDDDDDD,
     * where CC - are letters and DDDDDD - are numbers
     * 
     * @param passportNumber the passport number to set
     */
    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    /**
     * Gets the date of issue of the user passport 
     * 
     * @return the date of issue
     */
    public Date getDateOfIssue() {
        return dateOfIssue;
    }

    /**
     * Sets the date of issue of the user passport
     * 
     * @param dateOfIssue the date to set
     */
    public void setDateOfIssue(Date dateOfIssue) {
        this.dateOfIssue = dateOfIssue;
    }

    /**
     * Gets the user passport expiry
     * 
     * @return the date valid to
     */
    public Date getValidUntil() {
        return validUntil;
    }

    /**
     * Sets the passport expiry date of the user passport
     * 
     * @param validUntil the date to set
     */
    public void setValidUntil(Date validUntil) {
        this.validUntil = validUntil;
    }

    /**
     * Gets the passport issuing authority
     * 
     * @return the authority name
     */
    public String getIssuedBy() {
        return issuedBy;
    }

    /**
     * Sets the passport issuing authority
     * 
     * @param issuedBy the name to set
     */
    public void setIssuedBy(String issuedBy) {
        this.issuedBy = issuedBy;
    }

    /**
     * Gets the user birthday
     * 
     * @return the birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * Sets this user birthday
     * 
     * @param birthday the date to set
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * Gets the user address
     * 
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * Sets this user address
     * 
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }
    
}
