package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Comment;
import com.app.mapper.CommentDAO;
import com.app.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService{
	@Resource CommentDAO commentDao;
public List<Comment> getCommentPager(@Param("skip") int skip,@Param("size") int size){
return commentDao.getCommentPager(skip, size);
}
public  Comment getCommentById(int id){
return commentDao.getCommentById(id);
}
public int getCommentCount(){
return commentDao.getCommentCount();
}
public int insert(Comment entity){
return commentDao.insert(entity);
}
public int delete(int id){
return commentDao.delete(id);
}
public int update(Comment entity){
return commentDao.update(entity);
}
public List<Comment> getAllComment(){
return commentDao.getAllComment();
}
@Override
public List<Comment> getRootComment() {
	// TODO Auto-generated method stub
	return commentDao.getRootComment();
}
@Override
public List<Comment> getCommentByPID(int mid) {
	// TODO Auto-generated method stub
	return commentDao.getCommentByPID(mid);
}

}
