package com.jetbrains.eaViewer

import java.text.DateFormat

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

  def byReportCount(String since, String until) {
    def format = DateFormat.getDateInstance(DateFormat.MEDIUM)

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
      sinceLong = format.parse(until).time

      if (sinceLong >= untilLong) {
        sinceLong = untilLong - 20*24*60*60*1000
      }
    }

//    sessionFactory.currentSession.connection().prepareStatement("""
//select
//from (select r.timeAdded from ea_report r where r.timeAdded >= ? and r.timeAdded < ?)
//""")

    def data = EaReport.executeQuery("""
select ceil(r.timeAdded / (24*60*60*1000)), count(r)
from EaReport r
where r.timeAdded >= :sinceLong and r.timeAdded < :untilLong
group by ceil(r.timeAdded / (24*60*60*1000))
""", [sinceLong:sinceLong, untilLong: untilLong])

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

    [data: reportData, since: new Date(sinceLong), until: new Date(untilLong)]
  }

}

class ReportsInfo {
  int year;
  int month;
  int day;

  int count;
}