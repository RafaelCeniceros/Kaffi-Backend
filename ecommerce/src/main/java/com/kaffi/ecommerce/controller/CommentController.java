package com.kaffi.ecommerce.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.kaffi.ecommerce.entity.Comment;
import com.kaffi.ecommerce.entity.User;
import com.kaffi.ecommerce.service.CommentService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/v1/comments")
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@GetMapping
	List<Comment> getAllComments(){
		List<Comment> comments = commentService.getAllComments();
		return comments;
	}
	
	@GetMapping("{id}")
	Comment getCommentById(@PathVariable("id") Long id) {
		log.info("Se solicita los datos del comentario id:" + id);
		Comment comment = commentService.getCommentById(id);
		return comment;
	}
	
	@GetMapping("query")
    public List<Comment> getOrderByUser(@RequestParam(name = "userid") Long userId) {
		log.info("Se solicita los comentarios del usuario id:" + userId);
		
        // Llama al servicio para obtener todas las órdenes del usuario con el ID proporcionado
        User user = new User();  // Crea un objeto User con el ID proporcionado
        user.setId(userId);

        List<Comment> comments = commentService.getAllCommentsOfUser(user);
        return comments;
    }
	
	@PostMapping
	Comment setComment(@RequestBody Comment comment) {
		log.info("Se está creando un nuevo comentario");
		log.info(comment);
		Comment newComment = commentService.createComment(comment);
		return newComment;
	}
	
	@PutMapping("{id}")
	Comment updateOrder(@RequestBody Comment comment ,@PathVariable("id") Long id) {
		log.info("Se está actualizando el comentario id :" + id);
		return commentService.updateComment(comment, id);
	}
	
	@DeleteMapping("{id}")
	String deleteOrder(@PathVariable("id") Long id) {
		commentService.deleteComment(id);
		return "Se elimino el comentario id :" + id;
	}
	
}
