package com.kaffi.ecommerce.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaffi.ecommerce.entity.Comment;
import com.kaffi.ecommerce.entity.User;
import com.kaffi.ecommerce.repository.CommentRepository;
import com.kaffi.ecommerce.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentRepository commentRepository;
	
	@Override
	public Comment getCommentById(Long id) {
		Optional<Comment> commentOptional = commentRepository.findById(id);
		
		if(commentOptional.isPresent()) return commentOptional.get();
		else throw new IllegalStateException("Order id ( "+ id + " ) doesnt exist");
	}

	@Override
	public Comment createComment(Comment comment) {
		comment.setId(null);
		Comment newComment = commentRepository.save(comment);
		return newComment;
	}

	@Override
	public List<Comment> getAllComments() {
		List<Comment> comments = (List<Comment>)commentRepository.findAll();
		return comments;
	}

	@Override
	public Comment updateComment(Comment comment, Long id) {
		Comment existingComment = getCommentById(id);
		existingComment.setDate(comment.getDate());
		existingComment.setComment(comment.getComment());
		return commentRepository.save(existingComment);
	}

	@Override
	public void deleteComment(Long id) {
		Comment existingComment = getCommentById(id);
		if(existingComment.getId() != null)
			commentRepository.delete(existingComment);
	}

	@Override
	public List<Comment> getAllCommentsOfUser(User user) {
        Iterable<Comment> orderIterable = commentRepository.findAllByUser(user);
        
        // Convierte el Iterable a una lista
        List<Comment> comments = new ArrayList<>();
        orderIterable.forEach(comments::add);
        return comments;
    }

}
