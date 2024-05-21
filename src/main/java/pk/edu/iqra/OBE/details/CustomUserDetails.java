package pk.edu.iqra.OBE.details;

import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.io.Serial;
import java.util.Collection;

@Getter
@Setter
public class CustomUserDetails extends User {

	/**
	 * 
	 */
	@Serial
	private static final long serialVersionUID = 8778637731418392608L;
	
	private Long id;
	private String name;

	public CustomUserDetails(String username, String password, boolean enabled, boolean accountNonExpired,
                             boolean credentialsNonExpired, boolean accountNonLocked,
                             Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);	
	}

}
