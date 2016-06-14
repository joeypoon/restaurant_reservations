$(document).ready(function() {
  $(function () {
    $('#datetimepicker').datetimepicker({
      minDate: new Date(),
      format: 'YYYY/MM/DD hhA ZZ'
    });
  });
})