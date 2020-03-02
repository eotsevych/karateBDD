package utils;

import com.github.javafaker.Faker;

public class UserData {

    public String getRandomEmail(){
        return new Faker().internet().emailAddress();
    }
}
