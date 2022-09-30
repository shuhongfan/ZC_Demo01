package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface MorderDAO {
    public List<Morder> getMorderPager(@Param("skip") int skip,@Param("size") int size);
    public  Morder getMorderById(int id);   
    public int getMorderCount();   
    public int insert(Morder entity);   
    public int delete(int id);   
    public int update(Morder entity);
	public List<Morder> getAllMorder();
	public List<Morder> getMorderByUid(int uid);
	public List<Morder> getMorderCMT(int pid);	
	public List<Morder> getMorderByPid(int pid);
}
