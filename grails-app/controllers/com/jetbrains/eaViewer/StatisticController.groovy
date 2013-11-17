package com.jetbrains.eaViewer

import java.text.SimpleDateFormat

/**
 * @author Sergey Evdokimov
 */
class StatisticController {

  static defaultAction = "byReportCount"

  def sessionFactory

  def byOs() {
    def data = EaReport.executeQuery("""
select r.os, count(r)
from EaReport r
group by r.os
""")

    Map<TrackerOs, Number> map = [:]
    for (Object[] d : data) {
      map.put(d[0], d[1])
    }

    [data: map]
  }

  def byReportCount(String since, String until, Integer productId) {
    def format = new SimpleDateFormat("yyyy-MM-dd")

    long sinceLong
    long untilLong

    if (!until) {
      untilLong = System.currentTimeMillis()
    }
    else {
      untilLong = format.parse(until).time
    }

    if (!since) {
      sinceLong = untilLong - 20*24*60*60*1000
    }
    else {
      sinceLong = format.parse(since).time

      if (sinceLong >= untilLong) {
        sinceLong = untilLong - 20*24*60*60*1000
      }
    }

//    sessionFactory.currentSession.connection().prepareStatement("""
//select
//from (select r.timeAdded from ea_report r where r.timeAdded >= ? and r.timeAdded < ?)
//""")

    def args = [sinceLong:sinceLong, untilLong: untilLong]

    String productStatement = ""
    if (productId) {
      productStatement =  "and r.product = :product"
      args.put("product", Product.load(productId))
    }

    def data = EaReport.executeQuery("""
select ceil(r.timeAdded / (24*60*60*1000)), count(r)
from EaReport r
where r.timeAdded >= :sinceLong and r.timeAdded < :untilLong
      ${productStatement}
group by ceil(r.timeAdded / (24*60*60*1000))
""", args)

    List<ReportsInfo> reportData = []

    def calendar = Calendar.getInstance()

    for (Object[] array : data) {
      long time = ((long)array[0]) * 24*60*60*1000

      calendar.setTime(new Date(time))

      ReportsInfo r = new ReportsInfo()

      r.year = calendar.get(Calendar.YEAR)
      r.month = calendar.get(Calendar.MONTH)
      r.day = calendar.get(Calendar.DAY_OF_MONTH)

      r.count = array[1]

      reportData << r;
    }

    [data: reportData, sinceDate: format.format(new Date(sinceLong)), untilDate: format.format(new Date(untilLong)), productId: productId]
  }

  def bestLinker() {
    def data = EaReport.executeQuery("""
select r.linkerId, count(r) as ccc
from EaReport r
where r.linkerId > 0
  and r.linkerId <> 73189
group by r.linkerId
order by ccc desc
""", [max: 30])
    // 73189 - ID of Exception Analizer account

    Map<String, Number> map = new LinkedHashMap<>()
    for (Object[] array : data ) {
      Integer linkerId = array[0]

      String userName = User.get(linkerId)?.name ?: linkerId

      map.put(userName, array[1])
    }

    [data: map]
  }

  def byProducts() {
    def data = EaReport.executeQuery("""
select r.product, count(r)
from EaReport r
group by r.product
""")

    Map<Product, Number> map = [:]
    for (Object[] d : data) {
      map.put(d[0], d[1])
    }

    [data: map]
  }

  def issueProducers(String state) {
    String statusCondition = ""
    if (state == "open") {
      statusCondition = "and i.status = 1"
    }
    else if (state == "closed") {
      statusCondition = "and i.status = 0"
    }

    def data = EaReport.executeQuery("""
select i.assignee, count(i) as ccc
from EaIssue i
where i.assignee > 0
 ${statusCondition}
group by i.assignee
order by ccc desc
""", [max: 30])
    // 73189 - ID of Exception Analizer account

    Map<String, Number> map = new LinkedHashMap<>()
    for (Object[] array : data ) {
      Integer userId = array[0]

      String userName = User.get(userId)?.name ?: userId

      map.put(userName, array[1])
    }

    [data: map, state: state]
  }
}

class ReportsInfo {
  int year;
  int month;
  int day;

  int count;
}