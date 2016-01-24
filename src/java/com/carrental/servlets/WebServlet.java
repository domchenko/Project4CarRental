/*
 * WebServlet
 *
 * Version 1
 */
package com.carrental.servlets;

import com.carrental.content.actions.ActionFactory;
import com.carrental.content.service.ContentManager;
import com.carrental.content.actions.Action;
import static com.carrental.content.actions.Action.PARAM_MANAGER;
import com.carrental.content.service.PageConfigManager;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Controller of the web application, processes request and creates pages
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class WebServlet extends HttpServlet {
    private static final Logger LOGGER = LogManager.getLogger( WebServlet.class.getName() );

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession s = request.getSession();
        s.setAttribute( "initPath", request.getContextPath() );
        ActionFactory factory = new ActionFactory();
        Action action = factory.defineAction( request );
        if ( action == null ) {
            goToErrorPage( request, response );
        }
        else {
            ContentManager manager = action.execute( request );
            if ( manager != null ) {
                s.setAttribute( PARAM_MANAGER, manager );
            }

            if ( manager != null && !manager.getNextPage().isEmpty() ) {
                RequestDispatcher rd = request.getRequestDispatcher( manager.getNextPage() );
                rd.forward( request, response );
            } 
            else {
                goToErrorPage( request, response );
            }
        }
    }
    
    private void goToErrorPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            String page = PageConfigManager.getPagePath( "pagepath.error" );            
            response.sendRedirect( request.getContextPath() + page );
        } catch ( IOException e ) {
            LOGGER.error( e );
        }        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
