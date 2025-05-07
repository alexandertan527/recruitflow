import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true,
      dateFormat: "H:i d-m-Y",
    });
  }
}
