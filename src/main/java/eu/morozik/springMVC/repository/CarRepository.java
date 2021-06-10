package eu.morozik.springMVC.repository;

import eu.morozik.springMVC.entity.Car;
import eu.morozik.springMVC.entity.Role;
import eu.morozik.springMVC.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CarRepository extends JpaRepository<Car, Long> {
}
