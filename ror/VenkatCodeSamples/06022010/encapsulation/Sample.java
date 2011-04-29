public class Sample {
  private int value;
  
  public Sample(int v) { value = v; }
  public void foo(Sample other) {
    System.out.println("others value is " +
     other.value);
  }
  
  public static void main(String[] args) {
    Sample sample1 = new Sample(1);
    Sample sample2 = new Sample(2);
    sample1.foo(sample2);
  }
}