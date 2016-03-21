function add_create_buttons_to_menu(obj){ 
  parent = $(obj).parents(".navbar");
  if ($(parent).find(".Create").length != 0){ 
    location.reload();			
  }
  else {	
    $(parent).find('.nav li').each(function(){
    if ($(this).attr('class')!='Create')
      if ($(this).attr('id')!='edit_menu')
        $(this).append('<button type="button" class="close" onclick="delete_menu_element(this)">&times;</button>');	
    });
    $(parent).find('.nav li').attr('class', 'dropdown').children('a').attr('class', 'dropdown-toggle').attr('data-toggle', 'dropdown');	
    $(parent).find('.nav').first().append('<li class="Create"><a class="Create" href="/menus/new?id=">Create+</a></li>');
    $(parent).find('.dropdown-menu').each(function(){
      $(this).append('<li class="Create"><a  class="Create" href="/menus/new?id='+$(this).parent().attr('id')+'">Create+</a></li>');		
    });			
    if ($(obj).parents(".content").length>0){
      $(parent).find(".Create a").attr("href",'/menus/new?id='+$(this).parent().attr('id')+"&role_id="+$('#menu_role_id').val());
    }	
    $(obj).html("Finish Edit");	
  }
}	
function create_new_menu_element(obj){
  if ($(obj).parents(".dropdown").attr('id'))
    parent=$(obj).parents(".dropdown").attr('id');
  else parent='';
  $.ajax({
    url: "/render_form_for_menu",
    type: "POST",
    beforeSend: function ( xhr ) {
      xhr.setRequestHeader("X-CSRF-Token", $('meta[name=csrf-token]').attr('content'));
    },
    data: {
      "parent_id": parent,
      "role_id": $('#menu_role_id option:selected').val(),
      "user_id": current_user.id
    },
    dataType: "html",
    success: function(data) {
      $('#menuForm').html(data);
    }
  });
}
$(function (){
  $('.draggables').sortable();
});
function delete_menu_element(obj){
  $.ajax({
    url: "/delete_menu_item",
    type: "GET",
    beforeSend: function ( xhr ) {
      xhr.setRequestHeader("X-CSRF-Token", $('meta[name=csrf-token]').attr('content'));
    },
    data: {"menu_item_id" : $(obj).parent().attr('id')},
    dataType: "json",
    success: function(data) {
      $(obj).parent().remove();
    }
  }); 
}

function getUrl(){
  var currentUrl = window.location.href.replace (/^[a-z]{4}\:\/{2}[a-z]{1,}\:[0-9]{1,4}.(.*)/, '$1');
  $('#url').val("/"+currentUrl);
}
function renderForm(val){
  $.ajax({
    url: "/render_menu",
    type: "GET",
    beforeSend: function ( xhr ) {
      xhr.setRequestHeader("X-CSRF-Token", $('meta[name=csrf-token]').attr('content'));
    },
    data: {"role_id": val},
    dataType: "html",
    success: function(data) {
      $('#menuManage').html(data);
    }
  });
}