package cn.edu.seu.dao;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import java.util.Collection;
import java.util.List;

public class DB_Manager {

    private static final SessionFactory ourSessionFactory;
    private static DB_Manager handler = null;

    public static void main(String[] args) {
        DB_Manager.getHandler();

        try {

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    static {
        System.out.println("#function_mark> DB_Manager initialize...");
        try {
            System.out.println("#function_mark> config hibernate...");
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            ourSessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
        System.out.println("#function_mark> initialize done.");
    }
    public static DB_Manager getHandler() {
        if (handler == null) {
            handler = new DB_Manager();
        }
        return handler;
    }

    public static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }

    public static <T> Object FindByID(Class<T> aClass, int ID) throws Exception {
        System.out.println("#function_mark> FindByID: " + ID);
        Object entity = null;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            entity = session.get(aClass, ID);
            transaction.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return entity;
    }

    public static <T> List<Object> FindByAttribute(Class<T> aClass, String AttributeName, String condition) throws Exception {
        System.out.println("#function_mark> FindByAttribute");
        List<Object> list = null;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            list = session.createQuery("from " + aClass.getName() + " where " + AttributeName + condition).list();
            transaction.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return list;
    }

    public static List<Object> FindAll(String classname) throws Exception {
        System.out.println("#function_mark> FindAll " +classname);
        List<Object> list = null;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            list = session.createQuery("from " + classname).list();
            transaction.commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }

        return list;
    }

    public static boolean Save(Object entity) throws Exception {
        System.out.println("#function_mark> Save: " + entity);
        boolean success = true;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.save(entity);
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }
        return success;
    }

    public static <T> boolean SaveAll(Collection<T> entities) throws Exception {
        System.out.println("#function_mark> SaveAll");
        boolean success = true;
        int count = 0;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            for (Object entity : entities
                    ) {
                session.save(entity);
                count++;
                if (count % 1024 == 0) {
                    session.flush();
                    session.clear();
                    count = 0;
                }
            }
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }
        return success;
    }

    public static boolean Update(Object entity) throws Exception {
        System.out.println("#function_mark> Update: " + entity);
        boolean success = true;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(entity);
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }
        return success;
    }

    public static <T> boolean UpdateAll(Collection<T> entities) throws Exception {
        System.out.println("#function_mark> UpdateAll");
        boolean success = true;
        int count = 0;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            for (Object entity : entities
                    ) {
                session.update(entity);
                count++;
                if (count % 1024 == 0) {
                    session.flush();
                    session.clear();
                    count = 0;
                }
            }
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }
        return success;
    }

    public static boolean Delete(Object entity) throws Exception {
        System.out.println("#function_mark> Delete: " + entity);
        boolean success = true;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(entity);
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }
        return success;
    }

    public static <T> boolean DeleteAll(Collection<T> entities) throws Exception {
        System.out.println("#function_mark> DeleteAll");
        boolean success = true;
        int count = 0;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            for (Object entity : entities
                    ) {
                session.delete(entity);
                count++;
                if (count % 1024 == 0) {
                    session.flush();
                    session.clear();
                    count = 0;
                }
            }
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }

        return success;
    }

    public static boolean SaveOrUpdate(Object entity) throws Exception {
        System.out.println("#function_mark> SaveOrUpdate: " + entity);
        boolean success = true;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(entity);
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }
        return success;
    }

    public static <T> boolean SaveOrUpdateAll(Collection<T> entities) throws Exception {
        System.out.println("#function_mark> SaveOrUpdateAll");
        boolean success = true;
        int count = 0;
        final Session session = getSession();
        Transaction transaction = session.beginTransaction();
        try {
            for (Object entity : entities
                    ) {
                session.saveOrUpdate(entity);
                count++;
                if (count % 1024 == 0) {
                    session.flush();
                    session.clear();
                    count = 0;
                }
            }
            transaction.commit();
        } catch (Exception e) {
            success = false;
            transaction.rollback();
        } finally {
            session.close();
        }
        return success;
    }
}