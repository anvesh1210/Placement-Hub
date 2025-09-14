/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testClasses;

import redis.clients.jedis.Jedis;

/**
 *
 * @author DELL
 */
public class RedisTest {
    public static void main(String[] args) {
         try (Jedis jedis = new Jedis("localhost", 6379)) {
            // Test connection
            String response = jedis.ping();
            System.out.println("PING Response: " + response);

            // Set and Get a value
            jedis.set("mykey", "Hello from Java Jedis!");
            String value = jedis.get("mykey");
            System.out.println("Stored value: " + value);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
