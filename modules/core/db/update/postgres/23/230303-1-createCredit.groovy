/*
 * Copyright (c) 2023 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

import com.company.credit.entity.CreditType
import com.haulmont.cuba.core.Persistence
import com.haulmont.cuba.core.global.AppBeans
import com.haulmont.cuba.core.global.Metadata

postUpdate.add({

    Persistence persistence = AppBeans.get(Persistence.NAME)
    Metadata metadata = AppBeans.get(Metadata.NAME)

    def transaction = persistence.createTransaction()
    def manager = persistence.getEntityManager();
    def types = "Ипотека,Кредит под залог недвижимости,Автокредит,Потребительские,Рефинансирование,Реструктуризация"
    def splitTypes = types.split(",")

    try {
        for (final def type in splitTypes) {
            CreditType creditType = metadata.create(CreditType.class)
            creditType.setName(type)
            creditType.setCode(String.valueOf(new Random().nextInt(100000)))
            manager.persist(creditType)
        }
        transaction.commit()
    }
    finally {
        transaction.end()
    }
})