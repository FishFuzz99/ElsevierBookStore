package com.ElsevierResources.validation;

/**
 * Created by GRAY1 on 7/25/2016.
 */

@SuppressWarnings("serial")
public class EmailExistsException extends Throwable {

    public EmailExistsException(final String message) {
        super(message);
    }

}