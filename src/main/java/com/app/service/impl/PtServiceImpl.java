package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Pt;
import com.app.mapper.PtDAO;
import com.app.service.PtService;
@Service
public class PtServiceImpl implements PtService{
	@Resource PtDAO ptDao;
public List<Pt> getPtPager(@Param("skip") int skip,@Param("size") int size){
return ptDao.getPtPager(skip, size);
}
public  Pt getPtById(int id){
return ptDao.getPtById(id);
}
public int getPtCount(){
return ptDao.getPtCount();
}
public int insert(Pt entity){
return ptDao.insert(entity);
}
public int delete(int id){
return ptDao.delete(id);
}
public int update(Pt entity){
return ptDao.update(entity);
}
public List<Pt> getAllPt(){
return ptDao.getAllPt();
}

}
