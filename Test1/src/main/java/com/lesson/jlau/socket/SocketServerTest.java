package com.lesson.jlau.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketServerTest {
	
	public static void main(String args[]) throws IOException{
		ServerSocket serverSocket = new ServerSocket(10086);	
		Socket socket = serverSocket.accept();
		InputStream is  = socket.getInputStream();
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
		serverSocket.close();
	}
	
}
