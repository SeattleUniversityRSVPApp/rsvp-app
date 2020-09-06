package edu.seattleu.rsvp.service.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import edu.seattleu.rsvp.service.entities.EventResponseEntity;

@Transactional
public interface ResponseRepository extends JpaRepository<EventResponseEntity, Long>
{
//    public List<EventResponseEntity> getResponseEntitiesByEvent_link(String EventLink);
}
