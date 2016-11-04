package com.lesson.jlau.solr;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.response.SolrPingResponse;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.apache.solr.common.params.HighlightParams;
import org.apache.solr.common.params.MapSolrParams;
import org.apache.solr.common.params.SolrParams;
import org.junit.Test;

import com.lesson.jlau.bean.User;

/**
 * 操作Solr服务端的索引库
 * <p>
 * Title: SolrDao
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author 夏 杰
 * @date 2016年1月25日下午3:44:43
 * @version 1.0
 */
public class SolrDao {

	@Test
	public void createSolrClient() {
		try {
			SolrClient solr = new HttpSolrClient("http://localhost:8983/solr/universal");
			SolrPingResponse response = solr.ping();
			// 打印执行时间
			System.out.println(response.getElapsedTime());
			solr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void addBeanIndex() throws Exception {
		SolrClient solr = new HttpSolrClient("http://localhost:8983/solr/universal");
		User u = new User();
		u.setId(1223L);
		u.setUsername("xiaoming");
		UpdateResponse response = solr.addBean(u);
		System.out.println(response.getElapsedTime());
		solr.commit();
		solr.close();
	}

	/**
	 * 增加索引
	 * 
	 * @throws Exception
	 */
	@Test
	public void addIndex() throws Exception {
		SolrClient solr = new HttpSolrClient("http://localhost:8983/solr/universal");
		SolrInputDocument document = new SolrInputDocument();
		document.addField("id", "3333");
		document.addField("username", "test");
		UpdateResponse response = solr.add(document);
		System.out.println(response.getElapsedTime());
		solr.commit();
		solr.close();
	}
	
	/** 
     * 简单查询 
     * @throws IOException  
     * @throws SolrServerException  
     */  
    @Test  
    public void query() throws Exception{  
        SolrClient solr = new HttpSolrClient("http://localhost:8983/solr/universal");  
        Map map = new HashMap();  
        map.put("q", "username:赵");  
        map.put("start","0");
        map.put("rows", "20");
        /*map.put("sort","username asc");
        map.put("sort","username asc");*/
        map.put("hl","true");
        map.put("hl.fl", "username");
        map.put("hl.simple.pre","<em>");
        map.put("hl.simple.post","</em>");
        SolrParams params = new MapSolrParams(map);  
        QueryResponse resp = solr.query(params);  
        //以下是第二种方法  
        //String queryString="content:test";  
        //MultiMapSolrParams mParams = SolrRequestParsers.parseQueryString("queryString");  
        //QueryResponse resp = solr.query(mParams);  
        SolrDocumentList docsList = resp.getResults();  
        System.out.println(docsList.size()+"------"+docsList.getNumFound());  
      
        for (SolrDocument doc : docsList) {  
             System.out.print(doc.get("id")+"===");  
             System.out.print(doc.get("username").toString()+"===");
             String hl_username=resp.getHighlighting().get(doc.get("id")).get("username").toString();
             System.out.println(hl_username);
        }  
      
        solr.close();  
    }  
    /** 
     * 删除索引
     * @throws IOException  
     * @throws SolrServerException  
     */ 
    @Test
    public void delete() throws SolrServerException, IOException{
    	  SolrClient solr = new HttpSolrClient("http://localhost:8983/solr/universal");  
    	  solr.deleteById("3333");
    }
    

}