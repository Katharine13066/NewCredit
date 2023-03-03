/*
 * Copyright (c) 2023 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.credit.web.ui.credittype;

import com.company.credit.entity.CreditType;
import com.haulmont.cuba.core.app.UniqueNumbersService;
import com.haulmont.cuba.gui.components.AbstractEditor;

import javax.inject.Inject;
import java.util.Map;


public class CreditTypeEdit<T extends CreditType> extends AbstractEditor<T> {
    @Inject
    private UniqueNumbersService uniqueNumbersService;

    @Override
    public void init(Map<String, Object> params) {
        super.init(params);
    }

    @Override
    protected void initNewItem(T code) {
        super.initNewItem(code);
        code.setCode(String.valueOf(uniqueNumbersService.getNextNumber(this.getClass().getSimpleName())));
    }
}