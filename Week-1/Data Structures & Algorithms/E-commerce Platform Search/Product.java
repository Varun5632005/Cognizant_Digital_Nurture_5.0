public class Product {
    private int productId;
    private String productName;
    private double productPrice;
    private String productCategory;
    private String productDescription;

    public Product(int productId, String productName, double productPrice,
                   String productCategory, String productDescription) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productCategory = productCategory;
        this.productDescription = productDescription;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public String getProductDescription() {
        return productDescription;
    }
}
