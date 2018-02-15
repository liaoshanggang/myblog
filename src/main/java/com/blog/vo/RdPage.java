package com.blog.vo;

/**
 * 分页控制类,封装了相关分页时所需的信息，包括：<br>
 * <pre>
 * pageNo - 页号
 * pageSize - 每页显示记录数
 * totalRow - 总行数
 * totalPage - 总页数
 * previous - 是否有上一页
 * next - 是否有下一页
 * first - 是否是每一页
 * last - 是否是最后一页
 * </pre>
 *
 * @param <T> Map 或者  实体
 * @author james
 */
public class RdPage<T> {
    //每页的行数
    public static final int R5 = 5;
    public static final int R10 = 10;
    public static final int R15 = 15;
    public static final int R20 = 20;
    public static final int R30 = 30;

    //总行数
    private int totalRow = 0;
    //当前的页号
    private int pageNo = 1;
    //每页的记录数
    public int pageSize = R5;
    //总页数
    private int totalPage = 0;

    //是否有上一页
    private boolean previous;
    //是否有下一页
    private boolean next;
    //是否是第一页
    private boolean first;
    //是否是最后一页
    private boolean last;
    //本页数据首条记录索引
    private int firstIndex;
    //本页数据最后条记录索引
    private int lastIndex;
    //查询条件
    private T queryObject;

    public RdPage() {
        this(0);

    }

    public RdPage(int totalRow) {
        this.totalRow = totalRow;
        setTotalRow(totalRow);
    }

    public RdPage(T queryObject) {
        this.queryObject = queryObject;
    }

    public RdPage(int totalRow, T queryObject) {
        setTotalRow(totalRow);
        this.queryObject = queryObject;
    }

    /**
     * 得到总记录数
     *
     * @return
     */
    public int getTotalRow() {
        return totalRow;
    }

    /**
     * 自动算出页数
     *
     * @param totalRow
     */
    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
    }

    /**
     * 得到当前的页号
     *
     * @return
     */
    public int getPageNo() {
        return pageNo;
    }

    /**
     * 得到下一页的页号
     *
     * @return
     */
    public int getNextNo() {
        if (this.getNext()) {
            return pageNo + 1;
        } else {
            return totalPage;
        }
    }

    /**
     * 得到上一页的页号
     *
     * @return
     */
    public int getPrevNo() {
        if (this.getPrevious()) {
            return pageNo - 1;
        } else {
            return pageNo;
        }
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    /**
     * 得到每页显示的记录数
     *
     * @return
     */
    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 得到总页数
     *
     * @return
     */
    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    /**
     * 是否有下一页
     *
     * @return
     */
    public boolean getNext() {
        if (pageNo == 1 && pageNo < getTotalPage()) {
            return true;
        }
        if (pageNo > 1 && pageNo < getTotalPage()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 是否有上一页
     *
     * @return
     */
    public boolean getPrevious() {
        if (getPageNo() > 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 是否是第一页
     *
     * @return
     */
    public boolean getFirst() {
        return (getPageNo() > 1 ? false : true);
    }

    /**
     * 是否是最后一页
     *
     * @return
     */
    public boolean getLast() {
        return (getPageNo() == getTotalPage() ? true : false);
    }

    /**
     * 得到本页数据首条记录索引
     *
     * @return
     */
    public int getFirstIndex() {
        return firstIndex;
    }

    /**
     * 得到本页数据最后一条记录索引
     *
     * @return
     */
    public int getLastIndex() {
        return lastIndex;
    }

    /**
     * 得到查询分页的条件
     *
     * @return
     */
    public T getQueryObject() {
        return queryObject;
    }

    /**
     * 设置查询分页的条件
     *
     * @return
     */
    public void setQueryObject(T queryObject) {
        this.queryObject = queryObject;
    }

    public void setFirstIndex(int firstIndex) {
        this.firstIndex = firstIndex;
    }

    public void setLastIndex(int lastIndex) {
        this.lastIndex = lastIndex;
    }
    @Override
    public String toString() {
        return "Page{" +
                "总记录数=" + getTotalRow() +
                ", 当前的页号=" + getPageNo() +
                ", 每页记录数=" + getPageSize() +
                ", 总页数=" + getTotalPage() +
                ", 是否有上一页:=" + getPrevious() +
                ", 是否有下一页:=" + getNext() +
                ", 是否是第一页:=" + getFirst() +
                ", 是否是最后页:=" + getLast() +
                ", 本页数据首条记录索引==" + getFirstIndex() +
                ", 本页数据最后条记录索引=" + getLastIndex() +
                '}';
    }
}
