$(function(){
  $('input[name=date]').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $('input[data-field]').on({
    click: function(){
      var result = 0;
      var field = $(this).data('field');
      var input = $('#' + field)
      var value = parseInt($(this).data('value'));
      if(value !== 0) {
        var input_value = parseInt(input.val()) || 0;
        result = input_value + value
      }

      input.val(result);
    }
  });
});
