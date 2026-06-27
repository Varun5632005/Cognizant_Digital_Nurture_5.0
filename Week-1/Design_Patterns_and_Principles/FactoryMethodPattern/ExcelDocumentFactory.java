package Design_Patterns_and_Principles.FactoryMethodPattern;

public class ExcelDocumentFactory implements DocumentFactory {
    @Override
    public Document createDocument() {
        return new ExcelDocument();
    }
}
