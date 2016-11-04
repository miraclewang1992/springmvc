/*package com.lesson.jlau.solr;

import java.net.MalformedURLException;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.CommonsHttpSolrServer;

*//**
 * @author XH
 *//*
public class SolrContext {

	// 搜索服务器地址
	private final String URL = "http://182.50.1.8:11590/solr";
	//private final String URL = "http://localhost:8080/solr";
	// 服务器
	private SolrServer server;

	private SolrContext() throws MalformedURLException {
		server = new CommonsHttpSolrServer(URL);
	}

	private static SolrContext context = null;

	public static SolrContext getInstance() throws MalformedURLException {
		if (context == null) {
			synchronized (SolrContext.class) {
				if (context == null) {
					context = new SolrContext();
				}
			}
		}
		return context;
	}

	public SolrServer getServer() {
		return server;
	}
}*/