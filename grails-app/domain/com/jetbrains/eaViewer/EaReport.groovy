package com.jetbrains.eaViewer

/**
 * @author Sergey Evdokimov
 */
class EaReport {

  Long id;

  String attachmentNames

  long branchNumber

  long BUILD

  long timeAdded

  TrackerOs os

  Product product

  Integer linkerId

  static mapping = {
    version(false)
    cache(true)
    id(type: 'int')
    BUILD(type: 'int')
    branchNumber(type: 'int')
    os(column: 'os')
    timeAdded(column: 'TIME_ADDED')
  }

  static constraints = {
    attachmentNames(nullable: true)
    linkerId(nullable: true)
  }
}
