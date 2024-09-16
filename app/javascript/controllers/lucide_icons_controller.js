import { Controller } from "@hotwired/stimulus"
import { createIcons, ThumbsUp, MessagesSquare, Share2, ThumbsDown } from 'lucide';

// Connects to data-controller="lucide-icons"
export default class extends Controller {
  connect() {
    createIcons({
      icons: {
        ThumbsUp,
        ThumbsDown,
        MessagesSquare,
        Share2
      }
    });
  }
}
