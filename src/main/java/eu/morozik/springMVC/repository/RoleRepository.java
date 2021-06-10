package eu.morozik.springMVC.repository;

import eu.morozik.springMVC.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
}