/*
 * Application
 *
 * Version 1
 */
package com.carrental.db.entities;

import com.carrental.db.dao.ApplicationStateDAO;
import com.carrental.db.dao.CarDAO;
import com.carrental.db.dao.ClientDAO;
import com.carrental.db.dao.OrderDAO;
import com.carrental.db.dao.PlaceDAO;
import java.util.Calendar;
import java.sql.Date;

/**
 * Describes the entity of the customer application object in the database
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class Application {
    private long id;            // the application unique identifier
    private long idClient;      // the client identifier (user who filled up passport data)
    private long idCar;         // the car identifier
    private Date dateFrom;      // the beginning of the lease
    private Date dateTo;        // the end of the lease
    private long idPlaceFrom;   // the pick-up point
    private long idPlaceTo;     // the return point
    private Date dateOperation; // the application filling date
    private long idState;       // the application state identifier
    private String note;        // the application note (filling by administrator)
    
    private ApplicationState state; // the linked aplication state
    private Car car;                // the linked car
    private Place placeFrom;    // the linked pick-up place    
    private Place placeTo;      // the linked return place 
    private Order order;        // the linked order
    private Client client;      // the client passport data
    
    /**
     * Class constructor specifying all object properties
     * 
     * @param id        the unique identifier 
     * @param idClient  the client identifier
     * @param idCar     the car identifier
     * @param dateFrom  the start of the lease
     * @param dateTo    the end of the lease
     * @param idPlaceFrom   the pick-up place identifier
     * @param idPlaceTo the return place identifier
     * @param dateOperation the application filling date
     * @param idState   the application status identifier
     * @param note      the note to this application by administrator
     */
    public Application( long id, long idClient, long idCar,
        Date dateFrom, Date dateTo, long idPlaceFrom, long idPlaceTo,
        Date dateOperation, long idState, String note ) {
        this.id = id;
        this.idClient = idClient;
        this.idCar = idCar;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.idPlaceFrom = idPlaceFrom;
        this.idPlaceTo = idPlaceTo;
        this.dateOperation = dateOperation;
        this.idState = idState;
        this.note = note;
    }
    
    /**
     * Gets this application unique identifier
     * 
     * @return the id
     */
    public long getId() {
        return id;
    }
    
    /**
     * Sets this application unique identifier by given long value
     * 
     * @param id 
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Gets the client identifier of this application
     * 
     * @return the client identifier
     */
    public long getIdClient() {
        return idClient;
    }

    /**
     * Sets this application client identifier by given long value
     * 
     * @param idClient the client identifier to set
     */
    public void setIdClient(long idClient) {
        this.idClient = idClient;
    }

    /**
     * Gets the car identifier
     * 
     * @return the car identifier
     */
    public long getIdCar() {
        return idCar;
    }

    /**
     * Sets this application car identifier by given long value
     * 
     * @param idCar the car identifier to set
     */
    public void setIdCar(long idCar) {
        this.idCar = idCar;
    }

    /**
     * Gets the start of the lease a car
     * 
     * @return the period begin
     */
    public Date getDateFrom() {
        return dateFrom;
    }

    /**
     * Sets the start of the lease a car by given Date value
     * 
     * @param dateFrom the period begin to set
     */
    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    /**
     * Gets the end of the lease a car
     * 
     * @return the period end
     */
    public Date getDateTo() {
        return dateTo;
    }

    /**
     * Sets the end of the lease a car by given Date value
     * 
     * @param dateTo the period end to set
     */
    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    /**
     * Gets the pick-up point identifier claimed in this application
     * 
     * @return the place identifier
     */
    public long getIdPlaceFrom() {
        return idPlaceFrom;
    }

    /**
     * Sets this application pick-up point identifier by given long value
     * 
     * @param idPlaceFrom the place identifier to set
     */
    public void setIdPlaceFrom(long idPlaceFrom) {
        this.idPlaceFrom = idPlaceFrom;
    }

    /**
     * Gets the return point identifier claimed in this application
     * 
     * @return the place identifier
     */
    public long getIdPlaceTo() {
        return idPlaceTo;
    }

    /**
     * Sets this application return place identifier by given long value
     * 
     * @param idPlaceTo the place identifier to set
     */
    public void setIdPlaceTo(long idPlaceTo) {
        this.idPlaceTo = idPlaceTo;
    }

    /**
     * Gets this application filling date
     * 
     * @return the date of the filling
     */
    public Date getDateOperation() {
        return dateOperation;
    }

    /**
     * Sets this application filling date
     * 
     * @param dateOperation the date of the filling to set
     */
    public void setDateOperation(Date dateOperation) {
        this.dateOperation = dateOperation;
    }

    /**
     * Gets this application status identifier
     * 
     * @return the state identifier
     */
    public long getIdState() {
        return idState;
    }

    /**
     * Sets this application state identifier by given long value
     * 
     * @param idState the state identifier to set
     */
    public void setIdState(long idState) {
        this.idState = idState;
    }

    /**
     * Gets this application note
     * 
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * Sets the note of this application
     * 
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * Gets the state of this application
     * 
     * @return the state 
     */
    public ApplicationState getState() {
        if ( state == null || idState != state.getId() ) {
            ApplicationStateDAO asd = new ApplicationStateDAO();
            state = asd.getState( idState );
        }
        return state;
    }

    /**
     * Sets the state of this application
     * 
     * @param state the state to set
     */
    public void setState(ApplicationState state) {
        this.state = state;
        this.idState = state.getId();
    }

    /**
     * Gets the car specified in this application
     * 
     * @return the car 
     */
    public Car getCar() {
        if ( car == null || idCar != car.getId() ) {
            CarDAO cd = new CarDAO();
            car = cd.getCar( idCar );
        }
        return car;
    }

    /**
     * Sets the car for rent
     * 
     * @param car the car to set
     */
    public void setCar(Car car) {
        this.car = car;
        this.idCar = car.getId();
    }

    /**
     * Gets the pick-up point
     * 
     * @return the pick-up place 
     */
    public Place getPlaceFrom() {
        if ( placeFrom == null || idPlaceFrom != placeFrom.getId() ) {
            PlaceDAO pd = new PlaceDAO();
            placeFrom = pd.getPlace( idPlaceFrom );
        }
        return placeFrom;
    }

    /**
     * Sets the pick-up point
     * 
     * @param placeFrom the place to set
     */
    public void setPlaceFrom(Place placeFrom) {
        this.placeFrom = placeFrom;
        this.idPlaceFrom = placeFrom.getId();
    }

    /**
     * Gets the return point
     * 
     * @return the return place
     */
    public Place getPlaceTo() {        
        if ( placeTo == null || idPlaceTo != placeTo.getId() ) {
            PlaceDAO pd = new PlaceDAO();
            placeTo = pd.getPlace( idPlaceTo );
        }
        return placeTo;
    }

    /**
     * Sets the return point
     * 
     * @param placeTo the place to set
     */
    public void setPlaceTo(Place placeTo) {
        this.placeTo = placeTo;
        this.idPlaceTo = placeTo.getId();
    }
    
    /**
     * Calculates the sum of the lease for the entire period
     * 
     * @return the total sum 
     */
    public float getSumm() {
        int days = getDaysCount( dateFrom, dateTo );  
        return days * getCar().getPrice();
    }
    
    /**
     * Calculates the number of rental days
     * 
     * @param periodBegin the period begin
     * @param periodEnd the period end
     * @return  the number of days
     */
    public static int getDaysCount( Date periodBegin, Date periodEnd ) {
        Calendar date1 = Calendar.getInstance();
        date1.setTime( periodBegin );
        Calendar date2 = Calendar.getInstance();
        date2.setTime( periodEnd );
        date2.add( Calendar.MILLISECOND, 1 );
        int days = 0;  
        while ( date1.before( date2 ) ) {  
          date1.add( Calendar.DAY_OF_MONTH, 1 );  
          days++;  
        }  
        return days;
    }

    /**
     * Gets the linked order 
     * 
     * @return the order
     */
    public Order getOrder() {
        if ( order == null ) {
            OrderDAO od = new OrderDAO();
            order = od.getOrderByApplication( getId() );
        }
        return order;
    }
    
    /**
     * Gets the linked client data
     * 
     * @return the client
     */
    public Client getClient() {
        if ( client == null ) {
            ClientDAO cd = new ClientDAO();
            client = cd.getClient( getIdClient() );
        }
        return client;
    }
}
