
// Cocoon
console.log("here")

$("#inventoryItems a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');

$('#inventoryItems').on('cocoon:after-insert',
    function () {
        console.log("inserting new line item")
        console.log($('.inventory-line-item-fields'))

        $(".inventory-line-item-fields a.add_fields").
            data("association-insertion-position", 'before').
            data("association-insertion-node", 'this');

        $('.inventory-line-item-fields').on('cocoon:after-insert',
            function () {

                $(this).find(".food_from_list").remove()

                //$(this).children().first().children().first().remove()
                // $(this).children(".food_from_list").remove();
                $(this).find("a.add_fields").hide();
            });
    });
