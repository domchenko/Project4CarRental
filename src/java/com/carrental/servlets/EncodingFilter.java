/*
 * EncodingFilter
 *
 * Version 1
 */
package com.carrental.servlets;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Makes all requests and responses into encoding UTF8
 * 
 * @author Tanya Domchenko
 * @version 1, 22 Jan 2016
 */
public class EncodingFilter implements Filter {
    
    private FilterConfig filterConfig = null;
    private String encoding = "";

    /**
     * Sets request and response encoding
     * 
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        String currentEncoding = request.getCharacterEncoding();        
        if ( !encoding.equalsIgnoreCase( currentEncoding ) ) {
            request.setCharacterEncoding( encoding );
            response.setCharacterEncoding( encoding );
        }
        chain.doFilter( request, response );
    }

    /**
     * Loads default encoding from the configuration file
     * 
     * @param filterConfig The filter initialization data 
     * @throws ServletException if a servlet error occurs
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        this.encoding = filterConfig.getInitParameter( "defaultEncoding" );
    }

    @Override
    public void destroy() {
        
    }
    
}
