/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.utility;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 *
 * @author DELL
 */
public class RedisManager {
    private static JedisPool pool;

    static {
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(50);      // Max total connections
        config.setMaxIdle(20);       // Max idle connections
        config.setMinIdle(5);        // Min idle connections

        // Connect to Redis running in Docker
        pool = new JedisPool(config, "localhost", 6379);
    }

    public static Jedis getResource() {
        return pool.getResource();
    }

    public static void close() {
        pool.close();
    }
}
