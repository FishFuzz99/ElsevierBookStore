package com.ElsevierResources.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by GRAY1 on 7/18/2016.
 */
@Controller
public class HomeController {

    @RequestMapping(value="home", method = RequestMethod.GET)
    public String viewHome()
    {
        return "home";
    }

    @RequestMapping(value="front", method = RequestMethod.GET)
    public String viewFront()
    {
        return "front";
    }
}
