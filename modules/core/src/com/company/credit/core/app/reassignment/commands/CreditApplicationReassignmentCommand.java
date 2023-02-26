/*
 * Copyright (c) 2023 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.credit.core.app.reassignment.commands;

import com.haulmont.thesis.core.app.reassignment.commands.AbstractDocReassignmentCommand;
import com.company.credit.entity.CreditApplication;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component(CreditApplicationReassignmentCommand.NAME)
public class CreditApplicationReassignmentCommand extends AbstractDocReassignmentCommand<CreditApplication> {
    protected static final String NAME = "credit_CreditApplicationReassignmentCommand";

    @PostConstruct
    protected void postInit() {
        type = "CreditApplication";
        docQuery = String.format(DOC_QUERY_TEMPLATE, "credit$CreditApplication");
    }

    @Override
    public String getName() {
        return NAME;
    }
}