package com.company.credit;


import com.haulmont.thesis.testsupport.ThesisTestContainer;
import org.junit.jupiter.api.extension.ExtensionContext;

public class CreditTestContainer extends ThesisTestContainer {

    public CreditTestContainer() {
        super();
        // project and special properties for test environment.
        appPropertiesFiles.add("credit-app.properties");
        appPropertiesFiles.add("credit-test-app.properties");
        autoConfigureDataSource();
    }

    public static class Common extends CreditTestContainer {

        // A common singleton instance of the test container which is initialized once for all tests
        public static final CreditTestContainer.Common INSTANCE = new CreditTestContainer.Common();

        private static volatile boolean initialized;

        private Common() {}

        @Override
        public void beforeAll(ExtensionContext extensionContext) throws Exception {
            if (!initialized) {
                super.beforeAll(extensionContext);
                initialized = true;
            }
            setupContext();
        }

        @SuppressWarnings("RedundantThrows")
        @Override
        public void afterAll(ExtensionContext extensionContext) throws Exception {
            cleanupContext();
           // never stops - do not call super
        }
    }
}