package com.flyrui.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.flyrui.dao.common.BaseDAO;
import com.flyrui.dao.common.page.PageModel;
import com.github.pagehelper.Page;

public abstract class BaseService<T>
{
    @Autowired
    @Qualifier("baseDAO")
    public BaseDAO baseDao;
    
    @Autowired
    @Qualifier("baseBatchDAO")
    public BaseDAO baseBatchDAO;
    
    public String nameSpace; 
    
    public String getNameSpace() {
		return nameSpace;
	}

	public void setNameSpace(String nameSpace) {
		this.nameSpace = nameSpace;
	}

	public List<T> getListByCon(T t) {
		return baseDao.selectList(nameSpace+".select", t);		
	}
    
    public PageModel<T> getPagerListByCon(T t,int pageNo,int pageSize) {    	
        return getPagerList(t,nameSpace+".select",pageNo,pageSize);		
	}
    
    /**
     * 
     * 传入配置的SQL，获取分页查询的结果
     * @param t
     * @param mapSqlId
     * @param pageNo
     * @param pageSize
     * @return [返回类型说明]
     * 
     * rover.lee
     * Jan 12, 2014
     */
    public PageModel<T> getPagerList(Object t,String mapSqlId,int pageNo,int pageSize) {
    	PageModel<T> page = new PageModel<T>();
    	page.setPageIndex(pageNo);
    	page.setPageSize(pageSize);
    	RowBounds  rowBounds = new RowBounds(page.getStartIndex(),page.getPageSize());
    	Page<T> retPage = (Page<T>)baseDao.selectList(mapSqlId, t, rowBounds);
    	/*int rowCount = PaginationHelper.getRowCount(baseDao.getSqlSessionFactory().openSession(), mapSqlId, t);
    	page.setTotal(rowCount);
    	if(rowCount >0){
	    	RowBounds  rowBounds = new RowBounds(page.getStartIndex(),page.getPageSize());
	    	List resultList = (List<?>)baseDao.selectList(mapSqlId, t,rowBounds);    	
	    	page.setRows(resultList);
	
	        if(resultList == null || resultList.size() == 0) {
	        	page.setPageSize(0);
	        	page.setPageIndex(0);
	        }
    	}*/
    	page.setRows(retPage.getResult());
    	page.setTotal(Long.valueOf(retPage.getTotal()).intValue());
    	if(retPage.getResult()==null || retPage.getResult().size()==0){    		
        	page.setPageIndex(0);
    	}
        return page;		
	}
    
    public int delete(T t) {
    	return baseDao.delete(nameSpace+".delete", t);		
	}

	public int insert(T t) {
		return baseDao.update(nameSpace+".insert", t);		
	}
	
	public int update(T t) {
		return baseDao.update(nameSpace+".update", t);	
	}
	
	public List<T> selectList(T t) {
		return baseDao.selectList(nameSpace+".select", t);	
	}
	
	public int batchInsert(List<T> t){
		int i=0;
		int cnt=0;
		SqlSession session = baseDao.getSqlSessionFactory().openSession(ExecutorType.BATCH);
		for(T subT : t){
			i += baseDao.insert(nameSpace+".insert", subT);	
			cnt++;
			if(cnt>1000){
				session.commit();
			}
		}
		session.commit();
		session.clearCache();		
		return i;
	}
	
	public <E> List<E> queryById(String sqlId,Object t){
		return baseDao.selectList(nameSpace+"."+sqlId, t);	
	}
	
	public int insertById(String sqlId,Object t){
		return baseDao.insert(nameSpace+"."+sqlId, t);	
	}
	public int deleteById(String sqlId,Object t){
		return baseDao.delete(nameSpace+"."+sqlId, t);	
	}
	
	public String getSequence(String sequenceName){
		Map param = new HashMap();
		param.put("sequence_name", sequenceName);
		List retList =  baseDao.selectList("com.flyrui.dao.mapper.common.getSequence", param);	
		String seq="";
		if(retList!=null && retList.size() >0){
			Map map = (Map)retList.get(0);
			seq = String.valueOf(map.get("seq"));
		}		
		return seq;
	}
	
	
	
}
