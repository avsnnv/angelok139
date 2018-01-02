package Homework;

import java.lang.management.ManagementFactory;

public class L02 {
    public static void main(String[] args) throws Exception{
        System.out.println("Измерение размера объектов");
        System.out.println("PID: "+ ManagementFactory.getRuntimeMXBean().getName()+"\n");

        while(true){
            int size=50_000_000;
            Runtime runtime=Runtime.getRuntime();
            System.gc();
            Thread.sleep(1000);

            long mem=runtime.totalMemory()-runtime.freeMemory();
            System.out.println("Before: "+mem/1024+"Kb");

            int[] array=new int[size];
            long mem2=runtime.totalMemory()-runtime.freeMemory();
            System.out.println("After array creating: "+mem2/1024+"Kb");
            for(int i=0;i<size;i++)
                array[i]=123;
               //array[i]=Math.round(Math.random()*500);
            long mem3=runtime.totalMemory()-runtime.freeMemory();
            System.out.println("Size of one element: "+ ((mem2-mem)/size));
        }
    }
}
