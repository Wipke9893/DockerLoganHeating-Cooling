package org.logan.dao;

import org.logan.model.RegisterUserDto;
import org.logan.model.User;

import javax.validation.Valid;
import java.util.List;

public interface UserDao {

    List<User> getUsers();

    User getUserById(int id);

    User getUserByUsername(String username);

    User createUser(@Valid RegisterUserDto user);
}
