var connection = new signalR.HubConnectionBuilder().withUrl("/hub").build();
connection.on("ReloadData", function () {
    location.reload();
    //Refresh();
});


//SignalR for News section
function formatDate(dateString) {
    const date = new Date(dateString);
    const padTo2Digits = (num) => num.toString().padStart(2, '0');

    return [
        padTo2Digits(date.getMonth() + 1),
        padTo2Digits(date.getDate()),
        date.getFullYear()
    ].join('/') + ' ' + [
        padTo2Digits(date.getHours()),
        padTo2Digits(date.getMinutes()),
        padTo2Digits(date.getSeconds())
    ].join(':');
}
connection.on("NewsUpdated", function (news, isDeleted) {
    try {
        const row = document.querySelector(`tr[data-news-id="${news.newsId}"]`);

        //Modified a existing row
        if (row) {
            if (!isDeleted) {
                //Update
                row.querySelector(".news-group-name").textContent = news.newsGroup;
                row.querySelector(".news-img").innerHTML = `<img src="${news.image}" alt=""></td>`;
                row.querySelector(".news-title").textContent = news.title;
                row.querySelector(".news-createdby").textContent = news.createdByNavigation;
                row.querySelector(".news-created-date").textContent = formatDate(news.createdDate);
                row.querySelector(".news-status").textContent = news.status;
            }
            else {
                //Delete
                row.remove();
            }
        }
        else {
            //A new row added
            const tbody = document.getElementById("newsList");
            const rows = tbody.querySelectorAll("tr");

            if (rows.length < 10) {
                const newRow = `
                <tr data-news-id=${news.newsId}>
                    <td class="news-id">${news.newsId}</td>
                    <td class="news-group-name">${news.newsGroup}</td>
                    <td class="news-img"><img src="${news.image}" alt=""></td>
                    <td class="news-title">${news.title}</td>
                    <td class="news-createdby">${news.createdByNavigation}</td>
                    <td class="news-created-date">${formatDate(news.createdDate)}</td>
                    <td class="news-status">${news.status}</td>
                    <td>
                        <div class="badge badge-info"><a href="/adminsite/news/Edit?id=${news.newsId}">Update</a></div>
                        <div class="badge badge-danger">
                            <a href="/adminsite/news/Delete?id=${news.newsId}">Delete</a>
                        </div>
                    </td>
                    <td><div class="badge badge-success"><a href="/customersite/news/Detail?id=${news.newsId}" target="_blank">Details</a></div></td>
                </tr>
            `;
                tbody.innerHTML += newRow;
            }
        }
    } catch (error) {
        console.error("Error handling NewsUpdated event", error);
    }
});
//SignalR for News section


//SignalR for Product section
function formatPrice(price) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
    }).format(price);
}

connection.on("ProductUpdated", function (product, isDeleted) {
    try {
        const row = document.querySelector(`tr[data-product-id="${product.productId}"]`);

        // Modify an existing row
        if (row) {
            if (!isDeleted) {
                // Update
                row.querySelector("td:nth-child(2)").textContent = product.productName;
                row.querySelector("td:nth-child(3)").innerHTML = `<img src="${product.image}" alt="alt"/>`;
                row.querySelector("td:nth-child(4)").textContent = formatPrice(product.listPrice);
                row.querySelector("td:nth-child(5)").textContent = product.discount;
                row.querySelector("td:nth-child(6)").textContent = product.categoryName;
                row.querySelector("td:nth-child(7)").textContent = product.brandName;
                row.querySelector("td:nth-child(8) .badge").textContent = product.status;
                row.querySelector("td:nth-child(8) .badge").className = product.status === "Stocking" ? "badge badge-opacity-success" : "badge badge-opacity-danger";
            } else {
                // Delete
                row.remove();
            }
        } else {
            // Add a new row
            const tbody = document.querySelector("#myTable tbody");
            const rows = tbody.querySelectorAll("tr");

            if (rows.length < 10) {
                const newRow = `
                <tr data-product-id=${product.productId}>
                    <td>${product.productId}</td>
                    <td>${product.productName}</td>
                    <td><img src="${product.image}" alt="alt"/></td>
                    <td class="number">${formatPrice(product.listPrice)}</td>
                    <td>${product.discount}</td>
                    <td>${product.categoryName}</td>
                    <td>${product.brandName}</td>
                    <td>
                        <div class="${product.status === "Stocking" ? "badge badge-opacity-success" : "badge badge-opacity-danger"}">
                            ${product.status}
                        </div>
                    </td>
                    <td>
                        <div class="badge badge-info"><a href="/adminsite/product/Edit?id=${product.productId}">Update</a></div>
                        <div class="badge badge-danger"><a href="/adminsite/product/Delete?id=${product.productId}">Delete</a></div>
                    </td>
                    <td><div class="badge badge-success"><a href="/customersite/productdetail/Index?id=${product.productId}" target="_blank">Details</a></div></td>
                </tr>
            `;
                tbody.innerHTML += newRow;
            }
        }
    } catch (error) {
        console.error("Error handling ProductUpdated event", error);
    }
});
//SignalR for Product section
connection.start().then().catch(function (err) {
    return console.log(err.toString());
});