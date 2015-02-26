$(document).ready(function(){
  $("li .nonlogo").mouseover(function(){
   $("li p").stop().slideDown("slow");
  });
  $("li .nonlogo").mouseout(function(){
   $("li p").slideUp("slow");
  });
 });
