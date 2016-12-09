package com.hibernate.timers.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hibernate.timers.domain.TimerTaskBean;
import com.spring.ServiceManager;

public class TimerTaskUtil {
    /**
     * 定时任务列表
     */
    public static List<TimerTaskBean> timerTasks = new ArrayList<TimerTaskBean>();

    public static Map<String, TaskThread> taskmap = new HashMap<String, TaskThread>();

    /**
     * 初始化 可用定时任务
     * @return
     */
    public static void loadTimerTasks(){
        destoryTaskThread();
        initTaskThread();
    }

    /**
     * 重新加载定时任务
     * @param task
     */
    public static void reloadTimerTask(TimerTaskBean task){
        if(task != null){
            try {
                if(taskmap.get(task.getId()) != null){
                    for(int i = 0;i<timerTasks.size();i++){
                        if(timerTasks.get(i).getId().equals(task.getId())){
                            timerTasks.remove(i);
                            timerTasks.add(task);
                            break;
                        }
                    }
                }else{
                    timerTasks.add(task);
                    System.out.println("新增定时任务:"+task.getTaskName());
                }
                taskmap.put(task.getId(), new TaskThread(task));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 移除定时任务
     * @param task
     */
    public static void removeTimerTask(TimerTaskBean task){
        if(task != null){
            try {
                for(int i = 0;i<timerTasks.size();i++){
                    if(timerTasks.get(i).getId().equals(task.getId())){
                        timerTasks.remove(i);
                        System.out.println("移除定时任务:"+task.getTaskName());
                        taskmap.remove(task.getId());
                        break;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 初始化任务线程
     */
    private static void initTaskThread(){
        List<TimerTaskBean> tasks = ServiceManager.getTimerServiceImpl().findAll();
        if(tasks != null){
            for(int i=0;i<tasks.size();i++){
                try {
                    if(tasks.get(i).getStatus()==0) continue;
                    taskmap.put(tasks.get(i).getId(), new TaskThread(tasks.get(i)));
                    timerTasks.add(tasks.get(i));
                    System.out.println("加载定时任务:"+tasks.get(i).getTaskName());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 销毁任务线程
     */
    private static void destoryTaskThread(){
        taskmap = new HashMap<String, TaskThread>();
        timerTasks = new ArrayList<TimerTaskBean>();
    }

    /**
     * 执行任务
     * @param taskId
     * @return
     */
    public static boolean callTask(String taskId, String dateStr, String logId,String aoJianIds){
        try {
            TaskThread task = taskmap.get(taskId);
            task.setDateString(dateStr);
            task.setLogId(logId);
            task.setAoJianIds(aoJianIds);
            Thread t = new Thread(task);
            t.start();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}

@SuppressWarnings("unchecked")
class TaskThread implements Runnable{

    private TimerTaskBean task;
    private Class reflectClass;
    private Method method;
    private Object taskInstance;
    private String dateString = "";
    private Object[] paramValues= new Object[3];
    private Class[] paramTypes = new Class[3];
    private String logId = "";
    private String aoJianIds ="";
    public void setAoJianIds(String aoJianIds) {
        this.aoJianIds = aoJianIds;
    }

    public TaskThread(TimerTaskBean _task) throws ClassNotFoundException, SecurityException, NoSuchMethodException, InstantiationException, IllegalAccessException {
        task = _task;
        paramTypes[0] = String.class;
        paramTypes[1] = String.class;
        paramTypes[2] = String.class;
        this.reflectClass = Class.forName(task.getClassName());
        this.method = this.reflectClass.getMethod(task.getMethodName(),paramTypes);
        taskInstance = this.reflectClass.newInstance();
    }

    @Override
    public void run() {
        System.out.println("执行定时任务:   "+task.getTaskDesc());
        try {
            //第一个  AoJIanBean Ids 第二个 dateString 第三个 logId
            paramValues[0] = aoJianIds;
            paramValues[1] = dateString;
            paramValues[2] = logId;
            method.invoke(taskInstance, paramValues);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public void setDateString(String dateString) {
        this.dateString = dateString;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

}
