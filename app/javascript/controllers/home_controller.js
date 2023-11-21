import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="home"
export default class extends Controller {
  static targets = ["menu", "dropdown"];

  connect() {}

  showMobileMenu = () => {
    this.menuTarget.classList.remove("translate-x-full");
    this.menuTarget.classList.add("translate-x-0");
  };

  hideMobileMenu = () => {
    this.menuTarget.classList.remove("translate-x-0");
    this.menuTarget.classList.add("translate-x-full");
  };

  showDropdownMenu = () => {
    this.dropdownTarget.classList.remove("-translate-y-[32rem]");
    this.dropdownTarget.classList.add("translate-y-0");
  };

  toggleDropdownMenu = () => {
    if (this.dropdownTarget.classList.contains("-translate-y-[60rem]")) {
      this.dropdownTarget.classList.remove("-translate-y-[60rem]");
      this.dropdownTarget.classList.add("translate-y-0");
    } else {
      this.dropdownTarget.classList.remove("translate-y-0");
      this.dropdownTarget.classList.add("-translate-y-[60rem]");
    }
  };
}
