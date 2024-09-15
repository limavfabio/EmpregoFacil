import { Controller } from "@hotwired/stimulus"
import { createIcons, ThumbsUp, MessagesSquare, Share2 } from 'lucide';

// Connects to data-controller="lucide-icons"
export default class extends Controller {
  connect() {
    createIcons({
      icons: {
        ThumbsUp,
        MessagesSquare,
        Share2
      }
    });
  }
}
