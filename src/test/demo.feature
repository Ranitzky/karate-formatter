Feature: Star Wars API
Background: 
Given url 'https://swapi.dev/api/'
Scenario: Character

    Given path 'people/1'
      When method get
   Then status 200
     And match response.name == "Luke Skywalker"


  Scenario: Species
    Given path 'species/3/'
     When method get
      Then status 200
                And match response.films == '#array'


Scenario Outline: Films
    Given path '/films/<id>'
    When method get
     Then status 200
                And match response.title == <title>
                  And match response.release_date == <release_date>

    Examples:
      | id | title | release_date |
          | 1 | "A New Hope" | "1977-05-25"     |
      | 4 | "The Phantom Menace"    | "1999-05-19" |
    | 6 | "Revenge of the Sith" | "2005-05-19"                               |                

  Scenario: Docstrings with quotes
  Given path '/films/1/'
  * def opening_crawl = 
  """
    "It is a period of civil war.\n\nRebel spaceships, striking\n\nfrom a hidden base, have won\n\ntheir first victory against\n\nthe evil Galactic Empire.\n\n\n\nDuring the battle, Rebel\n\nspies managed to steal secret\r\nplans to the Empire's\n\nultimate weapon, the DEATH\n\nSTAR, an armored space\n\nstation with enough power\n\nto destroy an entire planet.\n\n\n\nPursued by the Empire's\n\nsinister agents, Princess\n\nLeia races home aboard her\n\nstarship, custodian of the\n\nstolen plans that can save her\n\npeople and restore\n\nfreedom to the galaxy...."
        """
    When method get
     Then status 200
      And response.opening_crawl = opening_crawl

    Scenario: Docstrings with backticks
    Given path 'starships/9/'
    * def manufacturer =
    ```
"Imperial Department of Military Research, Sienar Fleet Systems"
```
When method get
Then status 200
 And response.manufacturer = manufacturer
 