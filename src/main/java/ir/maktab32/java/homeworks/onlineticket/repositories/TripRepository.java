package ir.maktab32.java.homeworks.onlineticket.repositories;

import ir.maktab32.java.homeworks.onlineticket.config.hibernate.HibernateUtil;
import ir.maktab32.java.homeworks.onlineticket.config.hibernate.repositories.CrudRepository;
import ir.maktab32.java.homeworks.onlineticket.entities.Trip;
import org.hibernate.Session;

public class TripRepository extends CrudRepository<Trip, Long> {
    @Override
    protected Class<Trip> getEntityClass() {
        return Trip.class;
    }

    @Override
    protected Session getSession() {
        return HibernateUtil.getSession();
    }

    private TripRepository(){}

    private static TripRepository tripRepository;
    public static TripRepository getInstance(){
        if (tripRepository == null)
            tripRepository = new TripRepository();
        return tripRepository;
    }
}
