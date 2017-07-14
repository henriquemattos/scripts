var alert = '<div class="alert alert-dismissible fade in" role="alert">'
  + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>'
  + '</div>';
jQuery(document).ready(function(){
  jQuery('form').on('submit', function(e){
    e.preventDefault();
    jQuery.ajax({
      url: 'createdb.php',
      async: true,
      cache: false,
      data: jQuery(this).serialize(),
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      context: document.body,
      dataType: 'json',
      method: 'POST',
      beforeSend: function(jqXHR, settings){
        jQuery('.alert-dismissible').alert('close');
      },
      success: function(data, textStatus, jqXHR){
        var msg = '<p>' + textStatus + ': ' + data.response + '</p>';
        jQuery('#alert').prepend(jQuery(alert).append(msg).addClass('alert-success').alert());
      },
      complete: function(jqXHR, textStatus){
      },
      error: function(jqXHR, textStatus, errorThrown){
        var msg = '<p>' + textStatus + ': ' + errorThrown + '</p>';
        jQuery('#alert').prepend(jQuery(alert).append(msg).addClass('alert-danger').alert());
      }
    })
  });
});
