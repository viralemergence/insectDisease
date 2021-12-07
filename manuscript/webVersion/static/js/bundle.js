(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({"/Users/tomlin/RCN/parasites/parasites/static/js/index.js":[function(require,module,exports){
'use strict';

$(document).ready(function () {
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
        $($menu).find('li').each(function (index) {
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
            selectedCountries.forEach(function (item) {
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
    $('#primateParasiteData').on('submit', function () {
        var excludeZeroPrevalence = $('#id_include_zero_prevalence').val();

        if (excludeZeroPrevalence == 1) {
            $('#myModal').modal('show');

            setTimeout(function () {
                $('#myModal').modal('hide');
            }, 5000);
        }
    });
});

},{}]},{},["/Users/tomlin/RCN/parasites/parasites/static/js/index.js"])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJwYXJhc2l0ZXMvc3RhdGljL2pzL2luZGV4LmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBOzs7QUNBQSxFQUFBLFFBQUEsRUFBQSxLQUFBLENBQWtCLFlBQVc7QUFDekIsTUFBQSxlQUFBLEVBQUEsRUFBQSxDQUFBLGtCQUFBLEVBQTBDLFVBQUEsQ0FBQSxFQUFBLFlBQUEsRUFBQSxRQUFBLEVBQUEsUUFBQSxFQUErQztBQUNyRixZQUFJLG9CQUFvQixFQUFBLElBQUEsRUFBeEIsR0FBd0IsRUFBeEI7QUFDQTtBQUNBLFlBQUksZ0JBQUosRUFBQTtBQUNBLFVBQUEsb0JBQUEsRUFBQSxJQUFBLENBQTZCLFVBQUEsS0FBQSxFQUFpQjtBQUMxQyxnQkFBSSxZQUFZLEVBQUEsSUFBQSxFQUFBLEdBQUEsR0FBQSxLQUFBLENBQUEsR0FBQSxFQUFoQixDQUFnQixDQUFoQjtBQUNBLGdCQUFJLHFCQUFxQixrQkFBQSxPQUFBLENBQUEsU0FBQSxJQUF6QixDQUFBLEVBQW1FO0FBQy9EO0FBQ0E7QUFDQSw4QkFBQSxJQUFBLENBQUEsS0FBQTtBQUNIO0FBTkwsU0FBQTtBQVFBO0FBQ0EsWUFBSSxRQUFRLEVBQUEsYUFBQSxFQUFBLFFBQUEsQ0FBQSxnQkFBQSxFQUFaLENBQVksQ0FBWjtBQUNBLFVBQUEsS0FBQSxFQUFBLElBQUEsQ0FBQSxJQUFBLEVBQUEsSUFBQSxDQUF5QixVQUFBLEtBQUEsRUFBZ0I7QUFDdEMsZ0JBQUksY0FBQSxPQUFBLENBQUEsS0FBQSxJQUErQixDQUFuQyxDQUFBLEVBQXVDO0FBQ25DO0FBQ0Esa0JBQUEsSUFBQSxFQUFBLFFBQUEsQ0FBQSxRQUFBO0FBQ0Esa0JBQUEsSUFBQSxFQUFBLFdBQUEsQ0FBQSxVQUFBO0FBSEosYUFBQSxNQUlPO0FBQ0g7QUFDQSxrQkFBQSxJQUFBLEVBQUEsV0FBQSxDQUFBLFFBQUE7QUFDSDtBQVJKLFNBQUE7QUFVQTtBQUNBLFlBQUksb0JBQW9CLEVBQUEsYUFBQSxFQUF4QixHQUF3QixFQUF4QjtBQUFBLFlBQ0kseUJBREosRUFBQTtBQUVBLFlBQUkscUJBQXFCLGtCQUF6QixNQUFBLEVBQW1EO0FBQy9DLDhCQUFBLE9BQUEsQ0FBMEIsVUFBQSxJQUFBLEVBQWU7QUFDckMsb0JBQUksWUFBWSxLQUFBLEtBQUEsQ0FBQSxHQUFBLEVBQWhCLENBQWdCLENBQWhCO0FBQ0Esb0JBQUkscUJBQXFCLGtCQUFBLE9BQUEsQ0FBQSxTQUFBLElBQXVDLENBQWhFLENBQUEsRUFBb0U7QUFDaEU7QUFDQSwyQ0FBQSxJQUFBLENBQUEsSUFBQTtBQUNIO0FBTEwsYUFBQTtBQU9BO0FBQ0EsY0FBQSxhQUFBLEVBQUEsR0FBQSxDQUFBLHNCQUFBO0FBQ0E7QUFDQSxnQkFBSSxTQUFTLEVBQUEsYUFBQSxFQUFBLFFBQUEsQ0FBQSxRQUFBLEVBQWIsQ0FBYSxDQUFiO0FBQUEsZ0JBQ0ksb0JBQW9CLEVBQUEsTUFBQSxFQUFBLElBQUEsQ0FBQSxnQkFBQSxFQUR4QixDQUN3QixDQUR4QjtBQUFBLGdCQUVJLG1CQUFtQixFQUFBLGlCQUFBLEVBRnZCLElBRXVCLEVBRnZCO0FBQUEsZ0JBQUEsZUFBQTtBQUlBLGdCQUFBLHNCQUFBLEVBQTRCO0FBQ3hCLG9CQUFJLDRCQUE0Qix1QkFBaEMsTUFBQTtBQUNBLG9CQUFJLDZCQUFKLENBQUEsRUFBb0M7QUFDaEM7QUFDQSxzQkFBQSxNQUFBLEVBQUEsSUFBQSxDQUFBLE9BQUEsRUFBd0IsdUJBQXhCLENBQXdCLENBQXhCO0FBQ0Esc0JBQUEsaUJBQUEsRUFBQSxJQUFBLENBQTBCLHVCQUExQixDQUEwQixDQUExQjtBQUhKLGlCQUFBLE1BSU87QUFDSDtBQUNBLHdCQUFJLFdBQVcsNEJBQWYsaUJBQUE7QUFDQSxzQkFBQSxNQUFBLEVBQUEsSUFBQSxDQUFBLE9BQUEsRUFBQSxRQUFBO0FBQ0Esc0JBQUEsaUJBQUEsRUFBQSxJQUFBLENBQUEsUUFBQTtBQUNIO0FBWEwsYUFBQSxNQVlPO0FBQ0gsa0JBQUEsTUFBQSxFQUFBLElBQUEsQ0FBQSxPQUFBLEVBQUEsa0JBQUE7QUFDQSxrQkFBQSxpQkFBQSxFQUFBLElBQUEsQ0FBQSxrQkFBQTtBQUNIO0FBQ0o7QUExREwsS0FBQTtBQTREQSxNQUFBLHNCQUFBLEVBQUEsRUFBQSxDQUFBLFFBQUEsRUFBdUMsWUFBVztBQUM5QyxZQUFJLHdCQUF3QixFQUFBLDZCQUFBLEVBQTVCLEdBQTRCLEVBQTVCOztBQUVBLFlBQUkseUJBQUosQ0FBQSxFQUFnQztBQUM1QixjQUFBLFVBQUEsRUFBQSxLQUFBLENBQUEsTUFBQTs7QUFFQSx1QkFBVyxZQUFXO0FBQ2xCLGtCQUFBLFVBQUEsRUFBQSxLQUFBLENBQUEsTUFBQTtBQURKLGFBQUEsRUFBQSxJQUFBO0FBR0g7QUFUTCxLQUFBO0FBN0RKLENBQUEiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbigpe2Z1bmN0aW9uIHIoZSxuLHQpe2Z1bmN0aW9uIG8oaSxmKXtpZighbltpXSl7aWYoIWVbaV0pe3ZhciBjPVwiZnVuY3Rpb25cIj09dHlwZW9mIHJlcXVpcmUmJnJlcXVpcmU7aWYoIWYmJmMpcmV0dXJuIGMoaSwhMCk7aWYodSlyZXR1cm4gdShpLCEwKTt2YXIgYT1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK2krXCInXCIpO3Rocm93IGEuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixhfXZhciBwPW5baV09e2V4cG9ydHM6e319O2VbaV1bMF0uY2FsbChwLmV4cG9ydHMsZnVuY3Rpb24ocil7dmFyIG49ZVtpXVsxXVtyXTtyZXR1cm4gbyhufHxyKX0scCxwLmV4cG9ydHMscixlLG4sdCl9cmV0dXJuIG5baV0uZXhwb3J0c31mb3IodmFyIHU9XCJmdW5jdGlvblwiPT10eXBlb2YgcmVxdWlyZSYmcmVxdWlyZSxpPTA7aTx0Lmxlbmd0aDtpKyspbyh0W2ldKTtyZXR1cm4gb31yZXR1cm4gcn0pKCkiLCIkKGRvY3VtZW50KS5yZWFkeShmdW5jdGlvbigpIHtcbiAgICAkKCcjaWRfY29udGluZW50Jykub24oJ2hpZGRlbi5icy5zZWxlY3QnLCBmdW5jdGlvbiAoZSwgY2xpY2tlZEluZGV4LCBuZXdWYWx1ZSwgb2xkVmFsdWUpIHtcbiAgICAgICAgdmFyIGNvbnRpbmVudFNlbGVjdGVkID0gJCh0aGlzKS52YWwoKTtcbiAgICAgICAgLy8gaGlkZSBvcHRpb25zIGZvcm0gY291bnRyeSBtZW51XG4gICAgICAgIHZhciBpbmRleGVzVG9IaWRlID0gW107XG4gICAgICAgICQoJyNpZF9jb3VudHJ5IG9wdGlvbicpLmVhY2goZnVuY3Rpb24gKGluZGV4KSB7XG4gICAgICAgICAgICB2YXIgY29udGluZW50ID0gJCh0aGlzKS52YWwoKS5zcGxpdCgnLicpWzBdO1xuICAgICAgICAgICAgaWYgKGNvbnRpbmVudFNlbGVjdGVkICYmIGNvbnRpbmVudFNlbGVjdGVkLmluZGV4T2YoY29udGluZW50KSA8IDApIHtcbiAgICAgICAgICAgICAgICAvLyBpZiB0aGUgY29udGluZW50IGZvciBhIGNvdW50cnkgaXMgbm90IGZ1bmQgaW4gdGhlIHNlbGVjdGVkIGNvbnRpbmVudHNcbiAgICAgICAgICAgICAgICAvLyB0aGUgY291bnRyeSBpcyBoaWRkZW4gZnJvbSBzZWxlY3RlZC5cbiAgICAgICAgICAgICAgICBpbmRleGVzVG9IaWRlLnB1c2goaW5kZXgpO1xuICAgICAgICAgICAgfVxuICAgICAgICB9KTtcbiAgICAgICAgLy8gZ28gb3ZlciB3aWRnZXQgb3B0aW9ucyBhbmQgaGlkZSBhcyBuZWVkZWQuXG4gICAgICAgIHZhciAkbWVudSA9ICQoJyNpZF9jb3VudHJ5Jykuc2libGluZ3MoJy5kcm9wZG93bi1tZW51JylbMF07XG4gICAgICAgICQoJG1lbnUpLmZpbmQoJ2xpJykuZWFjaChmdW5jdGlvbihpbmRleCkge1xuICAgICAgICAgICBpZiAoaW5kZXhlc1RvSGlkZS5pbmRleE9mKGluZGV4KSA+IC0xKSB7XG4gICAgICAgICAgICAgICAvLyB0aGlzIGVsZW1lbnQgbmVlZHMgdG8gYmUgaGlkZGVuXG4gICAgICAgICAgICAgICAkKHRoaXMpLmFkZENsYXNzKCdoaWRkZW4nKTtcbiAgICAgICAgICAgICAgICQodGhpcykucmVtb3ZlQ2xhc3MoJ3NlbGVjdGVkJyk7XG4gICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAvLyB0aGlzIGVsZW1lbnQgbmVlZHMgdG8gYmUgdmlzaWJsZVxuICAgICAgICAgICAgICAgJCh0aGlzKS5yZW1vdmVDbGFzcygnaGlkZGVuJyk7XG4gICAgICAgICAgIH1cbiAgICAgICAgfSk7XG4gICAgICAgIC8vIHVuc2VsZWN0ZWQgcHJldmlvdXNseSBzZWxlY3RlZCB2YWx1ZXNcbiAgICAgICAgdmFyIHNlbGVjdGVkQ291bnRyaWVzID0gJCgnI2lkX2NvdW50cnknKS52YWwoKSxcbiAgICAgICAgICAgIHZhbGlkU2VsZWN0ZWRDb3VudHJpZXMgPSBbXTtcbiAgICAgICAgaWYgKHNlbGVjdGVkQ291bnRyaWVzICYmIHNlbGVjdGVkQ291bnRyaWVzLmxlbmd0aCkge1xuICAgICAgICAgICAgc2VsZWN0ZWRDb3VudHJpZXMuZm9yRWFjaChmdW5jdGlvbihpdGVtKSB7XG4gICAgICAgICAgICAgICAgdmFyIGNvbnRpbmVudCA9IGl0ZW0uc3BsaXQoJy4nKVswXTtcbiAgICAgICAgICAgICAgICBpZiAoY29udGluZW50U2VsZWN0ZWQgJiYgY29udGluZW50U2VsZWN0ZWQuaW5kZXhPZihjb250aW5lbnQpID4gLTEpIHtcbiAgICAgICAgICAgICAgICAgICAgLy8gY291bnRyeSBpcyBpbiBhIHNlbGVjdGVkIGNvbnRpbmVudCBzbyBpdCBpcyB2YWxpZFxuICAgICAgICAgICAgICAgICAgICB2YWxpZFNlbGVjdGVkQ291bnRyaWVzLnB1c2goaXRlbSk7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfSk7XG4gICAgICAgICAgICAvLyBvbmx5IHZhbGlkIGNvdW50cmllcyBhcmUgc2V0XG4gICAgICAgICAgICAkKCcjaWRfY291bnRyeScpLnZhbCh2YWxpZFNlbGVjdGVkQ291bnRyaWVzKTtcbiAgICAgICAgICAgIC8vIGNoZWNrIHRoYXQgdGhlIHNlbGVjdGVkIGxhYmVsIGlzIGNvcnJlY3RcbiAgICAgICAgICAgIHZhciBidXR0b24gPSAkKCcjaWRfY291bnRyeScpLnNpYmxpbmdzKCdidXR0b24nKVswXSxcbiAgICAgICAgICAgICAgICBzZWxlY3RXaWRnZXRMYWJlbCA9ICQoYnV0dG9uKS5maW5kKCcuZmlsdGVyLW9wdGlvbicpWzBdLFxuICAgICAgICAgICAgICAgIGN1cnJlbnRTZWxlY3Rpb24gPSAkKHNlbGVjdFdpZGdldExhYmVsKS50ZXh0KCksXG4gICAgICAgICAgICAgICAgbGFiZWxTdGlsbFZhbGlkO1xuICAgICAgICAgICAgaWYgKHZhbGlkU2VsZWN0ZWRDb3VudHJpZXMpIHtcbiAgICAgICAgICAgICAgICB2YXIgbnVtVmFsaWRTZWxlY3RlZENvdW50cmllcyA9IHZhbGlkU2VsZWN0ZWRDb3VudHJpZXMubGVuZ3RoO1xuICAgICAgICAgICAgICAgIGlmIChudW1WYWxpZFNlbGVjdGVkQ291bnRyaWVzID09IDEpIHtcbiAgICAgICAgICAgICAgICAgICAgLy8gc2luY2UgdGhlcmUgaXMgb25seSBvbmUgdmFsaWQgY291bnRyeSwgbGV0J3MgZGlzcGxheSB0aGUgY291bnRyeSBuYW1lXG4gICAgICAgICAgICAgICAgICAgICQoYnV0dG9uKS5hdHRyKCd0aXRsZScsIHZhbGlkU2VsZWN0ZWRDb3VudHJpZXNbMF0pO1xuICAgICAgICAgICAgICAgICAgICAkKHNlbGVjdFdpZGdldExhYmVsKS50ZXh0KHZhbGlkU2VsZWN0ZWRDb3VudHJpZXNbMF0pO1xuICAgICAgICAgICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICAgICAgICAgIC8vIGRpc3BsYXkgdGhlIG51bWJlciBvZiBpdGVtcyBzZWxlY3RlZFxuICAgICAgICAgICAgICAgICAgICB2YXIgbGFiZWxNc2cgPSBudW1WYWxpZFNlbGVjdGVkQ291bnRyaWVzICsgJyBpdGVtcyBzZWxlY3RlZCc7XG4gICAgICAgICAgICAgICAgICAgICQoYnV0dG9uKS5hdHRyKCd0aXRsZScsIGxhYmVsTXNnKTtcbiAgICAgICAgICAgICAgICAgICAgJChzZWxlY3RXaWRnZXRMYWJlbCkudGV4dChsYWJlbE1zZyk7XG4gICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgfSBlbHNlIHtcbiAgICAgICAgICAgICAgICAkKGJ1dHRvbikuYXR0cigndGl0bGUnLCAnTm90aGluZyBzZWxlY3RlZCcpO1xuICAgICAgICAgICAgICAgICQoc2VsZWN0V2lkZ2V0TGFiZWwpLnRleHQoJ05vdGhpbmcgc2VsZWN0ZWQnKTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgfVxuICAgIH0pO1xuICAgICQoJyNwcmltYXRlUGFyYXNpdGVEYXRhJykub24oJ3N1Ym1pdCcsIGZ1bmN0aW9uKCkge1xuICAgICAgICB2YXIgZXhjbHVkZVplcm9QcmV2YWxlbmNlID0gJCgnI2lkX2luY2x1ZGVfemVyb19wcmV2YWxlbmNlJykudmFsKCk7XG5cbiAgICAgICAgaWYgKGV4Y2x1ZGVaZXJvUHJldmFsZW5jZSA9PSAxKSB7XG4gICAgICAgICAgICAkKCcjbXlNb2RhbCcpLm1vZGFsKCdzaG93Jyk7XG5cbiAgICAgICAgICAgIHNldFRpbWVvdXQoZnVuY3Rpb24oKSB7XG4gICAgICAgICAgICAgICAgJCgnI215TW9kYWwnKS5tb2RhbCgnaGlkZScpO1xuICAgICAgICAgICAgfSwgNTAwMCk7XG4gICAgICAgIH1cbiAgICB9KTtcbn0pO1xuIl19
