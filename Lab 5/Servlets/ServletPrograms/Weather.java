/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletPrograms;

/**
 *
 * @author Kirthana Balasubramanian
 */
public class Weather {
    String city;
    String maxTemp;
    String minTemp;
    String status;

    public Weather(String city, String maxTemp, String minTemp, String status) {
        this.city = city;
        this.maxTemp = maxTemp;
        this.minTemp = minTemp;
        this.status = status;
    }
    
}
