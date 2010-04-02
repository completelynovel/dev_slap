jQuery(document).ready(function(){
  
  game = {
    start:   $('#slapping_start'),
    timer:   $('#slapping_timer'),
    info:    $('#slapping_info'),
    end:     $('#slapping_end'),
    slapped: $('#slapped')
  }
  
  game.start.click(function(){
    game.start.hide();
    
    game.timer.show();
    
    startTimer();
    
    game.info.show();
    
    enableSlapping();
  });
  
  startTimer = function(){
    var start_time = 10;
    
    timer = setInterval(function(){
      start_time = Math.round((start_time - 0.01) * 100) / 100;
      game.timer.html(start_time + 'sec');
      if (start_time <= 0){
        clearInterval(timer);
        disableSlapping();
      }
    }, 10);
  };
  
  enableSlapping = function(){
    game.slapped.find('.picture_to_slap').click(function(){
      var self = $(this);
      var slapped = $(this).parents('li');
      var counter = slapped.find('.slapped_counter')
      var slapped_picture = slapped.find('.slapped_picture');
      
      // Increment slap counter
      counter.text(parseInt(counter.text()) + 1);
      
      // 
      slapped_picture.show();
      self.hide();
      
      setTimeout(function(){
        slapped_picture.hide();
        self.show();
      }, 100);
    });
  };
  
  disableSlapping = function(){
    game.slapped.find('.picture_to_slap').unbind('click');
  };
  
});