window.addEventListener('load', function() {
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
  $(".js-activate").click(function() {
    let userId = $(this).data('id');
    $(`.js-inactivate[data-id="${userId}"]`).show();
    $(this).hide();
    $.ajax({
      url: `http://localhost:3000/users/${userId}/activate`,
      method: "PUT"
    }); 
  });

  $(".js-inactivate").click(function() {
    let userId = $(this).data('id');
    $(`.js-activate[data-id="${userId}"]`).show();
    $(this).hide();
    $.ajax({
      url: `http://localhost:3000/users/${userId}/inactivate`,
      method: "PUT",
    }); 
  });
});