$(".nav-parent").click(function () {
    if ($(this).hasClass("nav-expanded")) {
        $(this).removeClass("nav-expanded").removeClass("nav-active");
    } else {
        $(this).addClass("nav-expanded").addClass("nav-active");
    }
});