package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Morder;
import com.app.mapper.MorderDAO;
import com.app.service.MorderService;
@Service
public class MorderServiceImpl implements MorderService{
	@Resource MorderDAO morderDao;
public List<Morder> getMorderPager(@Param("skip") int skip,@Param("size") int size){
return morderDao.getMorderPager(skip, size);
}
public  Morder getMorderById(int id){
return morderDao.getMorderById(id);
}
public int getMorderCount(){
return morderDao.getMorderCount();
}
public int insert(Morder entity){
return morderDao.insert(entity);
}
public int delete(int id){
return morderDao.delete(id);
}
public int update(Morder entity){
return morderDao.update(entity);
}
public List<Morder> getAllMorder(){
return morderDao.getAllMorder();
}
@Override
public List<Morder> getMorderByUid(int uid) {
	// TODO Auto-generated method stub
	return morderDao.getMorderByUid(uid);
}
@Override
public List<Morder> getMorderCMT(int pid) {
	// TODO Auto-generated method stub
	return morderDao.getMorderCMT(pid);
}
@Override
public List<Morder> getMorderByPid(int pid) {
	// TODO Auto-generated method stub
	return morderDao.getMorderByPid(pid);
}


}
