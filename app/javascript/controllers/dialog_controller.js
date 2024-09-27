import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["dialog", "denyClose"];

  connect() {
    if (this.hasDenyCloseTarget) {
      this.dialogTarget.addEventListener("sl-request-close", (event) => {
        // Check for unfilled inputs
        const inputs = this.dialogTarget.querySelectorAll(
          'input[data-confirm-discard="true"], textarea[data-confirm-discard="true"]'
        );
        const hasUnsavedChanges = Array.from(inputs).some(
          (input) => input.value !== ""
        );

        if (hasUnsavedChanges) {
          event.preventDefault(); // Prevent the default close action

          // Show a confirmation dialog if there are unfilled inputs
          const userConfirmed = confirm(
            "You have unsaved changes. Do you really want to close the form?"
          );

          if (userConfirmed) {
            // If the user chooses to close the form, dispatch a custom event to close it
            this.hide();
          }
        }
      });
    }
  }

  show() {
    this.dialogTarget.show();
  }

  hide() {
    this.dialogTarget.hide();
    const inputs = this.dialogTarget.querySelectorAll(
      'input[data-confirm-discard="true"], textarea[data-confirm-discard="true"]'
    );
    inputs.forEach((input) => {
      input.value = "";
    });
  }
}
