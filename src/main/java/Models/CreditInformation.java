package Models;

import net.jextra.fauxjo.FauxjoField;
import net.jextra.fauxjo.FauxjoImpl;
import net.jextra.fauxjo.FauxjoPrimaryKey;

import java.util.Date;
import java.util.UUID;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class CreditInformation extends FauxjoImpl {

    @FauxjoPrimaryKey
    @FauxjoField("creditinformationid")
    private UUID creditInformationId;

    @FauxjoField("userid")
    private UUID userId;

    @FauxjoField("cardnumber")
    private String cardNumber;

    @FauxjoField("expirationdate")
    private Date expirationDate;

    @FauxjoField("cvc")
    private String cvc;

    public CreditInformation()
    {
        this.creditInformationId = UUID.randomUUID();
    }

    @Override
    public String toString() {
        return "CreditInformation{" +
                "creditInformationId=" + creditInformationId +
                ", userId=" + userId +
                ", cardNumber='" + cardNumber + '\'' +
                ", expirationDate=" + expirationDate +
                ", cvc='" + cvc + '\'' +
                '}';
    }

    public UUID getCreditInformationId() {
        return creditInformationId;
    }

    public void setCreditInformationId(UUID creditInformationId) {
        this.creditInformationId = creditInformationId;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String getCvc() {
        return cvc;
    }

    public void setCvc(String cvc) {
        this.cvc = cvc;
    }
}
