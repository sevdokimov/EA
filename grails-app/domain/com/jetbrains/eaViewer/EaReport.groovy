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

  Integer suggestedAssignee

  String comments

  Integer reporter

  EaIssue issue

  static mapping = {
    version(false)
    cache(true)
    id(type: 'int')
    BUILD(type: 'int')
    branchNumber(type: 'int')
    os(column: 'os')
    timeAdded(column: 'TIME_ADDED')
    reporter(column: 'WHO_ADDED')
    comments(type: 'text')
    issue(column: 'PROBLEM_ID')
  }

  static constraints = {
    attachmentNames(nullable: true)
    linkerId(nullable: true)
  }
}
