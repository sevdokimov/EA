package com.jetbrains.eaViewer

class Product {

  Long id

  String name

  static mapping = {
    table("projects")
    version(false)
    cache(true)
    id(type: 'int')
  }
}
