package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Invice;
import com.app.mapper.InviceDAO;
import com.app.service.InviceService;
@Service
public class InviceServiceImpl implements InviceService{
	@Resource InviceDAO inviceDao;
public List<Invice> getInvicePager(@Param("skip") int skip,@Param("size") int size){
return inviceDao.getInvicePager(skip, size);
}
public  Invice getInviceById(int id){
return inviceDao.getInviceById(id);
}
public int getInviceCount(){
return inviceDao.getInviceCount();
}
public int insert(Invice entity){
return inviceDao.insert(entity);
}
public int delete(int id){
return inviceDao.delete(id);
}
public int update(Invice entity){
return inviceDao.update(entity);
}
public List<Invice> getAllInvice(){
return inviceDao.getAllInvice();
}

}
