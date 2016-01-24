/*
 * ContentManager
 *
 * Version 1
 */
package com.carrental.content.service;

import com.carrental.content.viewstates.BaseState;
import com.carrental.content.viewstates.State;
import com.carrental.db.dao.ApplicationDAO;
import com.carrental.db.dao.ApplicationStateDAO;
import com.carrental.db.dao.CarDAO;
import com.carrental.db.dao.CityDAO;
import com.carrental.db.dao.OrderDAO;
import com.carrental.db.dao.OrderStateDAO;
import com.carrental.db.dao.PaymentDAO;
import com.carrental.db.dao.PlaceDAO;
import com.carrental.db.entities.Application;
import com.carrental.db.entities.ApplicationState;
import com.carrental.db.entities.ApplicationStateEnum;
import com.carrental.db.entities.Car;
import com.carrental.db.entities.City;
import com.carrental.db.entities.Order;
import com.carrental.db.entities.OrderState;
import com.carrental.db.entities.OrderStateEnum;
import com.carrental.db.entities.Payment;
import com.carrental.db.entities.Place;
import com.carrental.db.entities.User;
import com.carrental.servlets.LangType;
import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;
import javax.servlet.http.HttpServletRequest;

/**
 * The service object that loads and provides all data needed for use on any page
 * This object is stored in the session
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class ContentManager {    
    private State currentState;     // the state: defines which page is need to be shown
    private LangType currentLang;   // the current language
    
    private List<City> cities;      // the list of the cities (all cities)
    private List<Place> places;     // the list of the parking places (all places)
    private List<ApplicationState> appStates;   // all application states
    private List<OrderState> orderStates;       // all order states
    private User user;              // the current user
    private Map<String,String> messages;        // all user messages 
    
    private Date periodBegin;       // the lease period begin (from a search car form) 
    private Date periodEnd;         // the lease period end (from a search car form)
    private long placeFromId;       // the pick-up car place (from a search car form)
    private long placeToId;         // the return car place (from a search car form) 
    
    private List<Car> cars;         // the list of the cars available to rent during the defined period
    private List<Application> applications;     // the list of the applications
                                    // all applications - for administrator,
                                    // own applications - for registered user)
    private List<Payment> payments; // the list of the payments
                                    // all payments - for administrator,
                                    // own payments - for registered user)
    
    private Order order;            // the order to view
    
    /**
     * Default constructor
     * Loads all cities, parking places, application and order states 
     */
    public ContentManager() {
        currentState = new BaseState( this );
        loadCities();
        loadPlaces();
        loadApplicationStates();
        loadOrderStates();
    }
    
    /**
     * Returns the current state (state configures the composite page)
     * @return 
     */
    public State getCurrentState() {
        return currentState;
    }

    /**
     * Sets the current state (state configures the composite page) with given value
     * 
     * @param currentState 
     */
    public void setCurrentState( State currentState ) {
        this.currentState = currentState;        
    }
    
    /**
     * Sets the current language with the given String value
     * 
     * @param lang the language name
     */
    public void setLang( String lang ) {        
        this.currentLang = LangType.valueOf( lang.toUpperCase() );
        loadMessages();      
    }
    
    /**
     * Returns the current language
     * @return 
     */
    public LangType getLang() {
        return currentLang;
    }
    
    /**
     * Returns the locale relevant to the current language
     * 
     * @return 
     */
    public Locale getLocale() {
        Locale l;
        switch ( currentLang ) {
            case UK: 
                l = new Locale( "uk", "UA" );
                break;
            default: l = new Locale( "en", "GB" );
        }
        return l;
    }
    
    /**
     * Configures the page components (defines page parts)
     * 
     * @param request the servlet request
     */
    public void reinit( HttpServletRequest request ) {
        currentState.init( request );
    }
    
    /**
     * Returns the path of the page that is going to be shown after executing the action
     * 
     * @return the page path
     */
    public String getNextPage() {
        return currentState.getNextPage();
    }
    
    /**
     * Loads all cities
     */
    private void loadCities() {
        CityDAO cd = new CityDAO();
        cities = cd.getCities();
    }
    
    /**
     * Loads all parking places
     */
    private void loadPlaces() {
        PlaceDAO pd = new PlaceDAO();
        places = pd.getPlaces();
    }
    
    /**
     * Loads all user messages
     */
    private void loadMessages() {
        messages = new HashMap<>();
        ResourceBundle resBundle = ResourceBundle.getBundle( 
                "com.carrental.locale.messages", getLocale() );
        for ( String key: resBundle.keySet() ) {
            messages.put( key, resBundle.getString( key ) );
        }
    }
    
    /**
     * Returns the list of the cities to be shown in the search car form
     * The cities are sorted by the name
     * 
     * @return 
     */
    public Map<Long,String> getCities() {
        Map<Long,String> map = new LinkedHashMap<>();
        List<City> orderedList = new LinkedList<>();
        if ( currentLang != LangType.EN ) {
            orderedList.addAll( cities );
            Collections.sort( orderedList, City.getComparatorUK() );
        }
        else {
            orderedList = cities;
        }
        for ( City c: orderedList ) {
            map.put( c.getId(), c.getName( currentLang ) );
        }
        return map;
    }
    
    /**
     * Returns the list of the parking places to be shown in the search car form
     * The places are sorted by the name
     * 
     * @return 
     */
    public Map<String,String> getPlaces() {
        Map<String,String> map = new LinkedHashMap<>();
        List<Place> orderedList = new LinkedList<>();
        if ( currentLang != LangType.EN ) {
            orderedList.addAll( places );
            Collections.sort( orderedList, Place.getComparatorUK() );
        }
        else {
            orderedList = places;
        }
        for ( Place p: orderedList ) {
            map.put( p.getIdCity() + "." + p.getId(), p.getName( currentLang ) );
        }
        return map;
    }

    /**
     * Returns the list of the user messages  
     * 
     * @return 
     */
    public Map<String,String> getMessages() {
        return messages;
    }
    
    /**
     * Returns the current registered user
     * 
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * Sets the current registered user with the given <code>user</code>
     * 
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }
    
    /**
     * Searches for available cars to rent
     * 
     * @param dateFrom the period begin
     * @param dateTo the period end
     * @param placeFromId the pick-up parking place   
     * @param placeToId the return parking place
     */
    public void searchCars( Date dateFrom, Date dateTo,
            long placeFromId, long placeToId ) {
        cars = null;
        this.periodBegin = dateFrom;
        this.periodEnd = dateTo;
        this.placeFromId = placeFromId;
        this.placeToId = placeToId;
        CarDAO cd = new CarDAO();
        this.cars = cd.getAvailableCars( placeFromId, dateFrom, dateTo );
    }
    
    /**
     * Returns list of the cars that are available to rent
     * 
     * @return the list of the cars
     */
    public List<Car> getCars() {
        return cars;
    }
    
    /**
     * Returns the start of the rental period specified in the form of a car search
     * 
     * @return the start of the period
     */
    public Date getPeriodBegin() {
        return periodBegin;
    }
    
    /**
     * Returns the end of the rental period specified in the form of a car search
     * 
     * @return the end of the period 
     */
    public Date getPeriodEnd() {
        return periodEnd;
    }
    
    /**
     * Returns the pick-up parking place specified in the form of a car search
     * 
     * @return the place id
     */
    public long getTakePlace() {
        return placeFromId;
    }
    
    /**
     * Returns the return parking place specified in the form of a car search
     * 
     * @return the place id
     */
    public long getReturnPlace() {
        return placeToId;
    }
    
    /**
     * Loads the user applications by given application state
     * 
     * @param state the application state
     */
    public void loadUserApplications( ApplicationStateEnum state ) {
        ApplicationDAO ad = new ApplicationDAO();
        applications = ad.getUserApplications( getUser().getId(), state.getId() );        
    }
    
    /**
     * Loads all applications by given application state
     * 
     * @param state the application state
     */
    public void loadApplications( ApplicationStateEnum state ) {
        ApplicationDAO ad = new ApplicationDAO();
        applications = ad.getApplications( state.getId() );
    }

    /**
     * Gets the loaded applications
     * 
     * @return the list of the applications
     */
    public List<Application> getApplications() {
        return applications;
    }
            
    /**
     * Loads the user payments by given order state
     * 
     * @param state the order state
     */
    public void loadUserPayments( OrderStateEnum state ) {
        PaymentDAO pd = new PaymentDAO();
        payments = pd.getUserPayments( getUser().getId(), state );        
    }
    
    /**
     * Loads all payments by given order state
     * 
     * @param state the order state
     */
    public void loadPayments( OrderStateEnum state ) {
        PaymentDAO pd = new PaymentDAO();
        payments = pd.getPayments( state );        
    }
    
    /**
     * Gets the loaded payments
     * 
     * @return the list of the payments
     */
    public List<Payment> getPayments() {
        return payments;
    }
    
    /**
     * Loads the order by an application number
     * 
     * @param applicationId  the application identifier
     */
    public void viewOrderByApplication( long applicationId ) {
        OrderDAO od = new OrderDAO();
        order = od.getOrderByApplication( applicationId );
    }
    
    /**
     * Gets the loaded order
     * 
     * @return the order
     */
    public Order getOrder() {
        return order;
    }
    
    /**
     * Loads all order states
     */
    private void loadOrderStates() {
        OrderStateDAO osd = new OrderStateDAO();
        orderStates = osd.getStates();        
    }
    
    /**
     * Returns all order states
     * 
     * @return the list of the order states 
     */
    public List<OrderState> getOrderStates() {
        return orderStates;
    }
    
    /**
     * Loads all application states
     */
    private void loadApplicationStates() {
        ApplicationStateDAO asd = new ApplicationStateDAO();
        appStates = asd.getStates();        
    }
    
    /**
     * Returns all application states
     * 
     * @return the list of the application states 
     */
    public List<ApplicationState> getAppStates() {
        return  appStates;
    }
}
