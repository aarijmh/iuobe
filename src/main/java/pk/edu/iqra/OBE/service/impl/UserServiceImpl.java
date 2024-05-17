package pk.edu.iqra.OBE.service.impl;

import org.springframework.security.core.userdetails.UserDetails;

import org.springframework.stereotype.Service;
import pk.edu.iqra.OBE.model.User;
import pk.edu.iqra.OBE.service.UserService;


@Service
public class UserServiceImpl implements UserService {


    @Override
    public UserDetails loadUserByUsername(String username) {
        return null;
    }

    @Override
    public User findByUsername(String username) {
        return null;
    }
}
