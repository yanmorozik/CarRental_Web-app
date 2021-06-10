package eu.morozik.springMVC.repository;

import eu.morozik.springMVC.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}