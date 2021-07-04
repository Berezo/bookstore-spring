package org.example.services;

import org.example.entity.User;

public interface UserService {
    void saveUser(User user);
    void updateUser(User user);
    User getUser(String userId);
}
