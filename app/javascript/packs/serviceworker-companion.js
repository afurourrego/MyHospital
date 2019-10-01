if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/serviceworker.js', { scope: '/app/' })
    .then(function (reg) {
      console.log('[Companion]', 'Service worker registered!');
    });
}
