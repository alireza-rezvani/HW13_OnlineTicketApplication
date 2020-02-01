package ir.maktab32.java.homeworks.onlineticket.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(nullable = false)
    String name;

    @Column(nullable = false)
    String family;

    @Column(nullable = false)
    String gender;

    @ManyToOne
    User owner;

    @ManyToOne
    Trip trip;

    @Override
    public String toString() {
        return "Ticket{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", family='" + family + '\'' +
                ", gender='" + gender + '\'' +
                ", owner username=" + owner.getUsername() +
                ", trip id=" + trip.getId() +
                '}';
    }
}
