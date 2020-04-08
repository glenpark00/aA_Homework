function titleize(names, callback) {
  let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  titleized.forEach(callback);
}

let printCallback = x => console.log(x);
