jQuery(document).ready(function(){
  
  game = {
    start:   $('#slapping_start'),
    timer:   $('#slapping_timer'),
    info:    $('#slapping_info'),
    end:     $('#slapping_end'),
    slapped: $('#slapped')
  }
  
  game.start.click(function(){    
    enableSlapping();
  });

  enableSlapping = function(){
    game.start.hide();
    
    game.timer.show();
    startTimer();
    
    game.info.show();
    
    game.slapped.find('.picture_to_slap').click(function(){
      var self = $(this);
      var slapped = $(this).parents('li');
      var counter = slapped.find('.slapped_counter')
      var slapped_picture = slapped.find('.slapped_picture');
      
      // Increment slap counter
      counter.text(parseInt(counter.text()) + 1);
      
      // Show / hide slapped picture
      self.hide();
      slapped_picture.show();
      
      setTimeout(function(){
        self.show();
        slapped_picture.hide();
      }, 200);
    });
  };
  
  disableSlapping = function(){
    game.slapped.find('.picture_to_slap').unbind('click');
    
    game.info.hide();
    
    game.end.show();
  };
  
  startTimer = function(){
    var start_time = 10;
    
    timer = setInterval(function(){
      start_time = Math.round((start_time - 0.01) * 100) / 100;
      game.timer.find('span span').html(start_time);
      if (start_time <= 0){
        clearInterval(timer);
        disableSlapping();
      }
    }, 10);
  };
  
});