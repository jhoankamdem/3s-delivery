import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {
  connect() {
    this.updateLocation()
    this.interval = setInterval(() = {
      this.updateLocation()
    }, 5000)
  }

  disconnect(){
    clearInterval(this.interval)
  }

  updateLocation(){
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        fetch('/locations', {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken
          },
          body: JSON.stringify({
            location: {
              latitude: position.coords.latitude,
              longitude: position.coords.longitude
            }
          })
        })
      })
    }
  }
}
 