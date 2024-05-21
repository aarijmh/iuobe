package pk.edu.iqra.OBE.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.DelegatingPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Qualifier("customUserDetailsService")
    UserDetailsService userDetailsService;

    CustomSuccessHandler customSuccessHandler;

    @Autowired
    public SecurityConfiguration(UserDetailsService userDetailsService,
                                 CustomSuccessHandler customSuccessHandler) {
        this.userDetailsService = userDetailsService;
        this.customSuccessHandler = customSuccessHandler;
    }



    @Bean
    public PasswordEncoder passwordEncoder() {
        DelegatingPasswordEncoder delPasswordEncoder = (DelegatingPasswordEncoder) PasswordEncoderFactories.createDelegatingPasswordEncoder();
        BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
        delPasswordEncoder.setDefaultPasswordEncoderForMatches(bcryptPasswordEncoder);
        return delPasswordEncoder;
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService);
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(AbstractHttpConfigurer::disable)
                .cors(AbstractHttpConfigurer::disable)
                .formLogin(form-> form.loginPage("/login").successHandler(customSuccessHandler).usernameParameter("username").passwordParameter("password"))
                .authorizeHttpRequests((authz) -> {
                    try {
                        authz

                                .requestMatchers("/faculty/**").hasAnyRole("FACULTY")
                                .requestMatchers("/oricAdmin/**").hasAnyRole("UNIVERSITY_ADMIN", "CAMPUS_ADMIN")
                                .requestMatchers("/campusAdmin/**").hasAnyRole("UNIVERSITY_ADMIN", "CAMPUS_ADMIN")
                                .requestMatchers("/data/**").hasAnyRole("UNIVERSITY_ADMIN", "CAMPUS_ADMIN")
                                .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll()
                                .requestMatchers("/**").permitAll()
                                .anyRequest().authenticated();

                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }
        ).exceptionHandling(exception -> exception.accessDeniedPage("/accessDenied"));

        return http.build();
    }

}


