# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@rails/ujs", to: "https://cdn.skypack.dev/@rails/ujs"
pin "bootstrap", to: "https://cdn.skypack.dev/bootstrap"
pin "@popperjs/core", to: "https://cdn.skypack.dev/@popperjs/core"
pin_all_from "app/javascript/controllers", under: "controllers"
