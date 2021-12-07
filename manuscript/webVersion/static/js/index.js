$(document).ready(function() {
    $('#id_continent').on('hidden.bs.select', function (e, clickedIndex, newValue, oldValue) {
        var continentSelected = $(this).val();
        // hide options form country menu
        var indexesToHide = [];
        $('#id_country option').each(function (index) {
            var continent = $(this).val().split('.')[0];
            if (continentSelected && continentSelected.indexOf(continent) < 0) {
                // if the continent for a country is not fund in the selected continents
                // the country is hidden from selected.
                indexesToHide.push(index);
            }
        });
        // go over widget options and hide as needed.
        var $menu = $('#id_country').siblings('.dropdown-menu')[0];
        $($menu).find('li').each(function(index) {
           if (indexesToHide.indexOf(index) > -1) {
               // this element needs to be hidden
               $(this).addClass('hidden');
               $(this).removeClass('selected');
           } else {
               // this element needs to be visible
               $(this).removeClass('hidden');
           }
        });
        // unselected previously selected values
        var selectedCountries = $('#id_country').val(),
            validSelectedCountries = [];
        if (selectedCountries && selectedCountries.length) {
            selectedCountries.forEach(function(item) {
                var continent = item.split('.')[0];
                if (continentSelected && continentSelected.indexOf(continent) > -1) {
                    // country is in a selected continent so it is valid
                    validSelectedCountries.push(item);
                }
            });
            // only valid countries are set
            $('#id_country').val(validSelectedCountries);
            // check that the selected label is correct
            var button = $('#id_country').siblings('button')[0],
                selectWidgetLabel = $(button).find('.filter-option')[0],
                currentSelection = $(selectWidgetLabel).text(),
                labelStillValid;
            if (validSelectedCountries) {
                var numValidSelectedCountries = validSelectedCountries.length;
                if (numValidSelectedCountries == 1) {
                    // since there is only one valid country, let's display the country name
                    $(button).attr('title', validSelectedCountries[0]);
                    $(selectWidgetLabel).text(validSelectedCountries[0]);
                } else {
                    // display the number of items selected
                    var labelMsg = numValidSelectedCountries + ' items selected';
                    $(button).attr('title', labelMsg);
                    $(selectWidgetLabel).text(labelMsg);
                }
            } else {
                $(button).attr('title', 'Nothing selected');
                $(selectWidgetLabel).text('Nothing selected');
            }
        }
    });
    $('#primateParasiteData').on('submit', function() {
        var excludeZeroPrevalence = $('#id_include_zero_prevalence').val();

        if (excludeZeroPrevalence == 1) {
            $('#myModal').modal('show');

            setTimeout(function() {
                $('#myModal').modal('hide');
            }, 5000);
        }
    });
});
