package ir.maktab32.java.homeworks.onlineticket.repositories;

import ir.maktab32.java.homeworks.onlineticket.config.hibernate.HibernateUtil;
import ir.maktab32.java.homeworks.onlineticket.config.hibernate.repositories.CrudRepository;
import ir.maktab32.java.homeworks.onlineticket.entities.Ticket;
import org.hibernate.Session;

public class TicketRepository extends CrudRepository<Ticket , Long> {
    @Override
    protected Class<Ticket> getEntityClass() {
        return Ticket.class;
    }

    @Override
    protected Session getSession() {
        return HibernateUtil.getSession();
    }

    private TicketRepository(){}

    private static TicketRepository ticketRepository;
    public static TicketRepository getInstance(){
        if (ticketRepository == null)
            ticketRepository = new TicketRepository();
        return ticketRepository;
    }
}
