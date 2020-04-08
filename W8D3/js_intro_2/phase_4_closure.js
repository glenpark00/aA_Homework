let dinerBreakfast = function () {
  let order = ["cheesy scrambled eggs"];
  console.log(`I'd like ${order} please`);
  return function (food) {
    order.push(food);
    return `I'd like ${order.join(' and ')} please`; 
  };
};

bfastOrder = dinerBreakfast();
// "I'd like cheesy scrambled eggs please")
console.log(bfastOrder("chocolate chip pancakes"));
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please")
console.log(bfastOrder("grits"));
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please")