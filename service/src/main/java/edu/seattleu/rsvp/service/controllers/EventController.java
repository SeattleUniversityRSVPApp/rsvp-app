package edu.seattleu.rsvp.service.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import edu.seattleu.rsvp.service.dtos.Event;
import edu.seattleu.rsvp.service.dtos.Response;
import edu.seattleu.rsvp.service.entities.EventEntity;
import edu.seattleu.rsvp.service.entities.EventResponseEntity;
import edu.seattleu.rsvp.service.repositories.EventRepository;
import edu.seattleu.rsvp.service.repositories.ResponseRepository;

@RestController
@RequestMapping(path = "/event")
public class EventController
{
    @Autowired
    private EventRepository _eventRepository;
    @Autowired
    private ResponseRepository _responseRepository;

    @GetMapping
    public ResponseEntity<Event> getEvent(@RequestParam(value = "link") String eventLink)
    {
        Optional<EventEntity> eventEntity = _eventRepository.findById(eventLink);
        if (eventEntity.isPresent())
        {
            List<EventResponseEntity> allResponseEntities = _responseRepository.findAllById(eventEntity.get().getResponsesIds());
            List<Response> allResponses = new ArrayList<>();
            for(EventResponseEntity re : allResponseEntities)
            {
                allResponses.add(Response.createFromEntity(re));
            }
            Event event = Event.createFromEntity(eventEntity.get(),allResponses);
            return new ResponseEntity<>(event, HttpStatus.OK);
        }
        else
        {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<Event> createNewEvent(@Validated @RequestBody Event event)
    {
        //Generate a new link for the new event.
        String link = "https://www.my-test-unique-url-";
        event.setLink(link);
        EventEntity aNewEventEntity = EventEntity.createFromDto(event);
        aNewEventEntity = _eventRepository.save(aNewEventEntity);
        return new ResponseEntity<Event>(Event.createFromEntity(aNewEventEntity, new ArrayList<>()), HttpStatus.CREATED);
    }
}
