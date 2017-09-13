package com.lesson.test;


import java.util.Map;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * Created by doshest on 2017/8/4.
 */
public class CylicBarrierTest implements Runnable{
    private CyclicBarrier  barrier = new CyclicBarrier(15,this);
    private ConcurrentHashMap<String,Integer> map = new ConcurrentHashMap();
    public int i;

    public CylicBarrierTest(int i) {
        this.i = i;
    }

    public static  void main (String argd[]){
        CylicBarrierTest test = new CylicBarrierTest(0);
        test.count();
    }

    private void  count(){
        Executor service = Executors.newFixedThreadPool(15);
        for(int i =0 ;i < 15;i++){

            service.execute(new CylicBarrierTest(i) {
                
                public void run() {
                    System.out.println(this.i);
                    map.put(""+this.i,this.i);
                    try {
                        barrier.await();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    } catch (BrokenBarrierException e) {
                        e.printStackTrace();
                    }

                }
            });
        }
    }

 
    public void run() {
        int sum =0;
        for(Map.Entry<String, Integer> entry : map.entrySet()){
           /* System.out.println("key="+entry.getKey()+","+"value="+entry.getValue());*/
            sum=sum+entry.getValue();
        }
        System.out.println("----------------"+sum);
    }

}
