package Models;

import net.jextra.fauxjo.FauxjoField;
import net.jextra.fauxjo.FauxjoImpl;
import net.jextra.fauxjo.FauxjoPrimaryKey;

import java.util.Date;
import java.util.UUID;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class Orders extends FauxjoImpl {

    @FauxjoPrimaryKey
    @FauxjoField("orderid")
    private UUID orderId;

    @FauxjoField("userid")
    private UUID userId;

    @FauxjoField("orderdate")
    private java.util.Date orderDate;

    @FauxjoField("total")
    private float total;

    @FauxjoField("shipmentdate")
    private java.util.Date shipmentDate;

    @FauxjoField("street")
    private String street;

    @FauxjoField("city")
    private String city;

    @FauxjoField("zipCode")
    private String zipCode;

    @FauxjoField("state")
    private String state;

    public Orders()
    {
        this.orderId = UUID.randomUUID();
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", orderDate=" + orderDate +
                ", total=" + total +
                ", shipmentDate=" + shipmentDate +
                ", street='" + street + '\'' +
                ", city='" + city + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    public UUID getOrderId() {
        return orderId;
    }

    public void setOrderId(UUID orderId) {
        this.orderId = orderId;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Date getShipmentDate() {
        return shipmentDate;
    }

    public void setShipmentDate(Date shipmentDate) {
        this.shipmentDate = shipmentDate;
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

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
