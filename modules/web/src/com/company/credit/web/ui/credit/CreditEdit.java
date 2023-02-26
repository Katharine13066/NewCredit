/*
 * Copyright (c) 2023 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.credit.web.ui.credit;


import com.company.credit.entity.*;
import com.haulmont.cuba.core.global.UserSessionSource;
import com.haulmont.thesis.web.ui.basic.editor.AbstractCardEditor;
import com.haulmont.thesis.web.ui.basic.editor.CardHeaderFragment;
import com.haulmont.workflow.core.app.WfUtils;
import com.haulmont.cuba.gui.components.Button;
import org.apache.commons.lang.StringUtils;
import com.haulmont.cuba.core.global.LoadContext;
import com.haulmont.thesis.core.entity.Numerator;
import com.haulmont.thesis.core.app.NumerationService;
import com.haulmont.cuba.core.entity.Entity;
import com.haulmont.cuba.core.global.PersistenceHelper;

import javax.inject.Inject;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

public class CreditEdit<T extends Credit> extends AbstractCardEditor<T> {

    @Inject
    protected NumerationService numerationService;
    @Inject
    protected UserSessionSource uss;
    
    @Override
    protected String getHiddenTabsConfig() {
        return "processTab,securityTab,cardLogTab";
    }

    @Override
    public void setItem(Entity item) {
        super.setItem(item);
        T card = getItem();
        if (isNumberAssignNeeded())
            setNumber(card);
        if (isNewItem(card)) {
            initDefaultActors();
        }
        initCardHeader(card);
    }

    protected boolean isNumberAssignNeeded() {
        return true;
    }

    protected void setNumber(Entity item) {
        LoadContext<Numerator> ctx = new LoadContext<>(Numerator.class);
        if (PersistenceHelper.isNew(item) && item.getMetaClass().getProperty("number") != null) {
            ctx.setQueryString("select n from df$Numerator n where n.code=:name").setParameter("name",
                    getItem().getClass().getSimpleName() + "Numerator");
            List<Numerator> numeratorList = getDsContext().getDataSupplier().loadList(ctx);
            if (!numeratorList.isEmpty()) {
                Numerator numerator = numeratorList.get(0);
                HashMap<String, Object> params = new HashMap<>();
                params.put("entity", getItem());
                item.setValue("number", numerationService.getNextNumber(numerator, params));
            }
        }
    }

    @Override
    protected void initHeaderFragmentContent(CardHeaderFragment cardHeaderFragment) {
        cardHeaderFragment.addDetailsInfoItem(
            "numberCaption",
            messages.getMessage(Credit.class, "notification.number"),
            "numberValue",
            cardDs,
            "number"
        );
        cardHeaderFragment.addDetailsInfoItem(
            "dateCaption",
            messages.getMessage(Credit.class, "notification.from"),
            "dateValue",
            cardDs,
            "createTs",
            (date) -> date == null ? StringUtils.EMPTY : new SimpleDateFormat("dd.MM.yyyy", uss.getLocale()).format(date)
        );
        super.initHeaderFragmentContent(cardHeaderFragment);
    }

    protected void initCardHeader(T item) {
        cardHeaderFragment.setDetailsInfoItemVisible("headerProcNameCaption", "headerProcName",
        !WfUtils.isCardInState(item, "New") && StringUtils.isNotEmpty(item.getState()));
    }
    

    @Override
    protected void initCardRolesFrame() {
        super.initCardRolesFrame();
        if (cardRolesFrame != null) {
            if(cardRolesFrame.getComponent("moveDown")!=null)
                cardRolesFrame.getComponentNN("moveDown").setVisible(false);
            if(cardRolesFrame.getComponent("moveUp")!=null)
                cardRolesFrame.getComponentNN("moveUp").setVisible(false);

            boolean editable = getAccessData().isCardRolesEditable();
            cardRolesFrame.setEditable(editable);
        }
    }
}