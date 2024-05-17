package pk.edu.iqra.OBE.service;

import org.springframework.security.core.userdetails.UserDetails;
import pk.edu.iqra.OBE.model.User;

public interface UserService {
    UserDetails loadUserByUsername(String username);
    User findByUsername(String username);
}
