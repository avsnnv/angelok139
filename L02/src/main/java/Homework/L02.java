package Homework;

import java.lang.management.ManagementFactory;

public class L02 {
    public static void main(String[] args) throws Exception{
        System.out.println("Измерение размера объектов");
        System.out.println("PID: "+ ManagementFactory.getRuntimeMXBean().getName()+"\n");

        while(true){
            int size=100_000_000;
            System.gc();
            Thread.sleep(100);
            long mem=ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getMax()-ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed();
            System.out.println("Before: "+mem/1024+"Kb");
            Object[] array=new Object[size];
            long mem2=ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getMax()-ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed();
            System.out.println("After array creating: "+mem2/1024+"Kb");
            for(int i=0;i<size;i++)
                array[i]=new Object();
            long mem3=ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getMax()-ManagementFactory.getMemoryMXBean().getHeapMemoryUsage().getUsed();
            System.out.println("Size of one element: "+ ((mem2-mem3)/size));
        }
    }
}
