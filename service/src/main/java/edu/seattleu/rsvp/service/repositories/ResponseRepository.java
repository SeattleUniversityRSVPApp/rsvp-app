package edu.seattleu.rsvp.service.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import edu.seattleu.rsvp.service.entities.ResponseEntity;

@Transactional
public interface ResponseRepository extends JpaRepository<ResponseEntity, Long>
{
    public List<ResponseEntity> getResponseEntitiesByEvent_link(String EventLink);
}
