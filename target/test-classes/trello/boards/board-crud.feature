Feature: board test script
  Background: config
    * url url
    * def requestBody =
    """
    {
      "name":"CreadoDesdeKarate"
    }
    """
    * configure headers = _headers
    * def jsonData = read('data/jph.json')
    #* def data = 1>2 ? karate.call('jph.feature@getUsers') : karate.call('jph.feature@getPosts')
    * def data = call read('jph.feature@getUsers')
    * def status = data.responseStatus
    * print status

  Scenario: create board
    * def jsonResponse =
    """
    {
    "id":"#string",
    "name":"#string",
    "desc":"#string",
    "descData":"#null",
    "closed":"#boolean",
    "idOrganization":"#string",
    "idEnterprise":"#null",
    "pinned":#boolean,
    "url":"#string",
    "shortUrl":"#string",
    "prefs":{
       "permissionLevel":"#string",
       "hideVotes":"#boolean",
       "voting":"#string",
       "comments":"#string",
       "invitations":"#string",
    "selfJoin":"#boolean",
       "cardCovers":"#boolean",
       "isTemplate":"#boolean",
       "cardAging":"#string",


       "calendarFeedEnabled":"#boolean",
       "isPluginHeaderShortcutsEnabled":"#boolean",
       "enabledPluginBoardButtons":"#array",
       "background":"#string",
       "backgroundImage":"#null",
       "backgroundImageScaled":"#null",
       "backgroundTile":"#boolean",
       "backgroundBrightness":"#string",
       "backgroundColor":"#string",
       "backgroundBottomColor":"#string",
       "backgroundTopColor":"#string",
       "canBePublic":"#boolean",
       "canBeEnterprise":"#boolean",
       "canBeOrg":"#boolean",
       "canBePrivate":"#boolean",
       "canInvite":"#boolean"
    }
    ,
    "labelNames":{
       "green":"#string",
       "yellow":"#string",
       "orange":"#string",
       "red":"#string",
       "purple":"#string",
       "blue":"#string",
       "sky":"#string",
       "lime":"#string",
       "pink":"#string",
       "black":"#string"
    },
    "limits":"#object"

 }
    """
    * def boardsResponse = call read('boards-post.feature@create')
    * def boardId = boardsResponse.response.id
    * match boardsResponse.response contains jsonResponse
    * print boardsResponse.responseStatus
    * print boardsResponse.responseCookies
    * print boardsResponse
    * def boardsResponse = (boardsResponse.responseStatus == 200) ? karate.call('classpath:some-reusable.feature@deleteBoard'):karate.call('classpath:some-reusable.feature@deleteBoardWithTime')
    * def suma = 1>2 ? function suma(cadena,separator){return cadena.split(separator)}: read('classpath:some-classpath-function.js')
    #* def suma = read('classpath:some-classpath-function.js')
    * def cadena = "1|2|3|4|5"
    * def array = suma(cadena,'|')
    * print array
    * def random = new Java.type('Utiles')
    * print random.getMessage('danilo efrain')

  @ignore
  Scenario Outline: create a board from api response
    * requestBody.name =  '<name>'
    * def boardsResponse = call read('boards-post.feature@create')
    * def boardId = boardsResponse.response.id
    * def boardsResponse = call read('boards-delete.feature@delete')
    Examples:
      |karate.jsonPath(jsonData,"$[?(@.id<5)]")|

  @ignore
  Scenario Outline: create a board from json data
    * requestBody.name = '<name>'
    * def boardsResponse = call read('boards-post.feature@create')
    * def boardId = boardsResponse.response.id
    * def boardsResponse = call read('boards-delete.feature@delete')
    Examples:
      |karate.jsonPath(jsonData,"$[?(@.id>5)]")|

  @ignore
  Scenario: update board
    * def boardsResponse = call read('boards-post.feature@create')
    * requestBody.name = "ActualizadoDesdeKarate"
    * def boardId = boardsResponse.response.id
    * def boardsResponse = call read('boards-put.feature@put')
    * def boardsResponse = call read('boards-delete.feature@delete')

  @ignore
  Scenario: get a board
    * def boardsResponse = call read('boards-post.feature@create')
    * def boardId = boardsResponse.response.id
    * def boardsResponse = call read('boards-get.feature@get')
    * def boardsResponse = call read('boards-delete.feature@delete')