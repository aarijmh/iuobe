package pk.edu.iqra.OBE.service;

import org.springframework.security.core.userdetails.UserDetails;
import pk.edu.iqra.OBE.model.Role;
import pk.edu.iqra.OBE.model.User;

import java.util.Set;

public interface UserService {
    UserDetails loadUserByUsername(String username);
    User findByUsername(String username);
    Set<Role> findUserRolesById(Long userId);
}
