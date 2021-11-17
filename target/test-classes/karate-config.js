function fn() {
  var env = karate.env; // get system property 'karate.env'
  var company = karate.properties['foo']
  karate.log('karate.env system property was:', env);
  karate.log('karate.company system property was:', company);

  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    url:'https://trello.com/1/',
    key:'38e7987a4fa0c6195e8c27df9d27c099',
    token:'25c156a6489e519ab5e799bfbf14601721a4438835ea2c1efbb9cca7c4248ad3',
    _headers: { 'Accept': 'application/json','transaction-id':'test212211'}
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
    config.url = 'https://api.trello.com/1/'
  }
  return config;
}