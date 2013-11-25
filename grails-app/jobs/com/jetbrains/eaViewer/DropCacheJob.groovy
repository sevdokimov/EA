package com.jetbrains.eaViewer

/**
 * @author Sergey Evdokimov
 */
class DropCacheJob {

  static triggers = {
    simple name: 'mySimpleTrigger', startDelay: 5*60*1000, repeatInterval: 5*60*1000
  }

  def sessionFactory

  def execute() {
    sessionFactory.getCache().evictQueryRegions()
    sessionFactory.getCache().evictEntityRegions()
    sessionFactory.getCache().evictCollectionRegions()
    sessionFactory.getCache().evictDefaultQueryRegion()
  }

}
