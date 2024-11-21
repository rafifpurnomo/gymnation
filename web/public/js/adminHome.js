function logout() {
    fetch('/logout', {
        method: 'POST',
        credentials: 'include',
        headers: {
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json'
        }
    })
    .then(response => {
        if (response.ok) {
            window.location.href = '/loginPage';
        }
    })
    .catch(error => {
        console.error('Logout error:', error);
    });
}