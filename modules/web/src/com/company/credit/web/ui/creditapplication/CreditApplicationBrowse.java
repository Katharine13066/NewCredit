/*
 * Copyright (c) 2023 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.credit.web.ui.creditapplication;

import com.haulmont.thesis.web.ui.basicdoc.browse.AbstractDocBrowser;
import com.company.credit.entity.CreditApplication;

import java.util.Map;

public class CreditApplicationBrowse<T extends CreditApplication> extends AbstractDocBrowser<T> {
    @Override
    public void init(Map<String, Object> params) {
        super.init(params);
        entityName = "credit$CreditApplication";
    }
}