Feature: Aged Brie quality

  Scenario Outline: increases by 1 each day until sell-by date
    Given an <item> with quality <quality> to be sold by <sell-by> days
    When a day passes
    Then the quality should be increased by 1
    And the sell-by should be decreased by 1
    Examples:
      | item                   | sell-by | quality |
      | Aged Brie              | 1       | 10      |
      | Aged Brie              | 5       | 25      |

  Scenario Outline: increases by 2 each day after sell-by date
    Given an <item> with quality <quality> overdue by <overdue> days
    When a day passes
    Then the quality should be increased by 2
    And the sell-by should be decreased by 1
    Examples:
      | item                   | overdue | quality |
      | Aged Brie              | 0       | 10      |
      | Aged Brie              | 1       | 25      |

  Scenario Outline: never increases above 50
    Given an <item> with quality <quality> <before-after> <sell-by> days
    When a day passes
    Then the quality should be 50
    And the sell-by should be decreased by 1
    Examples:
      | item                   | before-after  | sell-by | quality |
      | Aged Brie              | to be sold by | 1       | 50      |
      | Aged Brie              | overdue by    | 5       | 50      |
