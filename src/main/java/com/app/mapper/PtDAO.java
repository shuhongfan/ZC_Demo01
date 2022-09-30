package com.app.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.app.entity.*;
@Mapper
public interface PtDAO {
    public List<Pt> getPtPager(@Param("skip") int skip,@Param("size") int size);
    public  Pt getPtById(int id);   
    public int getPtCount();   
    public int insert(Pt entity);   
    public int delete(int id);   
    public int update(Pt entity);
	public List<Pt> getAllPt();
}
