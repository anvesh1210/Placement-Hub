/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testClasses;

import in.tnpManagement.utility.RedisManager;
import redis.clients.jedis.Jedis;

/**
 *
 * @author DELL
 */
public class RedisTest2 {
    
    public static void main(String[] args) {
        try (Jedis jedis = RedisManager.getResource()) {
            System.out.println("PING: " + jedis.ping());
            jedis.set("hello", "world");
            System.out.println("GET hello: " + jedis.get("hello"));
        }
    
}

}
