document.addEventListener("DOMContentLoaded", function () {
    const data = window.apiData;
    const token = window.apiData.token;
    console.log(token);

    submit(data, token);
});

function submit(data, token) {
    document
        .getElementById("resetPasswordBtn")
        .addEventListener("click", function (e) {
            e.preventDefault();
            const newPass = document.getElementById("newPassword").value;
            const confirmPass = document.getElementById("confirmPass").value;

            if (newPass !== confirmPass) {
                Swal.fire({
                    title: "Error!",
                    text: "Password baru dan konfirmasi password tidak sama.",
                    icon: "error",
                    confirmButtonText: "Coba Lagi",
                });
            } else {
                resetPass(data, newPass, token);
            }
        });
}

function resetPass(data, newPassword, token) {
    fetch(`/resetPassword/${token}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]')
                .content,
        },
        body: JSON.stringify({
            id_user: data.userData.id_user,
            newPassword: newPassword,
            token: token,
        }),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                Swal.fire({
                    title: "success!",
                    text: `Berhasil me-reset passowrd`,
                    icon: "success",
                    confirmButtonText: "lanjutkan",
                });
            } else {
                Swal.fire({
                    title: "Error!",
                    text: data.error || "Gagal me-reset passowrd",
                    icon: "error",
                    confirmButtonText: "Coba Lagi",
                });
            }
            logout();
        })
        .catch((error) => {
            console.error("Error ketika menghapus me-reset passowrd:", error);
            Swal.fire({
                title: "Error!",
                text: error || "Terjadi kesalahan saat me-reset passowrd",
                icon: "error",
                confirmButtonText: "Coba Lagi",
            });
        });
}

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