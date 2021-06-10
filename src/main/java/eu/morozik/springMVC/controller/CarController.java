package eu.morozik.springMVC.controller;

import eu.morozik.springMVC.Util.Parser;
import eu.morozik.springMVC.entity.Car;
import eu.morozik.springMVC.entity.User;
import eu.morozik.springMVC.service.CarService;
import eu.morozik.springMVC.service.UserService;
//import org.graalvm.compiler.lir.LIRInstruction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CarController {
    @Autowired
    private CarService carService;

    @Autowired
    private UserService userService;

    @GetMapping("/ordercar")
    public String carList(Model model) {
        model.addAttribute("allCars", carService.getAllCars());
        model.addAttribute("allUsers", userService.allUsers());
        return "ordercar";
    }

    @PostMapping("/ordercar")
    public String orderCar(@RequestParam(required = true, defaultValue = "") Long carId,
                           @AuthenticationPrincipal User user,
                           @RequestParam(required = true, defaultValue = "") String action,
                           Model model) {
        if (action.equals("order")) {
            carService.savePendingOrderCar(user, carId);
        }
        return "ordercar";
    }

    @GetMapping("/anfragen")
    public String anfragen(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "anfragen";
    }

    @PostMapping("/anfragen")
    public String anfragenPost(@RequestParam(required = true, defaultValue = "") String CarsId,
                              @RequestParam(required = true, defaultValue = "") String userName,
                               @RequestParam(required = true, defaultValue = "") String action,
                               Model model) {
        if (action.equals("accept")) {
            List<Long> parsCarId=Parser.parserCarId(CarsId);
            for (Long id:parsCarId){
                carService.saveOrderCar(userName, id);
                carService.deleteUserCars(userName,id);
            }

        } else if (action.equals("reject")) {
            List<Long> parsCarId=Parser.parserCarId(CarsId);
            for (Long id:parsCarId) {
                carService.deleteUserCars(userName,id);
            }

        }

        return "anfragen";
    }

    @GetMapping("/garage")
    public String garage(Model model,
                         @AuthenticationPrincipal User user){
        User testUser=userService.findUserById(user.getId());
        model.addAttribute("cars",testUser.getCars_order());
        return "garage";
    }

}
