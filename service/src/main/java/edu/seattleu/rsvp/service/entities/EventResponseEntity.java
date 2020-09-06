package edu.seattleu.rsvp.service.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import edu.seattleu.rsvp.service.dtos.Response;

@Entity
@Table(name = "responseTBL")
public class EventResponseEntity implements Serializable
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;


    //    @ManyToOne(targetEntity = EventEntity.class)
//    @JoinColumn(name = "event_link", referencedColumnName = "link")
//    private EventEntity event;
    private String event_link;
    private String respondentName;
    private boolean attending;


    public EventResponseEntity()
    {
    }

    public static EventResponseEntity createFromDto(Response responseDto)
    {
        return null;
    }

    public String getRespondentName()
    {
        return respondentName;
    }

    public void setRespondentName(String respondentName)
    {
        this.respondentName = respondentName;
    }

    public boolean isAttending()
    {
        return attending;
    }

    public void setAttending(boolean attending)
    {
        this.attending = attending;
    }

    public String getEvent_link()
    {
        return event_link;
    }

    public void setEvent_link(String event_link)
    {
        this.event_link = event_link;
    }
}
