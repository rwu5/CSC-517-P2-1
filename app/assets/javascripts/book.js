jQuery(function () {
    var libraries;
    libraries = $('#book_library_id').html();
    return $('#book_university_id').change(function () {
        var university, options;
        university = $('#book_university_id :selected').text();
        options = $(libraries).filter("optgroup[label=" + university + "]").html();
        if (options) {
            return $('#book_library_id').html(options);
        } else {
            return $('#book_library_id').empty();
        }
    });
});