import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['icon', 'description']

  connect() {

    const box = this.iconTarget
    box.addEventListener("click", () => {
      this.descriptionTarget.classList.toggle('details');
      this.iconTarget.classList.toggle('change-icon-color');
    })
  }
}
