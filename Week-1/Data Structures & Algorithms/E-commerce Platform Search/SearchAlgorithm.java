import java.util.Arrays;

public class SearchAlgorithm {

    public static Product linearSearch(Product[] products, int targetId) {
        for (Product product : products) {
            if (product.getProductId() == targetId) {
                return product;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, int targetId) {
        Product[] sortedProducts = Arrays.copyOf(products, products.length);
        Arrays.sort(sortedProducts, (a, b) -> Integer.compare(a.getProductId(), b.getProductId()));

        int left = 0;
        int right = sortedProducts.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int currentId = sortedProducts[mid].getProductId();

            if (currentId == targetId) {
                return sortedProducts[mid];
            }

            if (currentId < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return null;
    }

    public static void main(String[] args) {

        Product[] products = {
            new Product(1, "Laptop", 999.99, "Electronics", "High-performance laptop"),
            new Product(2, "Smartphone", 499.99, "Electronics", "Latest model smartphone"),
            new Product(3, "Headphones", 199.99, "Audio", "Noise-cancelling headphones")
        };

        Product result = linearSearch(products, 2);

        if (result != null) {
            System.out.println("Linear Search Found: " + result.getProductName());
        }

        result = binarySearch(products, 3);

        if (result != null) {
            System.out.println("Binary Search Found: " + result.getProductName());
        }
    }
}