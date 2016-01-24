/*
 * MultiLangPropertyTag
 *
 * Version 1
 */
package com.carrental.mytag;

import com.carrental.servlets.LangType;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import org.apache.logging.log4j.LogManager;

/**
 * Retrieves the value of the multilingual object property
 * The property must be declared as public and starts with <code>get</code>
 * The prefix <code>get-</code> is omitted in the attribute assigning
 * 
 * @author Tanya Domchenko
 */
public class MultiLangPropertyTag extends SimpleTagSupport {
    private LangType lang;      // the property language
    private String propName;    // the property name
    private Object obj;         // the object
    
    private static final org.apache.logging.log4j.Logger LOGGER = 
            LogManager.getLogger( MultiLangPropertyTag.class.getName() );

    /**
     * Sets the tag language attribute
     * 
     * @param lang the property language
     */
    public void setLang( LangType lang ) {
        this.lang = lang;
    }

    /**
     * Sets the property name
     * 
     * @param propName the name of the property
     */
    public void setPropName( String propName ) {
        this.propName = propName;
    }

    /**
     * Sets the object
     * 
     * @param obj the object 
     */
    public void setObj( Object obj ) {
        this.obj = obj;
    }

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() {
        JspWriter out = getJspContext().getOut();
        
        try {
            String propValue = "";
            if ( obj != null ) {                
                // property name ougth to starts with get
                propName = "get" + propName.toLowerCase();
                for ( Method method : obj.getClass().getDeclaredMethods() ) {
                    if ( Modifier.isPublic( method.getModifiers() ) 
                            && method.getParameterTypes().length == 1
                            && method.getReturnType() == String.class
                            && ( method.getName().equalsIgnoreCase( propName ) ) ) {
                        Object value = method.invoke( obj, lang );
                        if ( value != null ) {
                            propValue += (String) value;
                        }
                    }
                }
            }
            out.print( propValue );        
        } catch ( java.io.IOException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex ) {
            LOGGER.error( ex );
        }
    }
    
}
