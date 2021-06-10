package eu.morozik.springMVC.service;

import eu.morozik.springMVC.entity.Car;
import eu.morozik.springMVC.entity.Role;
import eu.morozik.springMVC.entity.User;
import eu.morozik.springMVC.repository.CarRepository;
import eu.morozik.springMVC.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class CarService {
    @Autowired
    CarRepository carRepository;

    @Autowired
    UserRepository userRepository;

    public List<Car> getAllCars() {
        return carRepository.findAll();
    }

    public boolean savePendingOrderCar(User user, Long carId) {

        Optional<Car> carFromDB = carRepository.findById(carId);

        User userFromDB = userRepository.findByUsername(user.getUsername());

        userFromDB.getCars().add(carFromDB.orElse(new Car()));

        userRepository.save(userFromDB);

        return true;
    }

    public boolean saveOrderCar(String userName, Long carId) {

        Optional<Car> carFromDB = carRepository.findById(carId);

        User userFromDB = userRepository.findByUsername(userName);

       // User userFromDB = userRepository.findByUsername(user.getUsername());

        userFromDB.getCars_order().add(carFromDB.orElse(new Car()));

        userRepository.save(userFromDB);

        return true;
    }

    public void deleteUserCars(String userName,Long carId){
        Optional<Car> carFromDB = carRepository.findById(carId);
        User userFromDB = userRepository.findByUsername(userName);
        userFromDB.getCars().remove(carFromDB.orElse(new Car()));
        userRepository.save(userFromDB);
    }
}
