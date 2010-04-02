jQuery(document).ready(function(){
  
  $.postJSON = function(url, data, callback){
    if ($.isFunction(data)){
  		callback = data;
  		data = '';
  	}

  	$.post(url, data + '&format=json', function(json){
  	  callback(eval('('+ json +')'));
    });
  };
  
  game = {
    start:   $('#slapping_start'),
    timer:   $('#slapping_timer'),
    info:    $('#slapping_info'),
    end:     $('#slapping_end'),
    slapped: $('#slapped'),
    form:    $('#new_slapper') 
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
      count = parseInt(counter.text()) + 1;
      $('#slapper_people_slap_number_' + slapped_picture.attr('name')).val(count);
      counter.text(count);
      
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
    
    game.form.submit(function(e){
      e.preventDefault();
      
      $.postJSON(game.form.attr('action'), game.form.serialize(), function(data){
        console.log(data);
      });
    });
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