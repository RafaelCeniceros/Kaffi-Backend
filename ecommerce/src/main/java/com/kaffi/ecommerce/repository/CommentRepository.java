package com.kaffi.ecommerce.repository;

import org.springframework.data.repository.CrudRepository;

import com.kaffi.ecommerce.entity.Comment;
import com.kaffi.ecommerce.entity.User;

public interface CommentRepository extends CrudRepository<Comment,Long>{

	Iterable<Comment> findAllByUser(User user);

}
