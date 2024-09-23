import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drawer"
export default class extends Controller {
  static targets = ["drawerMenu"]
  
  show() {
    this.drawerMenuTarget.show()
  }

  hide() {
    this.drawerMenuTarget.hide()
  }
}
