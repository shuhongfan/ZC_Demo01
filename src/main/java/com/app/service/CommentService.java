package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Comment;
public interface CommentService {
    public List<Comment> getCommentPager(@Param("skip") int skip,@Param("size") int size);
    public  Comment getCommentById(int id);   
    public int getCommentCount();   
    public int insert(Comment entity);   
    public int delete(int id);   
    public int update(Comment entity);
	public List<Comment> getAllComment();

	public List<Comment> getRootComment();
	public List<Comment> getCommentByPID(int mid);
}
