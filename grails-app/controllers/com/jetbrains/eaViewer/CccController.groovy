package com.jetbrains.eaViewer

/**
 * @author Sergey Evdokimov
 */
class CccController {

  def foo() {
    render EaReport.countByOs(TrackerOs.load(5))
  }

}
