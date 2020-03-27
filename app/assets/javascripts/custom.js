document.addEventListener("turbolinks:load", function() {
    $('.color-link').each(function() {
        if ($(this).prop('href') == window.location.href) {
            $(this).addClass('current');
        }
    });
});