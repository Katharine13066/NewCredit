/*
 * Copyright (c) 2023 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.
 */

package com.company.credit.entity;

import com.haulmont.chile.core.annotations.NamePattern;
import com.haulmont.cuba.core.entity.StandardEntity;
import com.haulmont.cuba.core.entity.annotation.EnableRestore;
import com.haulmont.cuba.core.entity.annotation.TrackEditScreenHistory;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Table(name = "CREDIT_CREDIT_TYPE")
@Entity(name = "credit$CreditType")
@EnableRestore
@TrackEditScreenHistory
@NamePattern("%s|name")
public class CreditType extends StandardEntity {

    private static final long serialVersionUID = -7199062103614494819L;

    @Column(name = "CODE", nullable = false, length = 9)
    protected String code;

    @Column(name = "NAME", nullable = false, length = 150)
    protected String name;

    @Column(name = "COMMENT_")
    @Lob
    protected String comment;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}