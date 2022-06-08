import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['icon', 'description', 'detail'];

  connect() {
    const box = this.iconTarget
    box.addEventListener("click", () => {
      this.descriptionTarget.classList.toggle('details');
      console.log(this.descriptionTarget);
    })
  }
}
