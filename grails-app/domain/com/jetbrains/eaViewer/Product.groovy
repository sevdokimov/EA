package com.jetbrains.eaViewer

class Product {

  Integer id

  String name

  static mapping = {
    table("products")
    version(false)
    cache(true)
    id(type: 'int')
  }
}
