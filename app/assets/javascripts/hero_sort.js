$(document).ready(function(){

    $('#female').click(function(){
      $('.female').show();
      $('.male').hide();
    })

    $('#male').click(function(){
      $('.female').hide();
      $('.male').show();
    })

    $('#all').click(function(){
      $('.female').show();
      $('.male').show();
    })

  });



//   function toggleCategory(genderButton, superheroID){
//     var currentHeroes = $(this).value;
    
 
//   }

//   function toggleAllCategory(){
//     $(".all").click(function(){
//       $(".filtered-heroes").toggleClass("hidden");
//     });
// }  



  // toggleCategory("#female", ".gender_female")
  // toggleCategory("#male", ".gender_male")
  // toggleAllCategory()

