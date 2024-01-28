Feature: Normal Item quality

  Scenario Outline: decreases by 1 each day until sell-by date
    Given an <item> with quality <quality> to be sold by <sell-by> days
    When a day passes
    Then the quality should be decreased by 1
    And the sell-by should be decreased by 1
    Examples:
      | item                   | sell-by | quality |
      | +5 Dexterity Vest      | 1       | 20      |
      | Elixir of the Mongoose | 5       | 7       |

  Scenario Outline: decreases by 2 each day after sell-by date
    Given an <item> with quality <quality> overdue by <overdue> days
    When a day passes
    Then the quality should be decreased by 2
    And the sell-by should be decreased by 1
    Examples:
      | item                   | overdue | quality |
      | +5 Dexterity Vest      | 0       | 10      |
      | Elixir of the Mongoose | 1       | 3       |

  Scenario Outline: never decreases below 0
    Given an <item> with quality <quality> <before-after> <sell-by> days
    When a day passes
    Then the quality should be 0
    And the sell-by should be decreased by 1
    Examples:
      | item                   | before-after  | sell-by | quality |
      | +5 Dexterity Vest      | to be sold by | 1       | 0       |
      | Elixir of the Mongoose | overdue by    | 5       | 0       |
