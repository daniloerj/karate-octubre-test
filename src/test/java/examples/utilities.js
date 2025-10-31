function fn() {
  var utils = {};
  utils.getCurrentTimestamp = function() {
    return new Date().toISOString();
  };
  utils.generateRandomEmail = function() {
    var randomString = Math.random().toString(36).substring(7);
    return 'test.' + randomString + '@example.com';
  };

  utils.generateRandomUsername = function() {
    var randomString = Math.random().toString(36).substring(7);
    return 'user_' + randomString;
  }

  utils.generateRandomPassword = function() {
    var randomString = Math.random().toString(36).substring(7);
    return 'pass_' + randomString;
  }

  utils.generateNumberInRange = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  return utils;
}