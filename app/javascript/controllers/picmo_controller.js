import { Controller } from "@hotwired/stimulus"
import { createPicker } from 'picmo';

// Connects to data-controller="picmo"
export default class extends Controller {
  static targets = ["emoji"]
  connect() {
    console.log("picmo is here")
  }

  fire(ev){
    const rootElement = document.querySelector('#picmo');
    const picker = createPicker({ rootElement}, { referenceElement: rootElement, position: 'bottom' });
    // The picker emits an event when an emoji is selected. Do with it as you will!
    picker.addEventListener('emoji:select', event => {
      console.log('Emoji selected:', event.emoji);
      console.log(this.emojiTarget.insertAdjacentHTML("beforebegin", event.emoji))
    });
  }
}
