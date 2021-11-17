Feature: test scripts

  Scenario Outline: test

    * def query = { name: '<name>', country: '<country>', active: '<active>', limit: '<limit>' }
    # all this function does is to set any empty string value to null, because that is what empty cells in 'Examples' become
    * def nullify =
    """
    function(o) {
      for (var key in o) {
        if (o[key] == '') o[key] = null;
      }
      return o;
    }
    """
    # here we load a java-script function from a re-usable file
    * def query = nullify(query)
    * print query

    Examples:
      | name | country | active | limit | missing |
      | foo  | IN      | true   |     1 |         |
      | bar  |         |        |     5 | country |
      | baz  | JP      |        |       | active  |
      |      | US      |        |     3 | name    |
      |      |         | false  |       | limit   |