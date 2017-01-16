package com.lesson.test;

public class ForumServiceImpl implements ForumService {

	public void removeTopic(int topcid) {
		System.out.println("delete topid "+ topcid);
		try {
			Thread.currentThread().sleep(20L);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void removeForum(int forumid) {
		System.out.println("delete forumid "+ forumid);
		try {
			Thread.currentThread().sleep(40L);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
