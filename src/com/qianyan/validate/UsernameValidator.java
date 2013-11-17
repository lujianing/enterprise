/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.qianyan.validate;
import com.opensymphony.xwork2.validator.ValidationException;
import com.opensymphony.xwork2.validator.validators.FieldValidatorSupport;
/**
 *
 * @author Administrator
 */
public class UsernameValidator extends FieldValidatorSupport
{

    public void validate(Object object) throws ValidationException
    {
        
        String fieldName=getFieldName();
    	String value = getFieldValue(fieldName, object).toString();

        if (value == null || value.length() <= 0)
        	addFieldError(fieldName, object);

        if(value.length()<5 || value.length()>50 )
            addFieldError(fieldName, object);

     
    }


    
}

