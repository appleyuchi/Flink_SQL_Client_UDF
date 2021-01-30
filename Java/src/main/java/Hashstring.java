import org.apache.flink.table.functions.ScalarFunction;



public class Hashstring extends ScalarFunction
{


    public Hashstring(){};
    private int factor = 12;
    public Hashstring(int factor)
    {
        this.factor = factor;
    }
    public int eval(String s) {
        return s.hashCode() * factor;
    }
}