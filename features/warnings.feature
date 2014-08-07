Feature: Throw warnings when scan a project

    In order to find/delete all unused images in a Xcode project
    As a developer using Xcode
    I want to Xcode show warnings while build the project

    Scenario: Main
        When I run `unused_images`
        Then the exit status should be 0
