package com.blog.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AlbumExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AlbumExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAlbumIdIsNull() {
            addCriterion("ALBUM_ID is null");
            return (Criteria) this;
        }

        public Criteria andAlbumIdIsNotNull() {
            addCriterion("ALBUM_ID is not null");
            return (Criteria) this;
        }

        public Criteria andAlbumIdEqualTo(BigDecimal value) {
            addCriterion("ALBUM_ID =", value, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdNotEqualTo(BigDecimal value) {
            addCriterion("ALBUM_ID <>", value, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdGreaterThan(BigDecimal value) {
            addCriterion("ALBUM_ID >", value, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("ALBUM_ID >=", value, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdLessThan(BigDecimal value) {
            addCriterion("ALBUM_ID <", value, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdLessThanOrEqualTo(BigDecimal value) {
            addCriterion("ALBUM_ID <=", value, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdIn(List<BigDecimal> values) {
            addCriterion("ALBUM_ID in", values, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdNotIn(List<BigDecimal> values) {
            addCriterion("ALBUM_ID not in", values, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("ALBUM_ID between", value1, value2, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumIdNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("ALBUM_ID not between", value1, value2, "albumId");
            return (Criteria) this;
        }

        public Criteria andAlbumNameIsNull() {
            addCriterion("ALBUM_NAME is null");
            return (Criteria) this;
        }

        public Criteria andAlbumNameIsNotNull() {
            addCriterion("ALBUM_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andAlbumNameEqualTo(String value) {
            addCriterion("ALBUM_NAME =", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameNotEqualTo(String value) {
            addCriterion("ALBUM_NAME <>", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameGreaterThan(String value) {
            addCriterion("ALBUM_NAME >", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameGreaterThanOrEqualTo(String value) {
            addCriterion("ALBUM_NAME >=", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameLessThan(String value) {
            addCriterion("ALBUM_NAME <", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameLessThanOrEqualTo(String value) {
            addCriterion("ALBUM_NAME <=", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameLike(String value) {
            addCriterion("ALBUM_NAME like", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameNotLike(String value) {
            addCriterion("ALBUM_NAME not like", value, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameIn(List<String> values) {
            addCriterion("ALBUM_NAME in", values, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameNotIn(List<String> values) {
            addCriterion("ALBUM_NAME not in", values, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameBetween(String value1, String value2) {
            addCriterion("ALBUM_NAME between", value1, value2, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumNameNotBetween(String value1, String value2) {
            addCriterion("ALBUM_NAME not between", value1, value2, "albumName");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcIsNull() {
            addCriterion("ALBUM_SRC is null");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcIsNotNull() {
            addCriterion("ALBUM_SRC is not null");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcEqualTo(String value) {
            addCriterion("ALBUM_SRC =", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcNotEqualTo(String value) {
            addCriterion("ALBUM_SRC <>", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcGreaterThan(String value) {
            addCriterion("ALBUM_SRC >", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcGreaterThanOrEqualTo(String value) {
            addCriterion("ALBUM_SRC >=", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcLessThan(String value) {
            addCriterion("ALBUM_SRC <", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcLessThanOrEqualTo(String value) {
            addCriterion("ALBUM_SRC <=", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcLike(String value) {
            addCriterion("ALBUM_SRC like", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcNotLike(String value) {
            addCriterion("ALBUM_SRC not like", value, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcIn(List<String> values) {
            addCriterion("ALBUM_SRC in", values, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcNotIn(List<String> values) {
            addCriterion("ALBUM_SRC not in", values, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcBetween(String value1, String value2) {
            addCriterion("ALBUM_SRC between", value1, value2, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumSrcNotBetween(String value1, String value2) {
            addCriterion("ALBUM_SRC not between", value1, value2, "albumSrc");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionIsNull() {
            addCriterion("ALBUM_DESCRIPTION is null");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionIsNotNull() {
            addCriterion("ALBUM_DESCRIPTION is not null");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionEqualTo(String value) {
            addCriterion("ALBUM_DESCRIPTION =", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionNotEqualTo(String value) {
            addCriterion("ALBUM_DESCRIPTION <>", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionGreaterThan(String value) {
            addCriterion("ALBUM_DESCRIPTION >", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("ALBUM_DESCRIPTION >=", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionLessThan(String value) {
            addCriterion("ALBUM_DESCRIPTION <", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionLessThanOrEqualTo(String value) {
            addCriterion("ALBUM_DESCRIPTION <=", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionLike(String value) {
            addCriterion("ALBUM_DESCRIPTION like", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionNotLike(String value) {
            addCriterion("ALBUM_DESCRIPTION not like", value, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionIn(List<String> values) {
            addCriterion("ALBUM_DESCRIPTION in", values, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionNotIn(List<String> values) {
            addCriterion("ALBUM_DESCRIPTION not in", values, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionBetween(String value1, String value2) {
            addCriterion("ALBUM_DESCRIPTION between", value1, value2, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andAlbumDescriptionNotBetween(String value1, String value2) {
            addCriterion("ALBUM_DESCRIPTION not between", value1, value2, "albumDescription");
            return (Criteria) this;
        }

        public Criteria andUploadTimeIsNull() {
            addCriterion("UPLOAD_TIME is null");
            return (Criteria) this;
        }

        public Criteria andUploadTimeIsNotNull() {
            addCriterion("UPLOAD_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andUploadTimeEqualTo(Date value) {
            addCriterion("UPLOAD_TIME =", value, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeNotEqualTo(Date value) {
            addCriterion("UPLOAD_TIME <>", value, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeGreaterThan(Date value) {
            addCriterion("UPLOAD_TIME >", value, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("UPLOAD_TIME >=", value, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeLessThan(Date value) {
            addCriterion("UPLOAD_TIME <", value, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeLessThanOrEqualTo(Date value) {
            addCriterion("UPLOAD_TIME <=", value, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeIn(List<Date> values) {
            addCriterion("UPLOAD_TIME in", values, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeNotIn(List<Date> values) {
            addCriterion("UPLOAD_TIME not in", values, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeBetween(Date value1, Date value2) {
            addCriterion("UPLOAD_TIME between", value1, value2, "uploadTime");
            return (Criteria) this;
        }

        public Criteria andUploadTimeNotBetween(Date value1, Date value2) {
            addCriterion("UPLOAD_TIME not between", value1, value2, "uploadTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}