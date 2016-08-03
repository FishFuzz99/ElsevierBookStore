package Models;

import net.jextra.fauxjo.FauxjoField;
import net.jextra.fauxjo.FauxjoImpl;
import net.jextra.fauxjo.FauxjoPrimaryKey;

import java.util.UUID;

/**
 * Created by GRAY1 on 7/22/2016.
 */

public class User extends FauxjoImpl {


    @FauxjoPrimaryKey
    @FauxjoField("userid")
    private UUID userId;

    @FauxjoField("lastname")
    private String lastName;

    @FauxjoField("firstname")
    private String firstName;

    @FauxjoField("email")
    private String email;

    @FauxjoField("password")
    private String password;

    @FauxjoField("street")
    private String street;

    @FauxjoField("city")
    private String city;

    @FauxjoField("state")
    private String state;

    @FauxjoField("zipcode")
    private String zipCode;

    @FauxjoField("isadmin")
    private boolean isAdmin;

    public User()
    {
        this.userId = UUID.randomUUID();
    }

    public void setID(UUID ID) {
        this.userId = ID;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }


    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString()
    {
        return String.format("%s userId[%s] firstName[%s] lastName[%s] email[%s] city[%s] street[%s] state[%s] zipCode[%s]", getClass().getSimpleName(), userId, firstName, lastName, email, city, street, state, zipCode);
    }

}
