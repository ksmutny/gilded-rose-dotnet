Feature: Backstage Passes quality

  Scenario Outline: increases the more the sooner the concert
      - increases by 1 when there are more than 10 days to the concert
      - increases by 2 when there are 10 days or less to the concert
      - increases by 3 when there are 5 days or less to the concert

    Given an <item> with quality <quality> to be sold by <sell-by> days
    When a day passes
    Then the quality should be increased by <increase>
    And the sell-by should be decreased by 1
    Examples:
      | item                                      | quality | sell-by | increase |
      | Backstage passes to a TAFKAL80ETC concert | 20      | 15      | 1        |
      | Backstage passes to a TAFKAL80ETC concert | 20      | 11      | 1        |
      | Backstage passes to a TAFKAL80ETC concert | 10      | 10      | 2        |
      | Backstage passes to a TAFKAL80ETC concert | 10      | 6       | 2        |
      | Backstage passes to a TAFKAL80ETC concert | 5       | 5       | 3        |
      | Backstage passes to a TAFKAL80ETC concert | 5       | 1       | 3        |

  Scenario Outline: drops to 0 after the concert
    Given an <item> with quality <quality> overdue by <overdue> days
    When a day passes
    Then the quality should be 0
    And the sell-by should be decreased by 1
    Examples:
      | item                                      | quality | overdue |
      | Backstage passes to a TAFKAL80ETC concert | 20      | 0       |
      | Backstage passes to a TAFKAL80ETC concert | 10      | 1       |
      | Backstage passes to a TAFKAL80ETC concert | 5       | 10      |

  Scenario Outline: never increases above 50
    Given an <item> with quality <quality> to be sold by <sell-by> days
    When a day passes
    Then the quality should be 50
    And the sell-by should be decreased by 1
    Examples:
      | item                                      | quality | sell-by |
      | Backstage passes to a TAFKAL80ETC concert | 50      | 15      |
      | Backstage passes to a TAFKAL80ETC concert | 49      | 11      |
      | Backstage passes to a TAFKAL80ETC concert | 49      | 10      |
      | Backstage passes to a TAFKAL80ETC concert | 49      | 5       |
