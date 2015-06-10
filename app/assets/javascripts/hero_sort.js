$(document).ready(function(){

  $('#female').click(function(){
    var chickPower = $(this).attr('female')
    var characters = $('.filtered-heros');

      $.ajax({
        type: 'GET',
        url:   '/superheroes',
        
      })

  })
});