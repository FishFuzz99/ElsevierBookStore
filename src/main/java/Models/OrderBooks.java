package Models;

import net.jextra.fauxjo.FauxjoField;
import net.jextra.fauxjo.FauxjoImpl;
import net.jextra.fauxjo.FauxjoPrimaryKey;

import java.util.UUID;

/**
 * Created by GRAY1 on 8/2/2016.
 */
public class OrderBooks extends FauxjoImpl {

    @FauxjoPrimaryKey
    @FauxjoField("orderbookid")
    private UUID orderBookId;

    @FauxjoField("orderid")
    private UUID orderId;

    @FauxjoField("bookid")
    private UUID bookId;

    public OrderBooks()
    {
        this.orderBookId = UUID.randomUUID();
    }

    @Override
    public String toString() {
        return "OrderBooks{" +
                "orderBookId=" + orderBookId +
                ", orderId=" + orderId +
                ", bookId=" + bookId +
                '}';
    }

    public UUID getOrderBookId() {
        return orderBookId;
    }

    public void setOrderBookId(UUID orderBookId) {
        this.orderBookId = orderBookId;
    }

    public UUID getOrderId() {
        return orderId;
    }

    public void setOrderId(UUID orderId) {
        this.orderId = orderId;
    }

    public UUID getBookId() {
        return bookId;
    }

    public void setBookId(UUID bookId) {
        this.bookId = bookId;
    }
}
