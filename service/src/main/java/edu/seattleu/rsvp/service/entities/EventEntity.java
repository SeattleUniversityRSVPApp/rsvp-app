package edu.seattleu.rsvp.service.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import edu.seattleu.rsvp.service.dtos.Event;

@Entity
@Table(name = "eventTBL")
public class EventEntity implements Serializable
{
    @Id
    private String link;

    //@NotNull
    private String name;

    //@NotNull
    private Date dateTime;

    //@NotNull
    private String description;

    //@NotNull
    private String creator;

    //@NotNull
    private String location;

    private int minNum;

    //@NotNull
    private boolean status;

    @ElementCollection
    @CollectionTable(name = "eventResponses", joinColumns = @JoinColumn(name = "eventLink", nullable = false))
    @Column(name = "responseId", nullable = false)
    private List<Long> responsesIds;

    public EventEntity()
    {
    }


    public static EventEntity createFromDto(Event eventDto)
    {
        EventEntity aNewEventEntity = new EventEntity();
        aNewEventEntity.link = eventDto.getLink();
        aNewEventEntity.name = eventDto.getName();
        aNewEventEntity.creator = eventDto.getCreator();
        aNewEventEntity.dateTime = eventDto.getDateTime();
        aNewEventEntity.location = eventDto.getLocation();
        aNewEventEntity.description = eventDto.getDescription();
        aNewEventEntity.minNum = eventDto.getMinNum();
        aNewEventEntity.status = eventDto.isHappening();
        aNewEventEntity.responsesIds = null; //This event doesn't have any response yet.
        return aNewEventEntity;
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

    public List<Long> getResponsesIds()
    {
        return responsesIds;
    }

    public void setLink(String link)
    {
        this.link = link;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public void setDateTime(Date dateTime)
    {
        this.dateTime = dateTime;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public void setCreator(String creator)
    {
        this.creator = creator;
    }

    public void setLocation(String location)
    {
        this.location = location;
    }

    public void setMinNum(int minNum)
    {
        this.minNum = minNum;
    }

    public void setResponsesIds(List<Long> responsesIds)
    {
        this.responsesIds = responsesIds;
    }

    public boolean isHappening()
    {
        return status;
    }
}

