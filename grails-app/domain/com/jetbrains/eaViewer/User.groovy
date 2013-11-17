package com.jetbrains.eaViewer

/**
 * @author Sergey Evdokimov
 */
class User {

  Long id

  String email

  String name

  String username

  int nameVisible

  static mapping = {
    id(column: 'userID')
    table("jiveUser")
    version(false)
    cache(true)
    nameVisible(column: 'nameVisible')
  }

}
