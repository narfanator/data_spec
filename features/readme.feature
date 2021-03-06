Feature: Readme Examples

  Scenario: Matching
    Given the data is:
    """
    chunky: bacon
    """
    Then the data should be:
    """
    {
      "chunky": "bacon"
    }
    """
  Scenario: Path Selection
    Given the data is:
    """
    interleaved:
    - hashes:
        and:
        - arrays
    """
    Then the data at "interleaved/0/hashes" should be:
    """
    and:
    - arrays
    """

  Scenario: Inclusion
    Given the data is:
    """
    - 1
    - 2
    - 3
    - even:
        'in a': hash
        'with only': some keys
    """
    Then the data should include:
    """
    - 1
    - 2
    """
    And the data at "3/even" should include "'in a': hash"

  Scenario: Type Checking
    Given the data is:
    """
    - bacon
    - 1
    - 2013-07-06 20:09:32.824102000 -07:00
    """
    Then the data at "0" should be of type String
    Then the data at "1" should be of type Fixnum
    Then the data at "2" should be of type Time

  Scenario: Embedded Code
    Given the data is:
    """
    - `1+1`
    - '$1e2$'
    - `"bacon".class`
    """
    Then the data at "0" should be "2"
    Then the data at "1" should be "100"
    Then the data at "2" should be "`"chunky".class`"

  Scenario: Memory
    Given `@samples` is:
    """
    where: "http://google.com"
    when: `Time.now`
    """
    And `@samples` includes:
    """
    what: {}
    """
    And `@samples['what']` is:
    """
    - chunky
    - bacon
    """
    And the data is:
    """
    meal: 
      main_course: `@samples['what'][1]`
      style: `@samples['what'][0]`
      ordered: `@samples['when']`
    """
    Then the data should be:
    """
    meal:
      main_course: bacon
      style: chunky
      ordered: `@samples['when']`
    """
