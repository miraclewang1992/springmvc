package com.lesson.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ResourceTest {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		Resource resource = new ClassPathResource("test.txt");
		InputStream in = resource.getInputStream();
		//System.out.println(in.getClass());
		byte b[] = new byte[4];
		int read =0;
		while((read = in.read(b))!= -1){
			System.out.println(new String(b,0,read));
		}
		
	}

}
