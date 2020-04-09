console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success: function(data) {
    // console.log("Here's your weather dude, but why didn't you just check your phone?");
    console.log(data);
    let $body = $("body");
    for (let key in data) {
      let $strong = $("<strong>");
      $strong.text(key);
      let $p = $("<p>");
      $p.text(data[key]);
      $body.append($strong);
      $body.append($p);
    }
  }
});

// Add another console log here, outside your AJAX request
console.log("Don't tell AJAX this, but I don't think he's very cool...");