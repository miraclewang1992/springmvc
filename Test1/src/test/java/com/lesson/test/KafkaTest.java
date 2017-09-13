package com.lesson.test;

import org.apache.log4j.Logger;

public class KafkaTest {

	private static Logger logger = Logger.getLogger(KafkaTest.class);

	public static void main(String[] args) throws InterruptedException {
		for (int i = 0; i <= 10; i++) {
			logger.info("This is Message [" + i + "] from log4j producer .. ");
			Thread.sleep(1000);
		}
	}
}
