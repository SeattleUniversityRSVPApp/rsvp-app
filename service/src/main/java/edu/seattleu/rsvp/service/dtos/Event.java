package edu.seattleu.rsvp.service.dtos;

import org.joda.time.DateTime;
import java.io.Serializable;
import java.util.List;
import edu.seattleu.rsvp.service.entities.EventEntity;

public class Event implements Serializable
{
    private String link;
    private String name;
    private DateTime dateTime;
    private String description;
    private String creator;
    private String location;
    private int minNum;
    private boolean status;
    private List<Response> responses;

    public Event()
    {
    }

    public Event(String link, String name, DateTime dateTime, String description, String creator, String location, int minNum, boolean status, List<Response> responses)
    {
        this.link = link;
        this.name = name;
        this.dateTime = dateTime;
        this.description = description;
        this.creator = creator;
        this.location = location;
        this.minNum = minNum;
        this.status = status;
        this.responses = responses;
    }

    public static Event createFromEntity(EventEntity eventEntity)
    {
        return null;
    }

    public String getLink()
    {
        return link;
    }

    public String getName()
    {
        return name;
    }

    public DateTime getDateTime()
    {
        return dateTime;
    }

    public String getDescription()
    {
        return description;
    }

    public String getCreator()
    {
        return creator;
    }

    public String getLocation()
    {
        return location;
    }

    public int getMinNum()
    {
        return minNum;
    }

    public boolean isStatus()
    {
        return status;
    }

    public List<Response> getResponses()
    {
        return responses;
    }
}
