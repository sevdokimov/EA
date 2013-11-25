dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
          logSql = true

          url = "jdbc:mysql://app4.labs.intellij.net:3306/eadb"
          username = "ea-ro"
          password = "neHeelvOukGoas"

          driverClassName = "com.mysql.jdbc.Driver"
          dialect = org.hibernate.dialect.MySQL5InnoDBDialect

          autoReconnect=true
          validationQuery="SELECT 1"

          dbCreate = "validate" // one of 'create', 'create-drop', 'update', 'validate', ''
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
      dataSource {
        url = "jdbc:mysql://app4.labs.intellij.net:3306/eadb"
        username = "ea-ro"
        password = "neHeelvOukGoas"

        driverClassName = "com.mysql.jdbc.Driver"
        dialect = org.hibernate.dialect.MySQL5InnoDBDialect

        autoReconnect=true
        validationQuery="SELECT 1"

        dbCreate = "validate" // one of 'create', 'create-drop', 'update', 'validate', ''
      }
    }
}
