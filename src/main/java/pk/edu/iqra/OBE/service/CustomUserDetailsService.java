package pk.edu.iqra.OBE.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pk.edu.iqra.OBE.details.CustomUserDetails;
import pk.edu.iqra.OBE.model.User;

import java.util.ArrayList;
import java.util.List;


@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{


    private final UserService userService;

    @Autowired
    public CustomUserDetailsService(UserService userService)
    {
        this.userService = userService;
    }
     
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User user = userService.findByUsername(username);
        if(user == null){
            System.out.println("User not found");
            throw new UsernameNotFoundException("Username not found");
        }
        System.out.println("User : "+user.getEmail());

        
        	CustomUserDetails customUserDetails = new CustomUserDetails(user.getEmail(), user.getPassword(), user.getStatus(), true, true, true, getGrantedAuthorities(user));
        	customUserDetails.setId(user.getId());
        	customUserDetails.setName(user.getFirstName());
        	
            return customUserDetails;
    }
 
     
    private List<GrantedAuthority> getGrantedAuthorities(User campusUser){
        List<GrantedAuthority> authorities = new ArrayList<>();
         
//        for(Role role : userService.findUserRolesById(campusUser.getId()))
//            authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getRole()));
       
        return null;
    }
     
}