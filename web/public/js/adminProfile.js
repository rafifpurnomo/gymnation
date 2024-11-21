document.addEventListener("DOMContentLoaded", function () {
    logout();
});

function logout(){
    const token = localStorage.getItem('laravel_session')
    console.log(token)
}