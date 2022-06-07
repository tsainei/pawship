import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['icon', 'description'];

  connect() {
    const box = this.iconTarget
    box.addEventListener("click", (event) =>{
      this.descriptionTarget.classList.toggle("red");
      console.log(this.descriptionTarget);
    })
  }



  disable() {
    this.buttonTarget.innerText = 'Bingo!';
    this.buttonTarget.setAttribute('disabled', '');
    this.linkTarget.classList.remove('d-none');
  }

  reset() {
    this.buttonTarget.innerText = 'Click me!';
    this.buttonTarget.removeAttribute('disabled');
    this.linkTarget.classList.add('d-none');
  }
}
