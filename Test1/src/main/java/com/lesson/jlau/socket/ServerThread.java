package com.lesson.jlau.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerThread extends  Thread{
	//服务器线程处理 
	//和本线程相关的socket 
	Socket socket =null; 
	// 
	public ServerThread(Socket socket){ 
		this.socket = socket; 
	} 
	public void run(){ 
		InputStream is;
		try {
			is = this.socket.getInputStream();
			InputStreamReader reader = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(reader);
			String text = null;
			while(( text = br.readLine())!=null){
				System.out.println(text);
			}
			socket.shutdownInput();
			OutputStream  os  = socket.getOutputStream();
			PrintStream pw = new PrintStream(os);
			pw.print("欢迎你！");
			pw.flush();
			pw.close();
			os.close();
			br.close();
			reader.close();
			is.close();
			socket.close();
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
	} 
	public static void main(String args[]) throws Exception{
		//============================================ 
		//服务器代码 
		ServerSocket serverSocket =new ServerSocket(10086); 
		Socket socket =null; 
		int count =0;//记录客户端的数量 
		while(true){ 
			socket = serverSocket.accept(); 
			ServerThread serverThread =new ServerThread(socket); 
			serverThread.start(); 
		    count++; 
			System.out.println("客户端连接的数量："+count); 
		} 
	}

}
