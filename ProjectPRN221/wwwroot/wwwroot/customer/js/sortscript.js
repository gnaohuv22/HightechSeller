// Sắp xếp
$('#sortSelect').change(function () {
    var selectedValue = $(this).val();
    $.ajax({
        url: '/customersite/shop',
        type: 'GET',
        data: { sort: selectedValue },
        success: function (result) {
            // Cập nhật giao diện với danh sách sản phẩm mới
        }
    });
});

// Lọc theo khoảng giá
$('#priceRangeSlider').slider({
    range: true,
    min: 0,
    max: 100000000,
    values: [0, 100000000],
    slide: function (event, ui) {
        var minPrice = ui.values[0];
        var maxPrice = ui.values[1];
        $.ajax({
            url: '/customersite/shop',
            type: 'GET',
            data: { minPrice: minPrice, maxPrice: maxPrice },
            success: function (result) {
                // Cập nhật giao diện với danh sách sản phẩm mới
            }
        });
    }
});
