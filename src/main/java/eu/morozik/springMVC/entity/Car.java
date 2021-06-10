package eu.morozik.springMVC.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name="cars")
public class Car{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long car_id;

    @Column
    private String name;

    @Transient
    @ManyToMany(mappedBy = "cars")
    private List<User> users;

    @Transient
    @ManyToMany(mappedBy = "cars_order")
    private List<User> users_order;

    public Car() {

    }

    public Car(Long id) {
        this.car_id = id;
    }

    public Car(Long id, String name) {
        this.car_id = id;
        this.name = name;
    }
}

