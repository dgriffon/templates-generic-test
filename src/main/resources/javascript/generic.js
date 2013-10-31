!function ($) {

    $(function(){

        var $window = $(window)

        // make code pretty
        window.prettyPrint && prettyPrint()

        // tooltip
        $("a[data-toggle=tooltip]").tooltip();
        // popover demo
        $("a[data-toggle=popover]")
            .popover()
            .click(function(e) {
                e.preventDefault()
            })
    })

}(window.jQuery)