package com.app.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
@Mapper
public interface InviceDAO {
    public List<Invice> getInvicePager(@Param("skip") int skip,@Param("size") int size);
    public  Invice getInviceById(int id);   
    public int getInviceCount();   
    public int insert(Invice entity);   
    public int delete(int id);   
    public int update(Invice entity);
	public List<Invice> getAllInvice();
}
