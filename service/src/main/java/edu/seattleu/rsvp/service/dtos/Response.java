package edu.seattleu.rsvp.service.dtos;

import java.io.Serializable;
import edu.seattleu.rsvp.service.entities.ResponseEntity;

public class Response implements Serializable
{
    private long id;
    private String event_link;
    private String respondentName;
    private boolean attending;

    public Response()
    {
    }

    public Response(long id, String event_link, String respondentName, boolean attending)
    {
        this.id = id;
        this.event_link = event_link;
        this.respondentName = respondentName;
        this.attending = attending;
    }

    public static Response createFromEntity(ResponseEntity responseEntity)
    {
        return null;
    }

    public long getId()
    {
        return id;
    }

    public String getEvent_link()
    {
        return event_link;
    }

    public String getRespondentName()
    {
        return respondentName;
    }

    public boolean isAttending()
    {
        return attending;
    }
}
