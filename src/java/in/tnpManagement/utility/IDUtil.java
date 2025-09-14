/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.utility;

/**
 *
 * @author DELL
 */
public class IDUtil {
    public static String wrap(String prefix, int id) {
        return prefix + id;
    }

    public static int unwrap(String prefixedId) {
        return Integer.parseInt(prefixedId.replaceAll("\\D+", ""));
    }
}
