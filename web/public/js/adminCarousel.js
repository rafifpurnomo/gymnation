document.addEventListener("DOMContentLoaded", function () {
    const data = window.apiData;
    console.log(data.DataCarousel.data)
    console.log(data)
    loadDataCarousel(data)
})

function loadDataCarousel(data){
    const tbody = $("#carouselTable tbody");
    tbody.empty();

    if (!data.DataCarousel.data || data.DataCarousel.data.length ===0) {
        tbody.append(
            `<tr>
                <td colspan="4" style="text-align: center;">Data Not Found</td>
            </tr>`
        );
    }else{
        data.DataCarousel.data.forEach((carousel, index) => {
            const row = `
                    <tr>
                        <td>${index + 1}</td>
                        <td>
                            <img src="${carousel.img_path}" alt="${carousel.title}">
                        </td>
                        <td>${carousel.title}</td>
                        <td>
                            <button class="action-btn delete-btn" data-id="${
                                carousel.id_carousel
                            }" data-name="${carousel.title}">Delete</button>
                        </td>
                    </tr>
                `;

            tbody.append(row);
        });

        $(".delete-btn").on("click", function () {
            const userId = $(this).data("id");
            const name = $(this).data("name");
            deleteCarousel(userId, name);
        });
    }
}

function deleteCarousel(idCarousel, title){
    const confirmDelete = confirm(`Apakah kamu ingin mengedit carousel: ${idCarousel} ?`);
    if (confirmDelete) {
        Swal.fire({
            title: "success!",
            text: `Berhasil menghapus carousel ${title}`,
            icon: "success",
            confirmButtonText: "lanjutkan",
        });
    }
}