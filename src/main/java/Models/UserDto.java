package Models;

import com.ElsevierResources.validation.EmailMatches;
import com.ElsevierResources.validation.PasswordMatches;
import com.ElsevierResources.validation.ValidEmail;

import javax.validation.constraints.*;

/**
 * Created by GRAY1 on 7/22/2016.
 */
@EmailMatches
@PasswordMatches
public class UserDto
{
    @NotNull
    private String firstName;



    @NotNull
    private String lastName;

    @NotNull
    private String password;
    private String matchingPassword;

    @ValidEmail
    @NotNull
    private String email;

    @NotNull
    @ValidEmail
    private String matchingEmail;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMatchingPassword() {
        return matchingPassword;
    }

    public void setMatchingPassword(String matchingPassword) {
        this.matchingPassword = matchingPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatchingEmail() {
        return matchingEmail;
    }

    public void setMatchingEmail(String matchingEmail) {
        this.matchingEmail = matchingEmail;
    }
}
