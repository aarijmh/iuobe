package pk.edu.iqra.OBE.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;

import org.springframework.stereotype.Service;
import pk.edu.iqra.OBE.model.Role;
import pk.edu.iqra.OBE.model.User;
import pk.edu.iqra.OBE.repository.UserRepository;
import pk.edu.iqra.OBE.repository.UserRoleRepository;
import pk.edu.iqra.OBE.service.UserService;

import java.util.Set;


@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class UserServiceImpl implements UserService {


    private final UserRoleRepository userRoleRepository;
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) {
        return null;
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public Set<Role> findUserRolesById(Long userId) {
        return userRoleRepository.findRoleOfUser(userId);
    }
}
