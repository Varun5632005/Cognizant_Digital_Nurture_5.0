package Design_Patterns_and_Principles.FactoryMethodPattern;

public class PdfDocumentFactory implements DocumentFactory {
    @Override
    public Document createDocument() {
        return new PdfDocument();
    }
}
