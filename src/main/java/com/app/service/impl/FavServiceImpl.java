package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.app.entity.Fav;
import com.app.mapper.FavDAO;
import com.app.service.FavService;
@Service
public class FavServiceImpl implements FavService{
	@Resource FavDAO favDao;
public List<Fav> getFavPager(@Param("skip") int skip,@Param("size") int size){
return favDao.getFavPager(skip, size);
}
public  Fav getFavById(int id){
return favDao.getFavById(id);
}
public int getFavCount(){
return favDao.getFavCount();
}
public int insert(Fav entity){
return favDao.insert(entity);
}
public int delete(int id){
return favDao.delete(id);
}
public int update(Fav entity){
return favDao.update(entity);
}
public List<Fav> getAllFav(){
return favDao.getAllFav();
}
@Override
public List<Fav> getFav1(int uid) {
	// TODO Auto-generated method stub
	return favDao.getFav1(uid);
}
@Override
public List<Fav> getFav2(Fav entity) {
	// TODO Auto-generated method stub
	return favDao.getFav2(entity);
}

}
