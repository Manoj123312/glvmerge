Feature: Client and meeting management
  As a project coordinator
  I want to manage clients and schedule meetings
  So that projects run smoothly for each client

  Scenario: Register a new client with valid details
    Given the user is on the client registration page
    When the user enters a valid name, email, and address
    And the user enters matching password and repeat password values
    And the user clicks the Register button
    Then the client should be added to the registered client list
    And a confirmation message should be shown

  Scenario: Prevent registration with password mismatch
    Given the user is on the client registration page
    When the user enters valid client details
    And the user enters different password and repeat password values
    And the user clicks the Register button
    Then the client should not be added to the registered client list
    And a password mismatch error should be shown

  Scenario: Schedule a client meeting
    Given at least one client exists in the system
    When the user enters meeting topic, number of people, start time, and client email
    And the user clicks the Schedule button
    Then the meeting should be added to the meeting schedule list
    And a meeting scheduled confirmation should be shown
