package com.ElsevierResources.validation;

import Models.UserDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Created by GRAY1 on 7/22/2016.
 */
public class EmailMatchesValidator implements ConstraintValidator<EmailMatches, Object> {
    @Override
    public void initialize(EmailMatches constraintAnnotation) {
    }
    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext context){
        UserDto user = (UserDto) obj;
        return user.getEmail().equals(user.getMatchingEmail());
    }
}