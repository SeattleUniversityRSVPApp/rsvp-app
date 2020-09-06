package edu.seattleu.rsvp.service.dtos;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import edu.seattleu.rsvp.service.entities.EventEntity;

public class Event implements Serializable
{
    private String link;
    private String name;
    private Date dateTime;
    private String description;
    private String creator;
    private String location;
    private int minNum;
    private boolean status;
    private List<Response> responses;

    public Event()
    {
    }

    public Event(String link, String name, Date dateTime, String description, String creator,
                 String location, int minNum, boolean status, List<Response> responses)
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

    public static Event createFromEntity(EventEntity eventEntity, List<Response> allResponses)
    {
        return new Event(eventEntity.getLink(), eventEntity.getName(), eventEntity.getDateTime(),
                eventEntity.getDescription(), eventEntity.getCreator(), eventEntity.getLocation(),
                eventEntity.getMinNum(), eventEntity.isHappening(), allResponses);
    }

    public String getLink()
    {
        return link;
    }

    public String getName()
    {
        return name;
    }

    public Date getDateTime()
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

    public boolean isHappening()
    {
        return status;
    }

    public List<Response> getResponses()
    {
        return responses;
    }

    public void setLink(String link)
    {
        this.link = link;
    }

    public void addResponse(Response aNewResponse)
    {
        responses.add(aNewResponse);
    }
}