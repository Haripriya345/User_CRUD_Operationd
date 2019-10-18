package com.aegis.repository;

import java.io.Serializable;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aegis.entity.UserEntity;

@Repository
public interface UserMasterRepository extends JpaRepository<UserEntity,Serializable> {

	Page<UserEntity> findAll(Pageable pageble);
}
