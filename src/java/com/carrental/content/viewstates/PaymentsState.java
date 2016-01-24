/*
 * PaymentsState
 *
 * Version 1
 */
package com.carrental.content.viewstates;

import com.carrental.content.service.ContentManager;
import com.carrental.content.service.PageConfigManager;
import static com.carrental.content.viewstates.State.PARAM_CONTENT;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Configures the composite page for viewing payments:
 * - all payments - for administrator
 * - personal payments - for any registered user
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class PaymentsState extends State {

    /**
     * Default constructor
     * @param manager 
     */
    public PaymentsState(ContentManager manager) {
        super(manager);
    }

    /**
     * Defines the page components
     * 
     * @param request servlet request
     */
    @Override
    public void init(HttpServletRequest request) {
        pageName = PageConfigManager.getPagePath( "pagepath.main" );        
        HttpSession s = request.getSession();
        s.setAttribute( PARAM_CONTENT, PageConfigManager.getPagePath( "pagepath.cabinet" ) );
        s.setAttribute( PARAM_MENU_CONTENT, PageConfigManager.getPagePath( "pagepath.menu.payments" ) );  
        s.setAttribute( PARAM_MENU_MODE, true );
    }

}
