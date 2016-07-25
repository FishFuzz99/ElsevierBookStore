package com.ElsevierResources.services;

import Models.JDBCOperator;
import Models.User;
import Models.UserDto;
import com.ElsevierResources.validation.EmailExistsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Role;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

/**
 * Created by GRAY1 on 7/22/2016.
 */
@Service
public class UserService {
    @Autowired
    private JDBCOperator repository;

    public UserService(JDBCOperator repository)
    {
        this.repository = repository;
    }

    @Transactional
    public User registerNewUserAccount(UserDto accountDto) throws EmailExistsException {
        if (emailExist(accountDto.getEmail())) {
            throw new EmailExistsException("There is an account with that email address: " + accountDto.getEmail());
        }
        User user = new User();
        user.setFirstName(accountDto.getFirstName());
        user.setLastName(accountDto.getLastName());
        user.setPassword(accountDto.getPassword());
        user.setEmail(accountDto.getEmail());
        user.setAdmin(false);
        return repository.saveUser(user);
    }
    private boolean emailExist(String email) {
        User user = repository.findUserByEmail(email);
        if (user != null) {
            return true;
        }
        return false;
    }
}