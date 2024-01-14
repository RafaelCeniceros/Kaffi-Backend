package com.kaffi.ecommerce.service;

import java.util.List;

import com.kaffi.ecommerce.entity.Comment;
import com.kaffi.ecommerce.entity.Order;
import com.kaffi.ecommerce.entity.User;

public interface CommentService {

	Comment getCommentById(Long id);
	Comment createComment(Comment comment);
	List<Comment> getAllComments();
	Comment updateComment(Comment comment, Long id);
	void deleteComment(Long id);
	List<Comment> getAllCommentsOfUser(User user);
	
}
