import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Get Paid", "Fast"],
      typeSpeed: 50,
      loop: true
    })
  }
}
