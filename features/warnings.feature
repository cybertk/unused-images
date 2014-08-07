Feature: Throw warnings when scan a project

    In order to find/delete all unused images in a Xcode project
    As a developer using Xcode
    I want to Xcode show warnings while build the project

    Scenario: Scan a project with 1 unused png and 1 used png
       Given a xcode project named "Test"
         And an image named "unused.png"
         And an image named "used.png"
         And a project file named "source.mm" with:
             """
             UIImage *image = [UIImage imageNamed:@"used"];
             """
        When I run `unused_images`
        Then the exit status should be 0
         And the stdout should contain:
             """
             unused.png:: warning: unused.png is unused
             """
