package edu.seattleu.rsvp.service.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import edu.seattleu.rsvp.service.entities.EventEntity;

@Transactional
public interface EventRepository extends JpaRepository<EventEntity, String>
{
    //public List<EventEntity> getEve(List<String> eventLinks);
}
