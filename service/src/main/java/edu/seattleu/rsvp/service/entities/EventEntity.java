package edu.seattleu.rsvp.service.entities;

import com.sun.istack.internal.NotNull;
import org.joda.time.DateTime;
import java.io.Serializable;
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
@Table(name = "event_table")
public class EventEntity implements Serializable
{
    @Id
    private String link;

    @NotNull
    private String name;

    @NotNull
    private DateTime dateTime;

    @NotNull
    private String description;

    @NotNull
    private String creator;

    @NotNull
    private String location;

    private int minNum;

    @NotNull
    private boolean status;

    @ElementCollection
    @CollectionTable(name = "event_responses", joinColumns = @JoinColumn(name = "event_link", nullable = false))
    @Column(name = "response_id", nullable = false)
    private List<Long> responsesIds;

    public EventEntity()
    {
    }


    public static EventEntity createFromDto(Event eventDto)
    {
        return null;
    }

    public String getLink()
    {
        return link;
    }

    public void setLink(String link)
    {
        this.link = link;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public DateTime getDateTime()
    {
        return dateTime;
    }

    public void setDateTime(DateTime dateTime)
    {
        this.dateTime = dateTime;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getCreator()
    {
        return creator;
    }

    public void setCreator(String creator)
    {
        this.creator = creator;
    }

    public String getLocation()
    {
        return location;
    }

    public void setLocation(String location)
    {
        this.location = location;
    }

    public int getMinNum()
    {
        return minNum;
    }

    public void setMinNum(int minNum)
    {
        this.minNum = minNum;
    }

    public boolean isStatus()
    {
        return status;
    }

    public void setStatus(boolean status)
    {
        this.status = status;
    }
}

