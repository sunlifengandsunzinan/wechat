package cn.com.loan.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class RegionExample implements Serializable {
	/**
	  * @Fields serialVersionUID : 序列化id
	  */
	private static final long serialVersionUID = -3284003148534334713L;

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_region
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_region
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_region
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public RegionExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_region
     *
     * @mbggenerated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_region
     *
     * @mbggenerated
     */
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRegionnameIsNull() {
            addCriterion("regionname is null");
            return (Criteria) this;
        }

        public Criteria andRegionnameIsNotNull() {
            addCriterion("regionname is not null");
            return (Criteria) this;
        }

        public Criteria andRegionnameEqualTo(String value) {
            addCriterion("regionname =", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameNotEqualTo(String value) {
            addCriterion("regionname <>", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameGreaterThan(String value) {
            addCriterion("regionname >", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameGreaterThanOrEqualTo(String value) {
            addCriterion("regionname >=", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameLessThan(String value) {
            addCriterion("regionname <", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameLessThanOrEqualTo(String value) {
            addCriterion("regionname <=", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameLike(String value) {
            addCriterion("regionname like", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameNotLike(String value) {
            addCriterion("regionname not like", value, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameIn(List<String> values) {
            addCriterion("regionname in", values, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameNotIn(List<String> values) {
            addCriterion("regionname not in", values, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameBetween(String value1, String value2) {
            addCriterion("regionname between", value1, value2, "regionname");
            return (Criteria) this;
        }

        public Criteria andRegionnameNotBetween(String value1, String value2) {
            addCriterion("regionname not between", value1, value2, "regionname");
            return (Criteria) this;
        }

        public Criteria andParentregionidIsNull() {
            addCriterion("parentregionid is null");
            return (Criteria) this;
        }

        public Criteria andParentregionidIsNotNull() {
            addCriterion("parentregionid is not null");
            return (Criteria) this;
        }

        public Criteria andParentregionidEqualTo(String value) {
            addCriterion("parentregionid =", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidNotEqualTo(String value) {
            addCriterion("parentregionid <>", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidGreaterThan(String value) {
            addCriterion("parentregionid >", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidGreaterThanOrEqualTo(String value) {
            addCriterion("parentregionid >=", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidLessThan(String value) {
            addCriterion("parentregionid <", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidLessThanOrEqualTo(String value) {
            addCriterion("parentregionid <=", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidLike(String value) {
            addCriterion("parentregionid like", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidNotLike(String value) {
            addCriterion("parentregionid not like", value, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidIn(List<String> values) {
            addCriterion("parentregionid in", values, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidNotIn(List<String> values) {
            addCriterion("parentregionid not in", values, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidBetween(String value1, String value2) {
            addCriterion("parentregionid between", value1, value2, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andParentregionidNotBetween(String value1, String value2) {
            addCriterion("parentregionid not between", value1, value2, "parentregionid");
            return (Criteria) this;
        }

        public Criteria andRegioncodeIsNull() {
            addCriterion("regioncode is null");
            return (Criteria) this;
        }

        public Criteria andRegioncodeIsNotNull() {
            addCriterion("regioncode is not null");
            return (Criteria) this;
        }

        public Criteria andRegioncodeEqualTo(String value) {
            addCriterion("regioncode =", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeNotEqualTo(String value) {
            addCriterion("regioncode <>", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeGreaterThan(String value) {
            addCriterion("regioncode >", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeGreaterThanOrEqualTo(String value) {
            addCriterion("regioncode >=", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeLessThan(String value) {
            addCriterion("regioncode <", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeLessThanOrEqualTo(String value) {
            addCriterion("regioncode <=", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeLike(String value) {
            addCriterion("regioncode like", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeNotLike(String value) {
            addCriterion("regioncode not like", value, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeIn(List<String> values) {
            addCriterion("regioncode in", values, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeNotIn(List<String> values) {
            addCriterion("regioncode not in", values, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeBetween(String value1, String value2) {
            addCriterion("regioncode between", value1, value2, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegioncodeNotBetween(String value1, String value2) {
            addCriterion("regioncode not between", value1, value2, "regioncode");
            return (Criteria) this;
        }

        public Criteria andRegiongradeIsNull() {
            addCriterion("regiongrade is null");
            return (Criteria) this;
        }

        public Criteria andRegiongradeIsNotNull() {
            addCriterion("regiongrade is not null");
            return (Criteria) this;
        }

        public Criteria andRegiongradeEqualTo(String value) {
            addCriterion("regiongrade =", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeNotEqualTo(String value) {
            addCriterion("regiongrade <>", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeGreaterThan(String value) {
            addCriterion("regiongrade >", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeGreaterThanOrEqualTo(String value) {
            addCriterion("regiongrade >=", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeLessThan(String value) {
            addCriterion("regiongrade <", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeLessThanOrEqualTo(String value) {
            addCriterion("regiongrade <=", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeLike(String value) {
            addCriterion("regiongrade like", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeNotLike(String value) {
            addCriterion("regiongrade not like", value, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeIn(List<String> values) {
            addCriterion("regiongrade in", values, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeNotIn(List<String> values) {
            addCriterion("regiongrade not in", values, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeBetween(String value1, String value2) {
            addCriterion("regiongrade between", value1, value2, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andRegiongradeNotBetween(String value1, String value2) {
            addCriterion("regiongrade not between", value1, value2, "regiongrade");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalIsNull() {
            addCriterion("provincialcapital is null");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalIsNotNull() {
            addCriterion("provincialcapital is not null");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalEqualTo(Integer value) {
            addCriterion("provincialcapital =", value, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalNotEqualTo(Integer value) {
            addCriterion("provincialcapital <>", value, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalGreaterThan(Integer value) {
            addCriterion("provincialcapital >", value, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalGreaterThanOrEqualTo(Integer value) {
            addCriterion("provincialcapital >=", value, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalLessThan(Integer value) {
            addCriterion("provincialcapital <", value, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalLessThanOrEqualTo(Integer value) {
            addCriterion("provincialcapital <=", value, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalIn(List<Integer> values) {
            addCriterion("provincialcapital in", values, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalNotIn(List<Integer> values) {
            addCriterion("provincialcapital not in", values, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalBetween(Integer value1, Integer value2) {
            addCriterion("provincialcapital between", value1, value2, "provincialcapital");
            return (Criteria) this;
        }

        public Criteria andProvincialcapitalNotBetween(Integer value1, Integer value2) {
            addCriterion("provincialcapital not between", value1, value2, "provincialcapital");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_region
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_region
     *
     * @mbggenerated
     */
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