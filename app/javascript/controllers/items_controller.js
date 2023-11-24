import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="items"
export default class extends Controller {
  static targets = ["image"];

  connect() {
    this.index = 0;
  }

  showPreviousImage() {
    if (this.index > 0) {
      this.imageTargets[this.index].classList.add("hidden");
      this.index -= 1;
      this.imageTargets[this.index].classList.remove("hidden");
    }
  }
  showNextImage() {
    if (this.index < this.imageTargets.length - 1) {
      this.imageTargets[this.index].classList.add("hidden");
      this.index += 1;
      this.imageTargets[this.index].classList.remove("hidden");
    }
  }
}
