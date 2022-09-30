package com.app.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.Invice;
public interface InviceService {
    public List<Invice> getInvicePager(@Param("skip") int skip,@Param("size") int size);
    public  Invice getInviceById(int id);   
    public int getInviceCount();   
    public int insert(Invice entity);   
    public int delete(int id);   
    public int update(Invice entity);
	public List<Invice> getAllInvice();
}
