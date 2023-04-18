
package Customer;
import Shared.Item;

public class Order 
{
    Item item;
    int quantity;
    
    public Order(Item item, int quantity)
    {
        this.item = item;
        this.quantity = quantity;
    }
}
