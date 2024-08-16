import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["navigation"]

  connect() {
    window.addEventListener('scroll', this.toggleSticky.bind(this));
  }

  disconnect() {
    window.removeEventListener('scroll', this.toggleSticky.bind(this));
  }

  toggleSticky() {
    if (window.scrollY > 0) {
      this.navigationTarget.classList.add("sticky");
    } else {
      this.navigationTarget.classList.remove("sticky");
    }
  }
}
