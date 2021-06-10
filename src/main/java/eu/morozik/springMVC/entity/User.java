package eu.morozik.springMVC.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Data

@Entity
@Table(name = "t_user")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//параметр IDENTITY значит, что генерацией id будет заниматься БД.
    private Long id;

    @Size(min = 2, message = "Не меньше 2 знаков")
    @Column
    private String username;

    @Size(min = 4, message = "Не меньше 4 знаков")
    @Column
    private String password;

    @Transient//не имеет отображения в БД
    private String passwordConfirm;

    @ManyToMany(fetch = FetchType.EAGER)//FetchType.EAGER - список ролей загружается вместе с пользователем сразу (не ждет пока к нему обратятся).
    private Set<Role> roles;



    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name="user_cars",
            joinColumns = @JoinColumn(name="user_id"),
            inverseJoinColumns = @JoinColumn(name="car_id")
    )
    private Set<Car> cars;

    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name="user_order",
            joinColumns = @JoinColumn(name="user_id"),
            inverseJoinColumns = @JoinColumn(name="car_id")
    )
    private Set<Car> cars_order;

    public User() {
    }


    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public String getPassword() {
        return password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

}