package com.jetbrains.eaViewer

/**
 * @author Sergey Evdokimov
 */
class EaIssue {

  Long id;

  String name

  Integer assignee

  boolean status

  static mapping = {
    table("ea_problems")
    version(false)
    cache(true)
    id(type: 'int')
  }


  static constraints = {
    assignee(nullable: true)
  }
}
