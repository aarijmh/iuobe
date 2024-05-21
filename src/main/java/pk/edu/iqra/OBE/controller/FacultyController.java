package pk.edu.iqra.OBE.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/faculty")
public class FacultyController {
    @GetMapping("/home")
    public String getFacultyHome(Principal principal){
        return "faculty/home_faculty";
    }
}
