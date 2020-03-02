function () {

  var config = {
      baseUrl : 'https://gorest.co.in'
    };

  karate.configure('connectTimeout', 30000);
  karate.configure('readTimeout', 60000);
  karate.configure('logPrettyResponse', true);
  karate.configure('logPrettyRequest', true);

  return config;
}